package fpgamshr.reqhandler.cuckoo.variablelength

import chisel3._
import fpgamshr.interfaces._
import fpgamshr.util._
import chisel3.util._
import fpgamshr.profiling._
import chisel3.core.dontTouch


class AddrDataBufferParamsIO(val addrWidth: Int, val dataBufferAddrWidth: Int, val burstLenWidth: Int)
  extends ModularBundle with HasAddr with HasDataBufferParams {
    override def cloneType = (new AddrDataBufferParamsIO(addrWidth, dataBufferAddrWidth, burstLenWidth)).asInstanceOf[this.type]
}

class BurstParamsIO(val dataBufferAddrWidth: Int, val burstLenWidth: Int)
  extends ModularBundle with HasBurstParams {
    override def cloneType = (new BurstParamsIO(dataBufferAddrWidth, burstLenWidth)).asInstanceOf[this.type]
}

class RowLengthIO(val dataBufferAddrWidth: Int, val burstLenWidth: Int)
  extends ModularBundle with HasDataBufferParams {
    override def cloneType = (new RowLengthIO(dataBufferAddrWidth, burstLenWidth)).asInstanceOf[this.type]
}

object DataBuffer {
  val pipelineLatency = 2
  val minAddrWidthForBRAM = 6
}

/* Input address: cache line tag (full address except for offset within cache line)
   Cache line tag = Cat(burst tag, burst offset), where burst offset has
   burstLenWidth bits. */
class DataBuffer(reqAddrWidth: Int, reqDataWidth: Int, memDataWidth: Int, burstLenWidth: Int, dataBufferAddrWidth: Int) extends Module {
  val maxBurstLen = 1 << burstLenWidth
  val depth = 1 << dataBufferAddrWidth
  val offsetWidth = log2Ceil(memDataWidth/reqDataWidth)
  val cacheLineTagWidth = reqAddrWidth - offsetWidth
  val burstTagWidth = cacheLineTagWidth - burstLenWidth
  val io = IO(new Bundle{
    val inData = Flipped(DecoupledIO(new AddrDataLastIO(cacheLineTagWidth, memDataWidth)))
    // burstLen will actually be burst length-1, as in AXI
    val outDealloc = DecoupledIO(new AddrDataBufferParamsIO(burstTagWidth, dataBufferAddrWidth, burstLenWidth))
    val inReq = Flipped(ValidIO(UInt(dataBufferAddrWidth.W)))
    val outData_2 = ValidIO(UInt(memDataWidth.W))
    val inDataPipelineEnable = Input(Bool())
    val inDeallocRows = Flipped(ValidIO(UInt(burstLenWidth.W)))
  })

  def getBurstOffset(addr: UInt): UInt = addr(burstLenWidth-1, 0)
  def getBurstTag(addr: UInt): UInt = addr(cacheLineTagWidth-1, burstLenWidth)

  val inData = ElasticBuffer(io.inData)
  val outDealloc = Wire(DecoupledIO(io.outDealloc.bits.cloneType))
  io.outDealloc <> ElasticBuffer(outDealloc)
  val inDeallocRows = io.inDeallocRows

  val bufferType = if(dataBufferAddrWidth >= DataBuffer.minAddrWidthForBRAM) "block" else "distributed"
  val buffer = Module(new XilinxSimpleDualPortNoChangeBRAM(width=memDataWidth, depth=depth, ramStyle=bufferType))
  buffer.defaultBindings(clock, reset)
  val wrEn = Wire(Bool())
  val (enqPtr, _) = Counter(wrEn, depth)

  val elemCounter = ArbitraryIncrementWrappingCounter(maxVal=depth,
    en=(wrEn | inDeallocRows.valid),
    // normally, on a deallocation, we should decrement by burstLen+1
    // if wrEn is set, we decrement by burstLen+1-1 = burstLen
    delta=(Mux(inDeallocRows.valid, -(inDeallocRows.bits + Mux(wrEn, 0.U((burstLenWidth + 1).W), 1.U((burstLenWidth + 1).W))).asSInt, 1.S)))
  val full = elemCounter === depth.U
  val empty = elemCounter === 0.U
  /* elemCounter should never wrap around */
  Assert(clock, reset, ~(RegNext(inDeallocRows.valid, init=false.B) & (elemCounter > RegNext(elemCounter))), "elemCounter in data buffer should never wrap around")
  Assert(clock, reset, ~io.inReq.valid | Mux(elemCounter(dataBufferAddrWidth-1, 0) <= enqPtr,
    (io.inReq.bits >= (enqPtr - elemCounter(dataBufferAddrWidth-1, 0))) & (io.inReq.bits < enqPtr),
    (io.inReq.bits >= (enqPtr - elemCounter(dataBufferAddrWidth-1, 0))) | (io.inReq.bits < enqPtr)) |
    full,
    "must read only allocated entries in the data buffer")
  inData.ready := (outDealloc.ready | ~(inData.valid & inData.bits.isLast)) & ~full

  buffer.write(wrAddr=enqPtr, wrData=inData.bits.data, wrEn=wrEn)
  wrEn := inData.fire()

  val previousBurstCompleted = RegInit(true.B)
  // previousBurstCompleted := (inData.fire() & inData.bits.isLast) | ~inData.valid
  val currentDealloc = Reg(io.outDealloc.bits.cloneType)
  val DEBUG_hangDetectorCounter = ExclusiveUpDownWrappingCounter(maxVal=32768,
    upDownN=true.B, en=(~inData.ready),
    load=inData.ready,
    loadValue=0.U)
  dontTouch(DEBUG_hangDetectorCounter)
  outDealloc.valid := false.B
  outDealloc.bits := DontCare
  when(inData.fire()) {
    when(previousBurstCompleted) {
      when(inData.bits.isLast) {
        /* Burst with one element: forward directly to outDealloc bypassing
        * currentDealloc */
        outDealloc.valid := true.B
        outDealloc.bits.addr := getBurstTag(inData.bits.addr)
        outDealloc.bits.dataBufferAddr := enqPtr
        outDealloc.bits.burstLen := 0.U
        outDealloc.bits.burstStart := getBurstOffset(inData.bits.addr)
      } .otherwise {
        /* Starting a multi-beat burst */
        currentDealloc.addr := getBurstTag(inData.bits.addr)
        currentDealloc.dataBufferAddr := enqPtr
        currentDealloc.burstStart := getBurstOffset(inData.bits.addr)
        /* We store the actual burst length (not -1) so that, when the last
         * beat arrives, we can assign burstLen as it is to outDealloc without
         * incrementing it */
        currentDealloc.burstLen := 1.U
        previousBurstCompleted := false.B
      }
    } .otherwise {
      when(inData.bits.isLast) {
        /* Finishing a multi-beat burst */
        outDealloc.valid := true.B
        outDealloc.bits := currentDealloc
        previousBurstCompleted := true.B
      } .otherwise {
        /* Received a new beat of a multi-beat burst, but not the last */
        currentDealloc.burstLen := currentDealloc.burstLen + 1.U
      }
    }
  }
  io.outData_2.bits := buffer.read(rdAddr=io.inReq.bits, rdEn=io.inDataPipelineEnable)
  io.outData_2.valid := ShiftRegister(in=io.inReq.valid,
    n=DataBuffer.pipelineLatency,
    resetData=false.B,
    en=io.inDataPipelineEnable)

}

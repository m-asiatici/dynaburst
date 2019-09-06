package fpgamshr.extmemarbiter

import chisel3._
import chisel3.util._
import fpgamshr.util._
import fpgamshr.interfaces._
import fpgamshr.crossbar.{OneWayCrossbar, OneWayCrossbarGeneric}

import java.io.{File, BufferedWriter, FileWriter} // To generate the BRAM initialization files

import scala.collection.mutable.ArrayBuffer

object ExternalMemoryArbiter {
    val memAddrWidth = 32
    val reqAddrWidth = 32
    val memAddrOffset = 0x00000000
    val memDataWidth = 512
    val memIdWidth = 5

    val numReqHandlers = 4

    val bramLatency = 2
}

object InOrderExternalMemoryArbiter {
  val maxInFlightRequests = 128
}

class InOrderExternalMemoryArbiter(reqAddrWidth: Int=ExternalMemoryArbiter.reqAddrWidth, memAddrWidth: Int=ExternalMemoryArbiter.memAddrWidth, memDataWidth: Int=ExternalMemoryArbiter.memDataWidth, memIdWidth: Int=ExternalMemoryArbiter.memIdWidth, numReqHandlers: Int=ExternalMemoryArbiter.numReqHandlers, maxInFlightRequests: Int=InOrderExternalMemoryArbiter.maxInFlightRequests, memAddrOffset: Long=ExternalMemoryArbiter.memAddrOffset) extends ExternalMemoryArbiterBase(reqAddrWidth, 0, memAddrWidth, memDataWidth, memIdWidth, numReqHandlers, 1) {
  val inputArbiter = Module(new ResettableRRArbiter(UInt(cacheLineTagWidth.W), numReqHandlers))
  for (i <- 0 until numReqHandlers) inputArbiter.io.in(i) <> io.inReq(i)

  val selectedDataAndChosen = Wire(DecoupledIO(new DataAndChosenIO(inputArbiter.io.out.bits.getWidth, inputArbiter.io.chosen.getWidth)))
  selectedDataAndChosen.valid := inputArbiter.io.out.valid
  inputArbiter.io.out.ready := selectedDataAndChosen.ready
  selectedDataAndChosen.bits.data := inputArbiter.io.out.bits
  selectedDataAndChosen.bits.chosen := inputArbiter.io.chosen
  /* This is not really required but we use it in order to make the output irrevocable,
   * something which is apparently required by Xilinx AXI IPs */
  val inputEb = ElasticBuffer(selectedDataAndChosen)
  val fullAddressWithoutOffset = Cat(inputEb.bits.data, inputEb.bits.chosen)
  val memInterfaceManager = Module(new MemoryInterfaceManager(cacheLineTagWidth + handlerAddrWidth, 0, offsetWidth, memAddrWidth, memDataWidth, memIdWidth, maxInFlightRequests, memAddrOffset))
  memInterfaceManager.io.enq.valid := inputEb.valid
  memInterfaceManager.io.enq.bits := fullAddressWithoutOffset
  inputEb.ready := memInterfaceManager.io.enq.ready
  io.outMem(0).ARVALID := memInterfaceManager.io.outMemReq.valid
  io.outMem(0).ARADDR  := memInterfaceManager.io.outMemReq.bits
  memInterfaceManager.io.outMemReq.ready := io.outMem(0).ARREADY
  memInterfaceManager.io.inMemData.valid := io.outMem(0).RVALID
  memInterfaceManager.io.inMemData.bits := io.outMem(0).RDATA
  io.outMem(0).RREADY := memInterfaceManager.io.inMemData.ready
  io.outMem(0).ARID := 0.U
  io.outMem(0).ARLEN := 0.U

  val currTag = memInterfaceManager.io.deq.bits.addr(reqAddrWidth - offsetWidth - 1, handlerAddrWidth)
  val oneHotHandlerEnable = if (handlerAddrWidth > 0) UIntToOH(memInterfaceManager.io.deq.bits.addr(handlerAddrWidth - 1, 0)) else 1.U
  for (i <- 0 until numReqHandlers) {
      io.outResp(i).valid := oneHotHandlerEnable(i) & memInterfaceManager.io.deq.valid
      io.outResp(i).bits.data := memInterfaceManager.io.deq.bits.data
      io.outResp(i).bits.addr := currTag
  }
  memInterfaceManager.io.deq.ready := Mux1H(oneHotHandlerEnable, (0 until numReqHandlers).map(i => io.outResp(i).ready)) | ~memInterfaceManager.io.deq.valid
}

class MemoryInterfaceManager(cacheLineTagWidth: Int, burstOffsetWidth: Int, offsetWidth: Int, memAddrWidth: Int, memDataWidth: Int, memIdWidth: Int, maxInFlightRequests: Int, memAddrOffset: Long) extends Module {
  val burstTagWidth = cacheLineTagWidth - burstOffsetWidth
  val io=IO(new Bundle{
    val enq = Flipped(DecoupledIO(new MSHRExtMemType(burstTagWidth, burstOffsetWidth)))
    val outMemReq = DecoupledIO(new AddrBurstLenIO(memAddrWidth, burstOffsetWidth))
    val inMemData = Flipped(DecoupledIO(new DataLastIO(memDataWidth)))
    val deq = DecoupledIO(new AddrDataLastIO(cacheLineTagWidth, memDataWidth))
  })
  val maxBurstLen = 1 << burstOffsetWidth

  val fullAddress = Cat(io.enq.bits.tag, io.enq.bits.minBurstOffset, 0.U(offsetWidth.W)) + memAddrOffset.U
  val inFlightAddresses = Module(new BRAMQueue(cacheLineTagWidth, maxInFlightRequests))
  inFlightAddresses.io.enq.valid := io.enq.valid & io.outMemReq.ready
  inFlightAddresses.io.enq.bits := Cat(io.enq.bits.tag, io.enq.bits.minBurstOffset)
  io.enq.ready := inFlightAddresses.io.enq.ready & io.outMemReq.ready
  io.outMemReq.valid := io.enq.valid & inFlightAddresses.io.enq.ready
  io.outMemReq.bits.addr := fullAddress
  io.outMemReq.bits.burstLen := {if(burstOffsetWidth > 0) io.enq.bits.maxBurstOffset - io.enq.bits.minBurstOffset else 0.U}

  val rChannelEb = ElasticBuffer(io.inMemData)
  io.deq.valid := rChannelEb.valid
  io.deq.bits.connectAllExisting(rChannelEb.bits)
  // WARNING: The address is currently set to the starting address for all burst beats.
  // The consumer must use a counter to infer the addresses of subsequent beats,
  // and isLast to determine the end of a burst.
  val burstOffsetCounter = ExclusiveUpDownWrappingCounter(maxVal=maxBurstLen,
    upDownN=true.B, en=rChannelEb.fire(),
    load=(rChannelEb.bits.isLast & rChannelEb.fire()), loadValue=0.U)
  io.deq.bits.addr := inFlightAddresses.io.deq.bits + burstOffsetCounter
  inFlightAddresses.io.deq.ready := rChannelEb.valid & io.deq.ready & rChannelEb.bits.isLast
  rChannelEb.ready := io.deq.ready & inFlightAddresses.io.deq.valid
}

class ExternalMemoryArbiterBase(reqAddrWidth: Int, burstOffsetWidth: Int, memAddrWidth: Int, memDataWidth: Int, memIdWidth: Int, numReqHandlers: Int, numMemoryPorts: Int) extends Module {
  require(isPow2(memDataWidth))
  // require(isPow2(memAddrWidth))
  require(isPow2(numReqHandlers))
  require(numReqHandlers > 0)
  val bitsPerByte = 8
  val offsetWidth = log2Ceil(memDataWidth / bitsPerByte)
  val handlerAddrWidth = log2Ceil(numReqHandlers)
  val cacheLineTagWidth = reqAddrWidth - handlerAddrWidth - offsetWidth
  val burstTagWidth = cacheLineTagWidth - burstOffsetWidth
  val fullCacheLineTagWidth = reqAddrWidth - offsetWidth
  val fullBurstTagWidth = fullCacheLineTagWidth - burstOffsetWidth
  val numIds = 1 << memIdWidth

  val io = IO(new Bundle{
      val inReq = Flipped(Vec(numReqHandlers, DecoupledIO(new MSHRExtMemType(burstTagWidth, burstOffsetWidth))))
      val outMem = Flipped(Vec(numMemoryPorts, new AXI4FullReadOnly(UInt(memDataWidth.W), memAddrWidth, memIdWidth)))
      val outResp = Vec(numReqHandlers, DecoupledIO(new AddrDataLastIO(cacheLineTagWidth, memDataWidth)))
  })

  io.outMem.foreach(x => {
    x.ARSIZE := log2Ceil(memDataWidth / bitsPerByte).U
    x.ARBURST := 1.U /* INCR */
    x.ARLOCK := 0.U  /* Normal (not exclusive/locked) access */
    x.ARCACHE := 0.U /* Non-modifiable */
    x.ARPROT := 0.U  /* Unprivileged, secure, data
    * (default used by Vivado HLS) */
    x.ARID := 0.U
  })
}

object ReorderingExternalMemoryArbiter{
  val numBanks = 8
  val ddrColWidthByteAddressed = 10
  val queueDepth = 8
}

// Not used in our ISFPGA19 paper, as its benefit was not clear
class ReorderingExternalMemoryArbiter(reqAddrWidth: Int=ExternalMemoryArbiter.reqAddrWidth, memAddrWidth: Int=ExternalMemoryArbiter.memAddrWidth, memDataWidth: Int=ExternalMemoryArbiter.memDataWidth, memIdWidth: Int=ExternalMemoryArbiter.memIdWidth, numReqHandlers: Int=ExternalMemoryArbiter.numReqHandlers, maxInFlightRequests: Int=InOrderExternalMemoryArbiter.maxInFlightRequests, memAddrOffset: Long=ExternalMemoryArbiter.memAddrOffset, numBanks: Int=ReorderingExternalMemoryArbiter.numBanks, queueDepth: Int=ReorderingExternalMemoryArbiter.queueDepth) extends ExternalMemoryArbiterBase(reqAddrWidth, 0, memAddrWidth, memDataWidth, memIdWidth, numReqHandlers, 1) {
  require(isPow2(numBanks))
  require(numBanks > 0)
  val bankAddrWidth = log2Ceil(numBanks)
  val crossbarAddrWidth = cacheLineTagWidth + handlerAddrWidth
  val memAddrWidthWithoutOffset = memAddrWidth - offsetWidth
  val ddrColWidthWithoutZeros = ReorderingExternalMemoryArbiter.ddrColWidthByteAddressed - offsetWidth

  /*
  * Input address from inReq:
  * --------------
  * |    tag     |
  * --------------
  * |<-cacheLineTagWidth->|
  *
  * Addr sent to crossbar:
  * ----------------------------------------
  * |    tag     |   req handler address   |
  * ----------------------------------------
  * |<-cacheLineTagWidth->|<--log2(numReqHandlers)->|
  * |<----------crossbarAddrWidth--------->|
  *
  * Addr received from crossbar:
  * --------------------------------------------
  * | DDR row addr |        DDR col addr       |
  * --------------------------------------------
  * |              |<-ddrColWidthWithoutZeros->|
  * |<--------memAddrWidthWithoutOffset------->|
  *
  * Full address sent to memory:
  *
  * |<--------------memAddrWidthWithoutOffset-------------->|
  * ---------------------------------------------------------------
  * | DDR row addr |  DDR bank addr  |     DDR col addr     |  0  |
  * ---------------------------------------------------------------
  * |    tag     |   req handler address   |           0          |
  * ---------------------------------------------------------------
  * |<-cacheLineTagWidth->|<--log2(numReqHandlers)->|<----offsetWidth----->|
  */

  val inReqWithFullAddr = Wire(Vec(numReqHandlers, DecoupledIO(UInt(crossbarAddrWidth.W))))
  for(i <- 0 until numReqHandlers) {
    inReqWithFullAddr(i).valid := io.inReq(i).valid
    io.inReq(i).ready := inReqWithFullAddr(i).ready
    if(numReqHandlers > 1) {
      inReqWithFullAddr(i).bits := Cat(io.inReq(i).bits.tag, i.U(handlerAddrWidth.W))
    } else {
      inReqWithFullAddr(i).bits := io.inReq(i).bits.tag
    }
  }

  val crossbar = Module(new OneWayCrossbar(numReqHandlers, numBanks, crossbarAddrWidth, ddrColWidthWithoutZeros))
  for(i <- 0 until numReqHandlers) {
    crossbar.io.ins(i) <> inReqWithFullAddr(i)
  }
  val crossbarOutAddrWidth = crossbar.io.outs(0).bits.getWidth

  val selectors = Array.fill(numBanks)(Module(new SameRowReadSelector(crossbar.io.outs(0).bits.getWidth, ddrColWidthWithoutZeros, queueDepth)).io)
  val sameRowArbiter = Module(new ResettableRRArbiter(UInt(memAddrWidthWithoutOffset.W), numBanks))
  val validArbiter   = Module(new ResettableRRArbiter(UInt(memAddrWidthWithoutOffset.W), numBanks))
  for(i <- 0 until numBanks) {
    selectors(i).enq <> crossbar.io.outs(i)
    validArbiter.io.in(i).bits := Cat(selectors(i).deq.bits(crossbarOutAddrWidth-1, ddrColWidthWithoutZeros), i.U(bankAddrWidth.W), selectors(i).deq.bits(ddrColWidthWithoutZeros-1, 0))
    validArbiter.io.in(i).valid := selectors(i).deq.valid
    sameRowArbiter.io.in(i).bits := Cat(selectors(i).deq.bits(crossbarOutAddrWidth-1, ddrColWidthWithoutZeros), i.U(bankAddrWidth.W), selectors(i).deq.bits(ddrColWidthWithoutZeros-1, 0))
    sameRowArbiter.io.in(i).valid := selectors(i).deq.valid & ~selectors(i).isNewRow
  }
  val downstreamArbiter = Module(new Arbiter(UInt(memAddrWidthWithoutOffset.W), 2))
  downstreamArbiter.io.in(0) <> sameRowArbiter.io.out
  downstreamArbiter.io.in(1) <> validArbiter.io.out
  for(i <- 0 until numBanks) {
    selectors(i).deq.ready := Mux(downstreamArbiter.io.chosen === 1.U, validArbiter.io.in(i).ready, sameRowArbiter.io.in(i).ready & ~selectors(i).isNewRow)
  }
  val inputEb = ElasticBuffer(downstreamArbiter.io.out)

  val fullAddress = Cat(inputEb.bits, 0.U(offsetWidth.W)) + memAddrOffset.U
  val inFlightAddresses = Module(new BRAMQueue(memAddrWidthWithoutOffset, maxInFlightRequests))
  inFlightAddresses.io.enq.valid := inputEb.valid & io.outMem(0).ARREADY
  inFlightAddresses.io.enq.bits := inputEb.bits
  inputEb.ready := inFlightAddresses.io.enq.ready & io.outMem(0).ARREADY
  io.outMem(0).ARVALID := inputEb.valid & inFlightAddresses.io.enq.ready
  io.outMem(0).ARADDR := fullAddress
  io.outMem(0).ARID := 0.U

  val rChannelEb = Module(new ElasticBuffer(UInt(memDataWidth.W)))
  rChannelEb.io.in.valid := io.outMem(0).RVALID
  rChannelEb.io.in.bits := io.outMem(0).RDATA
  io.outMem(0).RREADY := rChannelEb.io.in.ready

  val targetOutputReady = Wire(Bool())
  rChannelEb.io.out.ready := targetOutputReady & inFlightAddresses.io.deq.valid
  inFlightAddresses.io.deq.ready := rChannelEb.io.out.valid & targetOutputReady
  val currTag = inFlightAddresses.io.deq.bits(reqAddrWidth - offsetWidth - 1, handlerAddrWidth)
  val oneHotHandlerEnable = if (handlerAddrWidth > 0) UIntToOH(inFlightAddresses.io.deq.bits(handlerAddrWidth - 1, 0)) else 1.U
  for (i <- 0 until numReqHandlers) {
      io.outResp(i).valid := oneHotHandlerEnable(i) & rChannelEb.io.out.valid
      io.outResp(i).bits.data := rChannelEb.io.out.bits
      io.outResp(i).bits.addr := currTag
  }
  targetOutputReady := Mux1H(oneHotHandlerEnable, (0 until numReqHandlers).map(i => io.outResp(i).ready)) | ~rChannelEb.io.out.valid
}

class SameRowReadSelector(addrWidth: Int, colWidth: Int, queueDepth: Int) extends Module {
  val io=IO(new Bundle{
    val enq = Flipped(DecoupledIO(UInt(addrWidth.W)))
    val deq = DecoupledIO(UInt(addrWidth.W))
    val isNewRow = Output(Bool())
  })

  def getRow(addr: UInt) : UInt = addr(addrWidth - 1, colWidth)

  val emptyEntry = Wire(ValidIO(io.enq.bits.cloneType))
  emptyEntry.valid := false.B
  emptyEntry.bits  := DontCare
  val memory = RegInit(Vec(Seq.fill(queueDepth)(emptyEntry)))

  val sameRowArbiter = Module(new ResettableRRArbiter(io.enq.bits.cloneType, queueDepth))
  val validArbiter   = Module(new ResettableRRArbiter(io.enq.bits.cloneType, queueDepth))
  val emptyDataAndChosen = Wire(ValidIO(new DataAndChosenIO(addrWidth, 1)))
  emptyDataAndChosen.valid := false.B
  emptyDataAndChosen.bits  := DontCare
  val lastRequestSent = RegInit(emptyDataAndChosen)
  for(i <- 0 until queueDepth) {
    sameRowArbiter.io.in(i).valid := memory(i).valid & (getRow(memory(i).bits) === getRow(lastRequestSent.bits.data)) & lastRequestSent.valid
    sameRowArbiter.io.in(i).bits := memory(i).bits
    validArbiter.io.in(i).valid := memory(i).valid
    validArbiter.io.in(i).bits := memory(i).bits
  }
  val downstreamArbiter = Module(new Arbiter(io.enq.bits.cloneType, 2))
  downstreamArbiter.io.in(0) <> sameRowArbiter.io.out
  downstreamArbiter.io.in(1) <> validArbiter.io.out

  val outputEb = Module(new ElasticBuffer(lastRequestSent.bits.cloneType))
  io.deq.valid := outputEb.io.out.valid
  io.deq.bits := outputEb.io.out.bits.data
  io.isNewRow := outputEb.io.out.bits.chosen === 1.U
  outputEb.io.out.ready := io.deq.ready
  outputEb.io.in.bits := lastRequestSent.bits
  outputEb.io.in.valid := lastRequestSent.valid

  when(outputEb.io.in.ready) {
    lastRequestSent.valid := downstreamArbiter.io.out.valid
    lastRequestSent.bits.data  := downstreamArbiter.io.out.bits
    lastRequestSent.bits.chosen := downstreamArbiter.io.chosen
  }
  downstreamArbiter.io.out.ready := outputEb.io.in.ready
  val queueFull = Vec(memory.map(x => x.valid)).asUInt.andR
  val emptyEntrySelect = PriorityEncoderOH(memory.map(x => ~x.valid))
  io.enq.ready := outputEb.io.in.ready | ~queueFull

  for(i <- 0 until queueDepth) {
    when(io.enq.valid & Mux(downstreamArbiter.io.out.ready & downstreamArbiter.io.out.valid, Mux(downstreamArbiter.io.chosen === 1.U, validArbiter.io.in(i).ready & validArbiter.io.in(i).valid, sameRowArbiter.io.in(i).ready & sameRowArbiter.io.in(i).valid), emptyEntrySelect(i))) {
      memory(i).valid := true.B
      memory(i).bits := io.enq.bits
    } .elsewhen(downstreamArbiter.io.out.ready & downstreamArbiter.io.out.valid & Mux(downstreamArbiter.io.chosen === 1.U, validArbiter.io.in(i).ready & validArbiter.io.in(i).valid, sameRowArbiter.io.in(i).ready & sameRowArbiter.io.in(i).valid)) {
      memory(i).valid := false.B
    }
  }
}

// Not used in our ISFPGA19 paper, validated in simulation but not tested on FPGA
object InOrderExternalMultiPortedMemoryArbiter {
  val numMemoryPorts = 5
}

class InOrderExternalMultiPortedMemoryArbiter(reqAddrWidth: Int=ExternalMemoryArbiter.reqAddrWidth, memAddrWidth: Int=ExternalMemoryArbiter.memAddrWidth, memDataWidth: Int=ExternalMemoryArbiter.memDataWidth, memIdWidth: Int=ExternalMemoryArbiter.memIdWidth, numReqHandlers: Int=ExternalMemoryArbiter.numReqHandlers, maxInFlightRequests: Int=InOrderExternalMemoryArbiter.maxInFlightRequests, memAddrOffset: Long=ExternalMemoryArbiter.memAddrOffset, numMemoryPorts: Int=InOrderExternalMultiPortedMemoryArbiter.numMemoryPorts) extends ExternalMemoryArbiterBase(reqAddrWidth, 0, memAddrWidth, memDataWidth, memIdWidth, numReqHandlers, numMemoryPorts) {
  val inReqWithFullAddr = Wire(Vec(numReqHandlers, DecoupledIO(UInt(fullCacheLineTagWidth.W))))
  for(i <- 0 until numReqHandlers) {
    inReqWithFullAddr(i).valid := io.inReq(i).valid
    io.inReq(i).ready := inReqWithFullAddr(i).ready
    if(numReqHandlers > 1) {
      inReqWithFullAddr(i).bits := Cat(io.inReq(i).bits.tag, i.U(handlerAddrWidth.W))
    } else {
      inReqWithFullAddr(i).bits := io.inReq(i).bits.tag
    }
  }
  val scrambledInputs = {
    if(numReqHandlers > 1) {
      Scrambler(inReqWithFullAddr(0).bits.cloneType, inReqWithFullAddr, numMemoryPorts)
    } else {
      val inputArbiter = Module(new ResettableRRArbiter(UInt(cacheLineTagWidth.W), numReqHandlers))
      inputArbiter.io.in.zip(io.inReq).foreach{case(arbPort, inReqPort) => {
        arbPort.valid := inReqPort.valid
        inReqPort.ready := arbPort.ready
        arbPort.bits := inReqPort.bits.tag
      }}
      // for (i <- 0 until numReqHandlers) inputArbiter.io.in(i) <> io.inReq(i)
      Vec(1, inputArbiter.io.out)
    }
  }
  val memInterfaceManagers = Array.fill(numMemoryPorts)(Module(new MemoryInterfaceManager(fullCacheLineTagWidth, 0, offsetWidth, memAddrWidth, memDataWidth, memIdWidth, maxInFlightRequests, memAddrOffset)).io)
  // Using ElasticBuffer to make memory input irrevocable, replace with Queue if
  // more buffering is needed.
  memInterfaceManagers.map(_.enq).zip(scrambledInputs).foreach{case(mgrPort, in) => {
    val bufferedInput = ElasticBuffer(in)
    mgrPort.valid := bufferedInput.valid
    bufferedInput.ready := mgrPort.ready
    mgrPort.bits.tag := bufferedInput.bits
  }}
  memInterfaceManagers.map(_.outMemReq).zip(io.outMem).foreach{case(mgrPort, memPort) => {
    memPort.ARVALID := mgrPort.valid
    mgrPort.ready   := memPort.ARREADY
    memPort.ARADDR  := mgrPort.bits.addr
    memPort.ARLEN   := 0.U
  }}
  memInterfaceManagers.map(_.inMemData).zip(io.outMem).foreach{case(mgrPort, memPort) => {
    mgrPort.valid   := memPort.RVALID
    mgrPort.bits.data   := memPort.RDATA
    mgrPort.bits.isLast := true.B
    memPort.RREADY  := mgrPort.ready
  }}

  val dataCrossbarInputType = memInterfaceManagers(0).deq.bits.cloneType
  val dataCrossbarOutputType = io.outResp(0).bits.cloneType
  val dataCrossbar = Module(new OneWayCrossbarGeneric(dataCrossbarInputType,
    dataCrossbarOutputType, numMemoryPorts, numReqHandlers,
    (mgrPort: AddrDataLastIO) => mgrPort.addr(handlerAddrWidth-1, 0),
    (mgrPort: AddrDataLastIO) => {
      val output = Wire(dataCrossbarOutputType)
      output.connectAllExisting(mgrPort)
      output.addr := mgrPort.addr(fullCacheLineTagWidth-1, handlerAddrWidth)
      output
    }))
  dataCrossbar.io.ins.zip(memInterfaceManagers.map(_.deq)).foreach{case(xBarIn, mgrOut) => xBarIn <> mgrOut}
  dataCrossbar.io.outs.zip(io.outResp).foreach{case(xBarOut, outResp) => xBarOut <> outResp }
}

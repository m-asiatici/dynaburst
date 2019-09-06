package fpgamshr.extmemarbiter.variablelength

import chisel3._
import chisel3.util._
import fpgamshr.util._
import fpgamshr.interfaces._
import fpgamshr.crossbar.{OneWayCrossbar, OneWayCrossbarGeneric}
import fpgamshr.extmemarbiter.{MemoryInterfaceManager, ExternalMemoryArbiterBase}

import java.io.{File, BufferedWriter, FileWriter} // To generate the BRAM initialization files

import scala.collection.mutable.ArrayBuffer

object ExternalMemoryArbiter {
    val memAddrWidth = 32
    val reqAddrWidth = 32
    val burstOffsetWidth = 2
    val memAddrOffset = 0x00000000
    val memDataWidth = 512
    val memIdWidth = 5

    val numReqHandlers = 4

    val bramLatency = 2
}

object InOrderExternalMemoryArbiter {
  val maxInFlightRequests = 128
}

// Not used in our ISFPGA19 paper, validated in simulation but not tested on FPGA
object InOrderExternalMultiPortedMemoryArbiter {
  val numMemoryPorts = 5
}

class InOrderExternalMultiPortedMemoryArbiter(reqAddrWidth: Int=ExternalMemoryArbiter.reqAddrWidth, burstOffsetWidth: Int=ExternalMemoryArbiter.burstOffsetWidth, memAddrWidth: Int=ExternalMemoryArbiter.memAddrWidth, memDataWidth: Int=ExternalMemoryArbiter.memDataWidth, memIdWidth: Int=ExternalMemoryArbiter.memIdWidth, numReqHandlers: Int=ExternalMemoryArbiter.numReqHandlers, maxInFlightRequests: Int=InOrderExternalMemoryArbiter.maxInFlightRequests, memAddrOffset: Long=ExternalMemoryArbiter.memAddrOffset, numMemoryPorts: Int=InOrderExternalMultiPortedMemoryArbiter.numMemoryPorts, useScrambler: Boolean=true) extends ExternalMemoryArbiterBase(reqAddrWidth, burstOffsetWidth, memAddrWidth, memDataWidth, memIdWidth, numReqHandlers, numMemoryPorts) {
  val inReqWithFullAddr = Wire(Vec(numReqHandlers, DecoupledIO(new MSHRExtMemType(fullBurstTagWidth, burstOffsetWidth))))
  for(i <- 0 until numReqHandlers) {
    inReqWithFullAddr(i).valid := io.inReq(i).valid
    io.inReq(i).ready := inReqWithFullAddr(i).ready
    inReqWithFullAddr(i).bits.connectAllExisting(io.inReq(i).bits)
    if(numReqHandlers > 1) {
      inReqWithFullAddr(i).bits.tag := Cat(io.inReq(i).bits.tag, i.U(handlerAddrWidth.W))
    } else {
      inReqWithFullAddr(i).bits.tag := io.inReq(i).bits.tag
    }
  }
  val scrambledInputs = {
    if(numReqHandlers > 1) {
      if(useScrambler) {
        Scrambler(inReqWithFullAddr(0).bits.cloneType, inReqWithFullAddr, numMemoryPorts)
      } else {
        require(isPow2(numMemoryPorts))
        require(numReqHandlers >= numMemoryPorts)
        // TODO: handle case numReqHandlers < numMemoryPorts by instantiating one scrambler per memory port
        val inputArbiters = Array.fill(numMemoryPorts)(Module(new ResettableRRArbiter(inReqWithFullAddr(0).bits.cloneType, numReqHandlers/numMemoryPorts)).io)
        inReqWithFullAddr.zip(inputArbiters.flatMap(_.in)).foreach{case (inReq, arbIn) => inReq <> arbIn}
        Vec(inputArbiters.map(_.out))
      }
    } else {
      val inputArbiter = Module(new ResettableRRArbiter(io.inReq(0).cloneType, numReqHandlers))
      for (i <- 0 until numReqHandlers) inputArbiter.io.in(i) <> io.inReq(i)
      Vec(1, inputArbiter.io.out)
    }
  }
  val memInterfaceManagers = Array.fill(numMemoryPorts)(Module(new MemoryInterfaceManager(fullCacheLineTagWidth, burstOffsetWidth, offsetWidth, memAddrWidth, memDataWidth, memIdWidth, maxInFlightRequests, memAddrOffset)).io)
  // Using ElasticBuffer to make memory input irrevocable, replace with Queue if
  // more buffering is needed.
  memInterfaceManagers.map(_.enq).zip(scrambledInputs).foreach{case(mgrPort, in) => mgrPort <> ElasticBuffer(in)}
  memInterfaceManagers.map(_.outMemReq).zip(io.outMem).foreach{case(mgrPort, memPort) => {
    memPort.ARVALID := mgrPort.valid
    mgrPort.ready   := memPort.ARREADY
    memPort.ARADDR  := mgrPort.bits.addr
    memPort.ARLEN  := mgrPort.bits.burstLen
  }}
  memInterfaceManagers.map(_.inMemData).zip(io.outMem).foreach{case(mgrPort, memPort) => {
    mgrPort.valid   := memPort.RVALID
    mgrPort.bits.data    := memPort.RDATA
    mgrPort.bits.isLast    := memPort.RLAST
    memPort.RREADY  := mgrPort.ready
  }}

  if(useScrambler) {
    val dataCrossbarInputType = memInterfaceManagers(0).deq.bits.cloneType
    val dataCrossbarOutputType = io.outResp(0).bits.cloneType
    // TODO: optimize if ~useScrambler
    val dataCrossbar = Module(new OneWayCrossbarGeneric(dataCrossbarInputType,
      dataCrossbarOutputType, numMemoryPorts, numReqHandlers,
      (mgrPort: AddrDataLastIO) => mgrPort.addr(burstOffsetWidth+handlerAddrWidth-1, burstOffsetWidth),
      (mgrPort: AddrDataLastIO) => {
        val output = Wire(dataCrossbarOutputType)
        output.data := mgrPort.data
        output.addr := {if(burstOffsetWidth > 0) Cat(mgrPort.addr(fullCacheLineTagWidth-1, handlerAddrWidth+burstOffsetWidth), mgrPort.addr(burstOffsetWidth-1, 0)) else mgrPort.addr(fullCacheLineTagWidth-1, handlerAddrWidth)}
        output.isLast := mgrPort.isLast
        output
      },
      canUnlock=(mgrPort: AddrDataLastIO) => {mgrPort.isLast},
      inEb=(numMemoryPorts>1), ebOnArbiterInput=(numMemoryPorts>1)
    ))
    dataCrossbar.io.ins.zip(memInterfaceManagers.map(_.deq)).foreach{case(xBarIn, mgrOut) => xBarIn <> mgrOut}
    dataCrossbar.io.outs.zip(io.outResp).foreach{case(xBarOut, outResp) => xBarOut <> outResp }
  } else {
    val handlersPerMemPort = numReqHandlers / numMemoryPorts
    val handlerEnableWidth = log2Ceil(handlersPerMemPort)
    for (iMemPort <- 0 until numMemoryPorts) {
      val currTag = {if(burstOffsetWidth > 0) Cat(memInterfaceManagers(iMemPort).deq.bits.addr(fullCacheLineTagWidth-1, handlerAddrWidth+burstOffsetWidth), memInterfaceManagers(iMemPort).deq.bits.addr(burstOffsetWidth-1, 0)) else memInterfaceManagers(iMemPort).deq.bits.addr(fullCacheLineTagWidth-1, handlerAddrWidth)}
      // val currTag = memInterfaceManagers(iMemPort).deq.bits.addr(fullCacheLineTagWidth-1, handlerAddrWidth+burstOffsetWidth)
      val oneHotHandlerEnable = if (handlerEnableWidth > 0) UIntToOH(memInterfaceManagers(iMemPort).deq.bits.addr(burstOffsetWidth+handlerEnableWidth-1, burstOffsetWidth)) else 1.U
      for (iHandler <- 0 until handlersPerMemPort) {
        io.outResp(iMemPort*handlersPerMemPort + iHandler).valid := oneHotHandlerEnable(iHandler) & memInterfaceManagers(iMemPort).deq.valid
        io.outResp(iMemPort*handlersPerMemPort + iHandler).bits.data := memInterfaceManagers(iMemPort).deq.bits.data
        io.outResp(iMemPort*handlersPerMemPort + iHandler).bits.addr := currTag
        io.outResp(iMemPort*handlersPerMemPort + iHandler).bits.isLast := memInterfaceManagers(iMemPort).deq.bits.isLast
      }
      memInterfaceManagers(iMemPort).deq.ready := Mux1H(oneHotHandlerEnable, (0 until handlersPerMemPort).map(i => io.outResp(iMemPort*handlersPerMemPort + i).ready)) | ~memInterfaceManagers(iMemPort).deq.valid
    }
  }

}

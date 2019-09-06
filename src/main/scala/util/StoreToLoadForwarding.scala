package fpgamshr.util

import chisel3._
import chisel3.util.{MuxCase, RegEnable}

object StoreToLoadForwarding {
    val defaultType = UInt(32.W)
    val defaultAddrWidth = 16
}

class StoreToLoadForwardingIO[T <: Data](gen: T, addrWidth: Int) extends Bundle {
  val rdAddr = Input(UInt(addrWidth.W))
  val wrAddr = Output(UInt(addrWidth.W))
  val wrEn = Input(Bool())
  val pipelineReady = Input(Bool())
  val dataInFromMem = Input(gen)
  val dataInFixed = Output(gen)
  val dataOutToMem = Input(gen)
}

class StoreToLoadForwardingBase[T <: Data](gen: T = StoreToLoadForwarding.defaultType, addrWidth: Int = StoreToLoadForwarding.defaultAddrWidth) extends Module {
  val io = IO(new StoreToLoadForwardingIO(gen, addrWidth))
}

/* Fixed depth of two slots (like BRAM latency) */
class StoreToLoadForwardingTwoStages[T <: Data](gen: T = StoreToLoadForwarding.defaultType, addrWidth: Int = StoreToLoadForwarding.defaultAddrWidth)
  extends StoreToLoadForwardingBase(gen, addrWidth) {

    /* Store-to-load forwarding logic: we keep a FIFO with the 2 most recently
     * written lines and take those instead of the value fetched from memory,
     * which may be wrong. */
    val oneRdAddrAgo = RegEnable(io.rdAddr, enable=io.pipelineReady)
    val twoRdAddrAgo = RegEnable(oneRdAddrAgo, enable=io.pipelineReady)
    io.wrAddr := twoRdAddrAgo
    val oneOutLineAgo = RegEnable(io.dataOutToMem, enable=io.pipelineReady)
    val twoOutLinesAgo = RegEnable(oneOutLineAgo, enable=io.pipelineReady)
    val takeOneLineAgo = RegEnable((twoRdAddrAgo === oneRdAddrAgo) & io.wrEn, false.B, enable=io.pipelineReady)
    val takeTwoLinesAgo = RegEnable(RegEnable((twoRdAddrAgo === io.rdAddr) & io.wrEn, false.B, enable=io.pipelineReady), false.B, enable=io.pipelineReady)
    io.dataInFixed := MuxCase(io.dataInFromMem, Array(takeOneLineAgo -> oneOutLineAgo, takeTwoLinesAgo -> twoOutLinesAgo))
}

/* Fixed depth of three slots (BRAM latency + 1) but data expected after two cycles */
class StoreToLoadForwardingThreeStages[T <: Data](gen: T = StoreToLoadForwarding.defaultType, addrWidth: Int = StoreToLoadForwarding.defaultAddrWidth)
  extends StoreToLoadForwardingBase(gen, addrWidth) {

    /* Store-to-load forwarding logic: we keep a FIFO with the 2 most recently
     * written lines and take those instead of the value fetched from memory,
     * which may be wrong. */
    val oneRdAddrAgo = RegEnable(io.rdAddr, enable=io.pipelineReady)
    val twoRdAddrAgo = RegEnable(oneRdAddrAgo, enable=io.pipelineReady)
    val threeRdAddrAgo = RegEnable(twoRdAddrAgo, enable=io.pipelineReady)
    io.wrAddr := threeRdAddrAgo
    val oneOutLineAgo = RegEnable(io.dataOutToMem, enable=io.pipelineReady)
    val twoOutLinesAgo = RegEnable(oneOutLineAgo, enable=io.pipelineReady)
    val takeOneLineAgo = (threeRdAddrAgo === twoRdAddrAgo) & io.wrEn
    val takeTwoLinesAgo = RegEnable((threeRdAddrAgo === oneRdAddrAgo) & io.wrEn, false.B, enable=io.pipelineReady)
    val takeThreeLinesAgo = RegEnable(RegEnable((threeRdAddrAgo === io.rdAddr) & io.wrEn, false.B, enable=io.pipelineReady), false.B, enable=io.pipelineReady)
    io.dataInFixed := MuxCase(io.dataInFromMem, Array(takeOneLineAgo -> io.dataOutToMem, takeTwoLinesAgo -> oneOutLineAgo, takeThreeLinesAgo -> twoOutLinesAgo))
}

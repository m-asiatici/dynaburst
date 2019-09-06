package fpgamshr.util

import chisel3._
import chisel3.util.{MuxCase, log2Ceil, isPow2}

abstract class UpDownLoadableCounter extends Module {
  val io: UpDownLoadableCounterIO
  def connect(increment: Bool, decrement: Bool, load: Bool, loadValue: Data) = {
    io.increment := increment
    io.decrement := decrement
    io.load := load
    io.loadValue := loadValue
  }
}

class LoadableCounterIO(width: Int) extends Bundle {
  val load = Input(Bool())
  val loadValue = Input(UInt(width.W))
  val currValue = Output(UInt(width.W))
}

class UpDownLoadableCounterIO(width: Int) extends LoadableCounterIO(width) {
  val increment = Input(Bool())
  val decrement = Input(Bool())
}

class ArbitraryIncrementLoadableCounterIO(width: Int) extends LoadableCounterIO(width) {
  val en = Input(Bool())
  val delta = Input(SInt(width.W))
}

class SaturatingUpDownLoadableCounterIO(width: Int) extends UpDownLoadableCounterIO(width) {
  val saturatingUp = Output(Bool())
  val saturatingDown = Output(Bool())
}

object SimultaneousUpDownSaturatingCounter {
  def apply(maxVal: Int, increment: Bool, decrement: Bool, load: Bool=false.B, loadValue: Data=DontCare, resetVal: Int=0): UInt = {
    val m = Module(new SimultaneousUpDownSaturatingCounter(maxVal, resetVal))
    m.connect(increment=increment, decrement=decrement, load=load, loadValue=loadValue)
    m.io.currValue
  }
}

object ExclusiveUpDownSaturatingCounter {
  def apply(maxVal: Int, upDownN: Bool, en: Bool=true.B, load: Bool=false.B, loadValue: Data=DontCare, resetVal: Int=0): UInt = {
    val m = Module(new SimultaneousUpDownSaturatingCounter(maxVal, resetVal))
    m.connect(increment=(upDownN & en),
      decrement=(~upDownN & en),
      load=load,
      loadValue=loadValue)
    m.io.currValue
  }
}

object ExclusiveUpDownWrappingCounter {
  def apply(maxVal: Int, upDownN: Bool, en: Bool=true.B, load: Bool=false.B, loadValue: Data=DontCare, resetVal: Int=0): UInt = {
    val m = Module(new SimultaneousUpDownWrappingCounter(maxVal, resetVal))
    m.connect(increment=(upDownN & en),
      decrement=(~upDownN & en),
      load=load,
      loadValue=loadValue)
    m.io.currValue
  }
}

class SimultaneousUpDownSaturatingCounter(maxVal: Int, resetVal: Int=0) extends UpDownLoadableCounter {
  val width = BigInt(maxVal).bitLength
  val io = IO(new SaturatingUpDownLoadableCounterIO(width))

  val saturatingIncrement = Mux(io.currValue < maxVal.U, io.currValue + 1.U, io.currValue)
  val saturatingDecrement = Mux(io.currValue > 0.U, io.currValue - 1.U, io.currValue)
  io.currValue := RegNext(MuxCase(io.currValue, Array(io.load -> io.loadValue,
    (io.increment & io.decrement) -> io.currValue,
    io.increment -> saturatingIncrement,
    io.decrement -> saturatingDecrement)), init=resetVal.U)

  io.saturatingUp := io.currValue === maxVal.U
  io.saturatingDown := io.currValue === 0.U
}

object SimultaneousUpDownWrappingCounter {
  def apply(maxVal: Int, increment: Bool, decrement: Bool, load: Bool=false.B, loadValue: Data=DontCare, resetVal: Int=0): UInt = {
    val m = Module(new SimultaneousUpDownWrappingCounter(maxVal, resetVal))
    m.connect(increment=increment,
      decrement=decrement,
      load=load,
      loadValue=loadValue)
    m.io.currValue
  }
}

class SimultaneousUpDownWrappingCounter(maxVal: Int, resetVal: Int=0) extends UpDownLoadableCounter {
  val width = BigInt(maxVal).bitLength
  val io = IO(new UpDownLoadableCounterIO(width))

  val saturatingIncrement = if(isPow2(maxVal)) {io.currValue + 1.U} else {Mux(io.currValue < maxVal.U, io.currValue + 1.U, 0.U)}
  val saturatingDecrement = if(isPow2(maxVal)) {io.currValue - 1.U} else {Mux(io.currValue > 0.U, io.currValue - 1.U, maxVal.U)}
  io.currValue := RegNext(MuxCase(io.currValue, Array(io.load -> io.loadValue,
    (io.increment & io.decrement) -> io.currValue,
    io.increment -> saturatingIncrement,
    io.decrement -> saturatingDecrement)), init=resetVal.U)

}

object ArbitraryIncrementWrappingCounter {
  def apply(maxVal: Int, en: Bool, delta: SInt, load: Bool=false.B, loadValue: Data=DontCare, resetVal: Int=0): UInt = {
    val m = Module(new ArbitraryIncrementWrappingCounter(maxVal, resetVal))
    m.io.en := en
    m.io.delta := delta
    m.io.load := load
    m.io.loadValue := loadValue
    m.io.currValue
  }
}

class ArbitraryIncrementWrappingCounter(maxVal: Int, resetVal: Int=0) extends Module {
  val width = BigInt(maxVal).bitLength
  val io=IO(new ArbitraryIncrementLoadableCounterIO(width))
  io.currValue := RegNext(MuxCase(io.currValue, Array(io.load -> io.loadValue,
    io.en -> (io.currValue.asSInt + io.delta).asUInt)), init=resetVal.U)
}

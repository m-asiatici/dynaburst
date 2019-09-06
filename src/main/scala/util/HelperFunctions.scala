package fpgamshr.util

import chisel3._
import chisel3.util._
import scala.language.implicitConversions


object HelperFunctions {
  // def gatedConnect[T <: Data](a: DecoupledIO[T], b: DecoupledIO[T], en: Bool): Unit = {
  //   a.valid     := b.valid & ~en
  //   a.bits      := b.bits
  //   b.ready := a.ready & ~en
  // }

  def gatedConnect[S <: Data, T <: Data](a: DecoupledIO[S], b: DecoupledIO[T], en: Bool=true.B)(implicit ev: S =:= T = null): Unit = {
    a.valid := b.valid & en
    if(ev != null) a.bits := b.bits
    b.ready := a.ready & en
  }
}
//
// import fpgamshr.interfaces._
//
// class GatedConnectTest extends Module {
//   val io = IO(new Bundle{
//     val in = Flipped(DecoupledIO(new AddrDataIdIO(addrWidth=32, dataWidth=16, idWidth=4)))
//     val gate = Input(Bool())
//     val out = DecoupledIO(new AddrDataIO(addrWidth=32, dataWidth=16))
//   })
//   HelperFunctions.gatedConnect(io.out, io.in, io.gate)
//   io.out.bits connectAllExisting io.in.bits
// }
//
// object GatedConnectTestVerilog extends App {
//     chisel3.Driver.execute(args, () => new GatedConnectTest)
// }

//
// class DecoupledIOPlus[+T <: Data](gen: T) extends DecoupledIO[T](gen) {
//   implicit def DecIO2DecIOPlus(d: DecoupledIO[T]): DecoupledIOPlus[T] = DecoupledIOPlus(d)
//
//   def connectWithEnable(that: DecoupledIO[T], enable: Bool): DecoupledIO[T] = {
//     this.valid <> that.valid & enable
//     this.ready <> that.ready & enable
//     this.bits  <> that.bits
//   }
//
//   override def cloneType: this.type = new DecoupledIOPlus(gen).asInstanceOf[this.type]
// }
//
// object DecoupledIOPlus {
//   def apply[T <: Data](d: DecoupledIO[T]): DecoupledIOPlus[T] = {
//     this.valid := d.valid
//     this.ready := d.ready
//     this.bits  := d.bits
//     this
//   }
// }

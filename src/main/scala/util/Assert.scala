package fpgamshr.util

import chisel3._
import chisel3.experimental._
import chisel3.util.{HasBlackBoxInline}

object Assert {
  def apply(clock: Clock, reset: core.Reset, test: Bool, message: String="", ignoreXZ: Boolean=true): Unit = {
    if(ignoreXZ) {
      val m = Module(new AssertIgnoreXZ(message))
      m.io.clk := clock
      m.io.reset := reset
      m.io.test := test
    } else {
      val m = Module(new Assert(message))
      m.io.clk := clock
      m.io.reset := reset
      m.io.test := test
    }
  }
}

class Assert(message: String="") extends BlackBox(Map("MSG" -> message)) with HasBlackBoxInline {
    val io = IO(new Bundle{
      val clk  = Input(Clock())
      val reset = Input(Bool())
      val test = Input(Bool())
    })
    // override def desiredName = if(moduleName != "") moduleName else super.desiredName


    setInline("Assert.v",
    s"""
      | module Assert #(parameter MSG="") (input clk, input reset, input test);
      |     always @(posedge clk)
      |     begin
      |         if (~reset && test !== 1)
      |         begin
      |             $$display("ASSERTION %s FAILED in %m", MSG);
      |             $$finish;
      |         end
      |     end
      | endmodule
    """.stripMargin)
}

class AssertIgnoreXZ(message: String="") extends BlackBox(Map("MSG" -> message)) with HasBlackBoxInline {
    val io = IO(new Bundle{
      val clk  = Input(Clock())
      val reset = Input(Bool())
      val test = Input(Bool())
    })
    // override def desiredName = if(moduleName != "") moduleName else super.desiredName
    setInline("AssertIgnoreXZ.v",
    s"""
      | module AssertIgnoreXZ #(parameter MSG="") (input clk, input reset, input test);
      |     always @(posedge clk)
      |     begin
      |         if (~reset && test != 1)
      |         begin
      |             $$display("ASSERTION %s FAILED in %m", MSG);
      |             $$finish;
      |         end
      |     end
      | endmodule
    """.stripMargin)
}

package fpgamshr.util

import chisel3._
import chisel3.experimental._
import chisel3.util.{HasBlackBoxResource}
import scala.collection.mutable.HashMap

object FileLogger {
  val enabled = true
  val sameFileNamesCounters: HashMap[String, Int] = HashMap()
  def apply(fileName: String, clock: Clock, trigger: Bool, in0: UInt, in1: Data=DontCare): Unit = {
    if(enabled) {
      val actualFileName = {
        if(sameFileNamesCounters contains fileName) {
          sameFileNamesCounters(fileName) = sameFileNamesCounters(fileName) + 1
          val (bareFileName, extension) = if(fileName contains ".") {fileName.split("\\.") match { case Array(x, y) => (x, "." + y) } } else (fileName, "")
          s"$bareFileName${sameFileNamesCounters(fileName)}$extension"
        } else {
          sameFileNamesCounters += (fileName -> 0)
          fileName
        }
      }
      if(in1 != DontCare) {
        val m = Module(new FileLogger(actualFileName, in0.getWidth, in1.asUInt.getWidth))
        m.io.clock := clock
        m.io.trigger := trigger
        m.io.in0 := in0
        m.io.in1 := in1
      } else {
        val m = Module(new FileLogger(actualFileName, in0.getWidth, 1))
        m.io.clock := clock
        m.io.trigger := trigger
        m.io.in0 := in0
        m.io.in1 := 0.U
      }
    }
  }
}

class FileLogger(fileName: String,
                 in0Width: Int,
                 in1Width: Int)
                 extends BlackBox(Map("IN0_WIDTH" -> in0Width,
                                      "IN1_WIDTH" -> in1Width,
                                      "FILE_NAME" -> fileName))
                 with HasBlackBoxResource {
    val io = IO(new Bundle{
      val clock  = Input(Clock())
      val trigger = Input(Bool())
      val in0 = Input(UInt(in0Width.W))
      val in1 = Input(UInt(in1Width.W))
    })
    setResource("/FileLogger.v")
}

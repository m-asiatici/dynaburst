package fpgamshr.reqhandler.cuckoo.variablelength

import chisel3._
import fpgamshr.interfaces._
import fpgamshr.util._
import chisel3.util._

class DeallocReorderBuffer[T <: Data](dataType: T, matchingFunction: (T, T) => Bool, numEntries: Int) extends Module {
  val io = IO(new Bundle{
    val enq = Flipped(DecoupledIO(dataType))
    val deq = DecoupledIO(dataType)
    val releaseEntry = Flipped(ValidIO(dataType))
  })

  class Entry[T <: Data](dataType: T) extends ModularBundle with HasValid {
    val data = dataType.cloneType
    val ready = Bool()

    def getInvalidEntry(): Entry[T] = {
      val w = Wire(this)
      w.invalidate()
      w.ready := DontCare
      w.data := DontCare
      w
    }

    def storeRequest(in: T): Unit = {
      this.data := in
      this.setValid()
      this.ready := false.B
    }

    override def cloneType = (new Entry(dataType)).asInstanceOf[this.type]
  }
  val entries = RegInit(Vec(Seq.fill(numEntries)((new Entry(dataType)).getInvalidEntry())))
  val (enqPtr, _) = Counter(io.enq.fire(), numEntries)
  val (deqPtr, _) = Counter(io.deq.fire(), numEntries)
  val full = Vec(entries.map(_.valid)).asUInt.andR
  io.enq.ready := ~full
  entries.zipWithIndex.foreach({case (entry, idx) => {
    when((enqPtr === idx.U) & ~entry.valid & io.enq.valid) {
      entry.storeRequest(io.enq.bits)
    }
    when(io.releaseEntry.valid & entry.valid & matchingFunction(entry.data, io.releaseEntry.bits)) {
      entry.ready := true.B
    }
    when((deqPtr === idx.U) & entry.valid & entry.ready & io.deq.ready) {
      entry.invalidate()
    }
  }})
  io.deq.bits := MuxLookup(deqPtr, entries(0).data, entries.zipWithIndex.map({case(entry, idx) => (idx.U -> entry.data)}))
  io.deq.valid := MuxLookup(deqPtr, false.B, entries.zipWithIndex.map({case(entry, idx) => (idx.U -> (entry.valid & entry.ready))}))
  Assert(clock, reset, ~io.enq.valid | ~Vec(entries.map(x => matchingFunction(x.data, io.enq.bits) & x.valid)).asUInt.orR, "entry being enqueued in DeallocReorderBuffer should not exist before")
  Assert(clock, reset, ~(io.enq.valid & ~io.enq.ready), "should not try to insert a new entry when DeallocReorderBuffer is full")
  Assert(clock, reset, ~(RegNext(enqPtr === deqPtr, init=false.B) & RegNext(full, init=false.B) & (enqPtr === deqPtr + 1.U)), "enqPtr cannot pass ahead of deqPtr")
  val empty = ~Vec(entries.map(_.valid)).asUInt.orR
  Assert(clock, reset, MuxLookup(deqPtr, false.B, entries.zipWithIndex.map({case(entry, idx) => (idx.U -> (entry.valid))})) | empty, "deqPtr must point to a valid entry when buffer is not empty")
}

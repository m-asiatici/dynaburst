package fpgamshr.util

import chisel3._
import chisel3.util._
import fpgamshr.interfaces._
import fpgamshr.util._

class BRAMQueueIO(addrWidth: Int, dataWidth: Int) extends Bundle {
  val enq = Flipped(DecoupledIO(UInt(dataWidth.W)))
  val deq = DecoupledIO(UInt(dataWidth.W))
  val count = Output(UInt((addrWidth+1).W))
  val almostEmpty = Output(Bool())
}

class UpdatableBRAMQueueIO[T <: Data](counterAddrWidth: Int, storageAddrWidth: Int, dataType: T) extends Bundle {
  val update = Flipped(ValidIO(new AddrArbitraryDataIO(counterAddrWidth, dataType)))
  val allocEntry = Input(Bool())
  val enqPtr = Output(UInt(counterAddrWidth.W))
  val enqPtrPlusOne = Output(UInt(counterAddrWidth.W))
  val deqPtr = Output(UInt(counterAddrWidth.W))
  val deq = DecoupledIO(dataType)
  val count = Output(UInt((storageAddrWidth+1).W))
  val almostEmpty = Output(Bool())
}

class BRAMQueue(dataWidth: Int, depth: Int, resetCount: Int=0, almostEmptyMargin: Int=0, initFilePath: String="") extends Module {
    val addrWidth = log2Ceil(depth)
    val io = IO(new BRAMQueueIO(addrWidth, dataWidth))

    val memory = Module(new XilinxSimpleDualPortNoChangeBRAM(width=dataWidth, depth=depth, initFile=initFilePath))

    memory.io.clock := clock
    memory.io.reset := reset
    val full = Wire(Bool())
    val empty = Wire(Bool())
    val wrEn = io.enq.valid & ~full

    /* Enqueue side */
    /* Nothing fancy here */
    val enqPtr = Counter(wrEn, depth)
    memory.io.addra := enqPtr._1
    memory.io.wea := wrEn
    memory.io.dina := io.enq.bits

    /* Dequeue side */
    /* To minimize latency and avoid bubbles despite the fact that the memory
     * has a 2-cycle latency, we try to always fill up the output 2-stage
     * pipeline. For this reason, we distinguish the situation where the entire
     * FIFO is empty (when empty = true) from that of only the BRAM is empty,
     * but there may be some valid elements in the output pipeline
     * (bramEmpty = true). */
    val bramEmpty = Wire(Bool())
    val rdEn = Wire(Bool())
    val deqPtr = Counter(rdEn, depth)
    memory.io.addrb := deqPtr._1
    val enb = Wire(Bool())
    val regceb = Wire(Bool())
    val valid0 = RegEnable(~bramEmpty, init=false.B, enable=enb)
    enb := (~bramEmpty & ~valid0) | regceb
    memory.io.enb := enb
    rdEn := enb & ~bramEmpty
    val valid1 = RegEnable(valid0, init=false.B, enable=regceb)
    regceb := (valid0 & ~valid1) | io.deq.ready
    memory.io.regceb := regceb
    io.deq.valid := valid1
    io.deq.bits := memory.io.doutb

    /* Element counter */
    val elemCounter = Module(new SimultaneousUpDownSaturatingCounter(depth, resetCount))
    elemCounter.io.increment := wrEn
    elemCounter.io.decrement := rdEn
    elemCounter.io.load := false.B
    elemCounter.io.loadValue := DontCare
    full := elemCounter.io.saturatingUp
    bramEmpty := elemCounter.io.saturatingDown
    empty := bramEmpty & ~valid0 & ~valid1
    io.enq.ready := ~full

    when(valid0 & valid1) {
        io.count := elemCounter.io.currValue + 2.U
    } .elsewhen(valid0 | valid1) {
        io.count := elemCounter.io.currValue + 1.U
    } .otherwise {
        io.count := elemCounter.io.currValue
    }

    io.almostEmpty := io.count <= almostEmptyMargin.U
}

class UpdatableBRAMQueue[T <: Data](dataType: T, storageDepth: Int, counterDepth: Option[Int], resetCount: Int=0, almostEmptyMargin: Int=0, initFilePath: String="") extends Module {
  /* About storage vs counter depth:
   * storageDepth is the actual queue depth, counterDepth >= storageDepth is the
   * maximum count for enqPtr and deqPtr; for the purpose of actual queue
   * addressing, we discard the most significant bits of the counters if they
   * are wider than the queue address.
   * Normally, storageDepth = counterDepth. In the variable length MSHR buffer,
   * we use counterDepth = 2 * storageDepth when getFullBurstOnFailedBurstUpdate
   * is true. The reason for this is that each MSHR can have up to 2 memory
   * requests (the dummy one and the full burst); however, the queue will always
   * contain one entry per MSHR at most because, if the entry is still in the
   * queue, we will simply update it without the need to request the full burst.
   * Nevertheless, some MSHRs may have two requests in flight (one in the queue,
   * the other truly in flight), which may cause enqPtr to pass ahead the queuePtr
   * of some entries whose request is in flight. If this happens, it may look
   * like these MSHRs have been just inserted and can still be updated, while
   * their request is actually in flight. To avoid this, we need to be able to
   * distinguish two queueAddr that look the same, except that one belongs to
   * the following iteration (enqPtr actually wrapped around once between the
   * respective allocations). We do this by adding one bit to enqPtr, deqPtr and
   * the queueAddr of the MSHR. This means that logically the queue will look
   * twice as big, thus able to give two distinct queueAddr per MSHR, but the
   * actual storage can still be halved due to the fact that one MSHR will have
   * at most one request actually in the extMemQueue.
   */
  val actualStorageDepth = 1 << log2Ceil(storageDepth)
  val actualCounterDepth = 1 << log2Ceil(counterDepth.getOrElse(storageDepth))
  val storageAddrWidth = log2Ceil(storageDepth)
  val counterAddrWidth = log2Ceil(actualCounterDepth)
  def counterToStorage(counter: UInt): UInt = counter(storageAddrWidth-1,0)
  val io = IO(new UpdatableBRAMQueueIO(counterAddrWidth, storageAddrWidth, dataType))

  val dataWidth = dataType.getWidth
  val memory = Module(new XilinxSimpleDualPortNoChangeBRAM(width=dataWidth, depth=actualStorageDepth, initFile=initFilePath))
  memory.defaultBindings(clock, reset)

  val full = Wire(Bool())
  val empty = Wire(Bool())
  val wrEn = io.update.valid & (~io.allocEntry | ~full)

  /* Enqueue/update */
  /* When io.allocEntry is set, behaves like enq port of BRAMQueue with io.update.bits.data as enq.bits.
   * io.enqPtr is exposed as the address where the queue is writing.
   * Otherwise, enqPtr is not increment and uses io.update.bits.addr as addr. */
  val (enqPtr, _) = Counter(io.allocEntry, actualCounterDepth)
  val enqPtrPlusOne = RegInit(1.U(counterAddrWidth.W))
  when(io.allocEntry) {
    enqPtrPlusOne := enqPtrPlusOne + 1.U
  }
  io.enqPtr := enqPtr
  io.enqPtrPlusOne := enqPtrPlusOne
  memory.write(
    wrAddr=counterToStorage(Mux(io.allocEntry, enqPtr, io.update.bits.addr)),
    wrData=io.update.bits.data.asUInt,
    wrEn=wrEn)

  /* Dequeue side */
  /* To minimize latency and avoid bubbles despite the fact that the memory
   * has a 2-cycle latency, we try to always fill up the output 2-stage
   * pipeline. For this reason, we distinguish the situation where the entire
   * FIFO is empty (when empty = true) from that of only the BRAM is empty,
   * but there may be some valid elements in the output pipeline
   * (bramEmpty = true). */
  val bramEmpty = Wire(Bool())
  val rdEn = Wire(Bool())
  val (deqPtr, _) = Counter(rdEn, actualCounterDepth)
  memory.io.addrb := counterToStorage(deqPtr)
  io.deqPtr := deqPtr
  val enb = Wire(Bool())
  val regceb = Wire(Bool())
  val valid0 = RegEnable(~bramEmpty, init=false.B, enable=enb)
  enb := (~bramEmpty & ~valid0) | regceb
  memory.io.enb := enb
  rdEn := enb & ~bramEmpty
  val valid1 = RegEnable(valid0, init=false.B, enable=regceb)
  regceb := /*(valid0 & ~valid1) |*/ io.deq.ready
  memory.io.regceb := regceb
  io.deq.valid := valid1

  val invalidDataEntry = Wire(ValidIO(new AddrArbitraryDataIO(storageAddrWidth, dataType)))
  invalidDataEntry.valid := false.B
  invalidDataEntry.bits := DontCare
  val dataInPipeline = RegInit(Vec(Seq.fill(XilinxSimpleDualPortNoChangeBRAM.latency)(invalidDataEntry)))
  val matches = Vec((Array(memory.io.addrb) ++ dataInPipeline.map(_.bits.addr)).map(x => ((x === counterToStorage(io.update.bits.addr)) & io.update.valid)))
  when(enb) {
    dataInPipeline(0).bits.addr := memory.io.addrb
  }
  when(enb | matches(1)) {
    dataInPipeline(0).valid := Mux(enb, matches(0), matches(1))
    dataInPipeline(0).bits.arbData := io.update.bits.arbData
  }
  when(regceb) {
    dataInPipeline(1).bits.addr := dataInPipeline(0).bits.addr
  }
  when(regceb | matches(2)) {
    dataInPipeline(1).valid := Mux(regceb, matches(1) | dataInPipeline(0).valid, matches(2))
    dataInPipeline(1).bits.arbData := Mux((matches(2) & ~regceb)|(matches(1) & regceb), io.update.bits.arbData, dataInPipeline(0).bits.arbData)
  }
  io.deq.bits := MuxCase(dataType.fromBits(memory.io.doutb), Array(/*(matches(2) -> io.update.bits.arbData),*/ (dataInPipeline(1).valid -> dataInPipeline(1).bits.arbData)))

  /* Element counter */
  val elemCounter = Module(new SimultaneousUpDownSaturatingCounter(actualStorageDepth, resetCount))
  elemCounter.io.increment := io.allocEntry & wrEn
  elemCounter.io.decrement := rdEn
  elemCounter.io.load := false.B
  elemCounter.io.loadValue := DontCare
  full := elemCounter.io.saturatingUp
  bramEmpty := elemCounter.io.saturatingDown
  empty := bramEmpty & ~valid0 & ~valid1

  when(valid0 & valid1) {
      io.count := elemCounter.io.currValue + 2.U
  } .elsewhen(valid0 | valid1) {
      io.count := elemCounter.io.currValue + 1.U
  } .otherwise {
      io.count := elemCounter.io.currValue
  }

  Assert(clock, reset, ~io.update.valid | io.allocEntry | // no update or enqueueing new entry
    full | // any entry works
    Mux(counterToStorage(io.deqPtr) <= counterToStorage(io.enqPtr),                         // entry being updated is in the queue
      (counterToStorage(io.deqPtr) <= counterToStorage(io.update.bits.addr)) & (counterToStorage(io.update.bits.addr) < counterToStorage(io.enqPtr)),
      (counterToStorage(io.deqPtr) <= counterToStorage(io.update.bits.addr)) | (counterToStorage(io.update.bits.addr) < counterToStorage(io.enqPtr))) |
    matches.asUInt.orR, // or is in the output pipeline
    "must update an existing entry in extMemQueue"
  )

  Assert(clock, reset, ~(io.update.valid & ~wrEn), "wrEn should be active when io.update.valid (memory is probably full)")
  Assert(clock, reset, ~(io.update.valid & io.allocEntry & full), "enqPtr should not wrap around deqPtr")
  Assert(clock, reset, ~(matches(2) & io.deq.valid), "matches(2) should never get enabled")

  io.almostEmpty := io.count <= almostEmptyMargin.U

}

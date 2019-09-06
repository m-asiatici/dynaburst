package fpgamshr.reqhandler.cuckoo.variablelength

import chisel3._
import chisel3.util._
import fpgamshr.interfaces._
import fpgamshr.util._
import fpgamshr.profiling._
import chisel3.core.dontTouch

object ResponseGenerator {
  val memDataWidth = 512
  val reqDataWidth = 32
  val numEntriesPerRow = 4
  val rowAddrWidth = 8
  val idWidth = 10
  val inputQueuesDepth = 32

  val dataBufferAddrWidth = 5
  val burstLenWidth = 2
  val bramLatency = 2
}

class ResponseGenerator(idWidth: Int=ResponseGenerator.idWidth, dataBufferAddrWidth: Int=ResponseGenerator.dataBufferAddrWidth, burstLenWidth: Int=ResponseGenerator.burstLenWidth, memDataWidth: Int=ResponseGenerator.memDataWidth, reqDataWidth: Int=ResponseGenerator.reqDataWidth, numEntriesPerRow: Int=ResponseGenerator.numEntriesPerRow) extends Module {
    require(isPow2(memDataWidth / reqDataWidth))
    require(numEntriesPerRow > 0)
    val offsetWidth = log2Ceil(memDataWidth / reqDataWidth)
    val maxOffset = (1 << offsetWidth) - 1
    val inputQueuesDepth = ResponseGenerator.inputQueuesDepth
    val io = IO(new Bundle{
      val inReq = DecoupledIO(new RespGenVariableLengthIO(dataBufferAddrWidth, burstLenWidth, offsetWidth, idWidth, numEntriesPerRow)).flip
      val outDataBufferReq = ValidIO(UInt(dataBufferAddrWidth.W))
      val outDataBufferPipelineEnable = Output(Bool())
      val outDataBufferDeallocRows = ValidIO(UInt(burstLenWidth.W))
      val inMemData = Flipped(ValidIO(UInt(memDataWidth.W)))
      val outReqData = DecoupledIO(new DataIdIO(reqDataWidth, idWidth))
      val axiProfiling = new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth)
    })

    /* Input queue */
    val inputQueue = Module(new Queue(io.inReq.bits.cloneType, inputQueuesDepth))
    inputQueue.io.enq <> io.inReq

    /* Control signals (written by the FSM) */
    /* Enable currentEntryIndex counter */
    val entryIndexEnCount = Wire(Bool())
    /* Load new value in currentEntryIndex counter */
    val entryIndexLoad = Wire(Bool())
    /* The current set of output data is the last one, consume it from the queue */
    val responseDone = Wire(Bool())
    /* The current set of output data is valid */
    val outValid = Wire(Bool())
    val outReady = Wire(Bool())
    /* It is not the first iteration, so all the currently selected entries are valid */
    val notFirst = Wire(Bool())
    /* A new response is available: trigger the FSM */
    val internalStall = Wire(Bool())
    val responseStart = inputQueue.io.deq.valid & ~internalStall
    inputQueue.io.deq.ready := responseDone & ~internalStall

    /* Datapath */
    val currRowEntries = inputQueue.io.deq.bits.entries
    val currRowDataBufferAddr = inputQueue.io.deq.bits.dataBufferAddr
    val currRowLastValidEntry = Mux(inputQueue.io.deq.bits.isFakeDealloc, 0.U, inputQueue.io.deq.bits.lastValidIdx)
    val currRowBurstStart = inputQueue.io.deq.bits.burstStart
    val currRowData = io.inMemData.bits

    val entrySelectionMuxNumInputs = numEntriesPerRow
    val currentEntryIndex = ExclusiveUpDownSaturatingCounter(
      maxVal=entrySelectionMuxNumInputs-1,
      upDownN=false.B,
      en=entryIndexEnCount,
      load=entryIndexLoad,
      loadValue=currRowLastValidEntry-1.U
    )

    val currentEntry = Wire(io.inReq.bits.entries(0).cloneType)
    val entryMuxMappings = currRowEntries.zipWithIndex.map({case (port, index) => (index.U -> port)})
    val dataMuxMappings = (0 to maxOffset).map(offset => (offset.U -> currRowData((offset + 1) * reqDataWidth - 1, offset * reqDataWidth)))
    currentEntry := MuxLookup(Mux(notFirst, currentEntryIndex, currRowLastValidEntry), currRowEntries(0), entryMuxMappings)
    io.outDataBufferReq.bits := currentEntry.burstOffset + currRowDataBufferAddr - currRowBurstStart
    io.outDataBufferReq.valid := inputQueue.io.deq.valid & outReady & ~inputQueue.io.deq.bits.isFakeDealloc
    io.outDataBufferPipelineEnable := outReady
    /* Assign something to the ID to prevent outReqData to propagate an
     * unitialized ID which, in simulation, would cause the crossbar to assign X
     * to outReqData.ready and thus outReady */
    val nullEntry = Wire(currentEntry.dropBurstOffset.cloneType)
    nullEntry.id := 0.U
    nullEntry.offset := 0.U
    val delayedEntry = ShiftRegister(currentEntry.dropBurstOffset, ResponseGenerator.bramLatency, resetData=nullEntry, en=outReady)
    val delayedValid = ShiftRegister(inputQueue.io.deq.valid, ResponseGenerator.bramLatency, resetData=false.B, en=outReady)
    val delayedBurstLen = ShiftRegister(inputQueue.io.deq.bits.burstLen, ResponseGenerator.bramLatency, outReady)
    val delayedDataBufferAddr = ShiftRegister(inputQueue.io.deq.bits.dataBufferAddr, ResponseGenerator.bramLatency, outReady)
    val delayedIsLastRow = ShiftRegister(inputQueue.io.deq.bits.isLastRow, ResponseGenerator.bramLatency, outReady)
    val delayedIsFakeDealloc = ShiftRegister(inputQueue.io.deq.bits.isFakeDealloc, ResponseGenerator.bramLatency, outReady)

    io.outReqData.bits.data := MuxLookup(delayedEntry.offset, currRowData(reqDataWidth-1, 0), dataMuxMappings)
    io.outReqData.bits.id := delayedEntry.id
    outReady := io.outReqData.ready | ~io.outReqData.valid
    io.outReqData.valid := ShiftRegister(outValid, ResponseGenerator.bramLatency, resetData=false.B, outReady)

    val deallocReorderBuffer = Module(new DeallocReorderBuffer(new BurstParamsIO(dataBufferAddrWidth, burstLenWidth), (x: BurstParamsIO, y: BurstParamsIO) => x.dataBufferAddr === y.dataBufferAddr, SubentryBuffer.deallocReorderBufferSize))
    deallocReorderBuffer.io.releaseEntry.valid := delayedValid & delayedIsLastRow &
      outReady & ShiftRegister(responseDone, ResponseGenerator.bramLatency, outReady)
    deallocReorderBuffer.io.releaseEntry.bits.dataBufferAddr := delayedDataBufferAddr
    deallocReorderBuffer.io.releaseEntry.bits.burstLen := delayedBurstLen
    deallocReorderBuffer.io.enq.valid := inputQueue.io.deq.fire() & inputQueue.io.deq.bits.isFirstRow
    deallocReorderBuffer.io.enq.bits connectAllExisting inputQueue.io.deq.bits
    deallocReorderBuffer.io.deq.ready := true.B
    internalStall := ~deallocReorderBuffer.io.enq.ready & inputQueue.io.deq.bits.isFirstRow & inputQueue.io.deq.valid
    io.outDataBufferDeallocRows.bits := deallocReorderBuffer.io.deq.bits.burstLen
    io.outDataBufferDeallocRows.valid := deallocReorderBuffer.io.deq.valid
    Assert(clock, reset, ~(~deallocReorderBuffer.io.enq.ready & deallocReorderBuffer.io.enq.valid), "should not have to write in a full dealloc reorder buffer in the response generator")
    Assert(clock, reset,  ~io.outDataBufferDeallocRows.valid | (deallocReorderBuffer.io.deq.bits.dataBufferAddr === RegEnable(deallocReorderBuffer.io.deq.bits.burstLen + deallocReorderBuffer.io.deq.bits.dataBufferAddr + 1.U, enable=io.outDataBufferDeallocRows.valid)),
      "data buffer deallocations must be sequential and without gaps")
    // io.outDataBufferDeallocRows.bits := delayedBurstLen
    // io.outDataBufferDeallocRows.valid := delayedValid & delayedIsLastRow &
    //   outReady & ShiftRegister(responseDone, ResponseGenerator.bramLatency, outReady)
    // FileLogger("respGen.txt", clock, io.outReqData.fire(), io.outReqData.bits.id)
    /* FSM */
    val sIdle :: sScan :: Nil = Enum(2)
    val state = Reg(init=sIdle)

    switch(state) {
      is (sIdle) {
        when (responseStart & (currRowLastValidEntry != 0.U) & outReady) {
          state := sScan
        }
      }
      is (sScan) {
        when (outReady & (currentEntryIndex === 0.U)) {
            state := sIdle
        }
      }
    }

    entryIndexEnCount := false.B
    entryIndexLoad := false.B
    responseDone := false.B
    outValid := false.B
    notFirst := false.B

    switch(state) {
      is (sIdle) {
        when (responseStart) {
          outValid := ~inputQueue.io.deq.bits.isFakeDealloc
          when (outReady) {
            when (currRowLastValidEntry === 0.U) {
              responseDone := true.B
            } .otherwise {
              entryIndexLoad := true.B
            }
          }
        }
      }
      is (sScan) {
        entryIndexEnCount := true.B
        outValid := true.B
        notFirst := true.B
        when (outReady) {
          when (currentEntryIndex === 0.U) {
            responseDone := true.B
          }
        } .otherwise {
          entryIndexEnCount := false.B
        }
      }
    }

    // val stallCounter = ExclusiveUpDownWrappingCounter(maxVal=65535,
    //   upDownN=true.B, en=(inputQueue.io.deq.valid & ~inputQueue.io.deq.ready),
    //   load=inputQueue.io.deq.ready,
    //   loadValue=0.U)
    // dontTouch(stallCounter)


    if(Profiling.enable) {
        val acceptedInputsCount = ProfilingCounter(inputQueue.io.deq.valid & inputQueue.io.deq.ready, io.axiProfiling)
        val responsesSentOutCount = ProfilingCounter(io.outReqData.valid & io.outReqData.ready, io.axiProfiling)
        val cyclesOutNotReady = ProfilingCounter(io.outReqData.valid & ~io.outReqData.ready, io.axiProfiling)
        val cyclesInternalStall = ProfilingCounter(responseDone & internalStall & inputQueue.io.deq.valid, io.axiProfiling)
        val fakeDeallocs = ProfilingCounter(inputQueue.io.deq.bits.isFakeDealloc & inputQueue.io.deq.fire(), io.axiProfiling)
        val profilingRegisters = Array(acceptedInputsCount, responsesSentOutCount, cyclesOutNotReady, cyclesInternalStall, fakeDeallocs)
        val profilingInterface = ProfilingInterface(io.axiProfiling.axi, Vec(profilingRegisters))
        io.axiProfiling.axi.RDATA := profilingInterface.bits
        io.axiProfiling.axi.RVALID := profilingInterface.valid
        profilingInterface.ready := io.axiProfiling.axi.RREADY
        io.axiProfiling.axi.RRESP := 0.U
    } else {
        io.axiProfiling.axi.ARREADY := false.B
        io.axiProfiling.axi.RVALID := false.B
        io.axiProfiling.axi.RDATA := DontCare
        io.axiProfiling.axi.RRESP := DontCare
    }
}

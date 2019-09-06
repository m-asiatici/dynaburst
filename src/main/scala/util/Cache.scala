package fpgamshr.util

import chisel3._
import chisel3.util._
import fpgamshr.interfaces._
import fpgamshr.profiling._

import java.io._ // To generate the BRAM initialization files

object Cache {
    val addrWidth = 32
    val reqDataWidth = 32
    val memDataWidth = 512
    val idWidth = 8
    val numWays = 4
    val sizeBytes = 4096
    val sizeReductionWidth = 0
    val numSets = sizeBytes / (memDataWidth / 8) / numWays
}

class Cache(addrWidth: Int=Cache.addrWidth, idWidth: Int=Cache.idWidth, reqDataWidth: Int=Cache.reqDataWidth, memDataWidth: Int=Cache.memDataWidth, sizeReductionWidth: Int=Cache.sizeReductionWidth) extends Module {
    val io = IO(new CacheIO(addrWidth, idWidth, reqDataWidth, memDataWidth, sizeReductionWidth))
}

class DummyCache(addrWidth: Int=Cache.addrWidth, idWidth: Int=Cache.idWidth, reqDataWidth: Int=Cache.reqDataWidth, memDataWidth: Int=Cache.memDataWidth, sizeReductionWidth: Int=Cache.sizeReductionWidth) extends Cache(addrWidth, idWidth, reqDataWidth, memDataWidth, sizeReductionWidth) {
    io.outMisses <> io.inReq
    io.outData.valid := false.B
    io.outData.bits := DontCare
    io.inData.ready := true.B
    if(Profiling.enable) {
      val receivedRequestsCount = ProfilingCounter(io.inReq.valid & io.inReq.ready, io.axiProfiling)
      val hitCount = 0.U(Profiling.dataWidth.W)
      val cyclesOutMissesStall = ProfilingCounter(io.outMisses.valid & ~io.outMisses.ready, io.axiProfiling)
      val cyclesOutDataStall = 0.U(Profiling.dataWidth.W)
      val profilingRegisters = Array(receivedRequestsCount, hitCount, cyclesOutMissesStall, cyclesOutDataStall)
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

class RRCache(addrWidth: Int=Cache.addrWidth, idWidth: Int=Cache.idWidth, reqDataWidth: Int=Cache.reqDataWidth, memDataWidth: Int=Cache.memDataWidth, numWays: Int=Cache.numWays, sizeBytes: Int=Cache.sizeBytes, sizeReductionWidth: Int=Cache.sizeReductionWidth) extends Cache(addrWidth, idWidth, reqDataWidth, memDataWidth, sizeReductionWidth) {
    require(isPow2(reqDataWidth))
    require(isPow2(memDataWidth))
    require(isPow2(numWays))
    require(isPow2(sizeBytes))

    val numSetsPerWay = sizeBytes / (memDataWidth / 8) / numWays
    val numSetsTotal = numSetsPerWay * numWays
    val offsetWidth = log2Ceil(memDataWidth / reqDataWidth)
    val setWidth = log2Ceil(numSetsPerWay)
    val tagWidth = addrWidth - offsetWidth - setWidth
    val maxSizeReduction = (1 << sizeReductionWidth)
    val minSetWidth = setWidth - maxSizeReduction
    val maxTagWidth = addrWidth - offsetWidth - minSetWidth
    val cacheLineType = new CacheLineNoValid(maxTagWidth, memDataWidth)
    //val cacheLineType = UInt(memDataWidth.W)
    val tagType = ValidIO(UInt(maxTagWidth.W))
    val memWidth = memDataWidth
    def getSet(input: UInt, setWidth: Int): UInt = input(offsetWidth + setWidth - 1, offsetWidth)
    def getSet(input: UInt, log2SizeReduction: UInt, setWidth: Int=setWidth): UInt = MuxLookup(log2SizeReduction, getSet(input, setWidth), (0 until (1 << log2SizeReduction.getWidth)).map(i => (i.U -> getSet(input, setWidth - i))))
    def getTag(input: UInt, tagWidth: Int=tagWidth, addrWidth: Int=addrWidth): UInt = input(addrWidth - 1, addrWidth - tagWidth)
    def getOffset(input: UInt, offsetWidth: Int=offsetWidth): UInt = input(offsetWidth - 1, 0)

    val dataMemories = Array.fill(numWays)(Module(new XilinxSimpleDualPortNoChangeBRAM(width=memWidth, depth=numSetsPerWay)).io)
//    cacheLines.zip(dataMemories).foreach{case(cl, mem) => cl.data := mem.read(rdAddr=getSet(io.inReq.bits.addr, io.log2SizeReduction), rdEn=inReqPipelineReady)}
    // val validMemories = Array.fill(numWays)(Module(new XilinxDoublePumped2W2RSDPBRAM(width=1, depth=numSetsPerWay, initFile=initFilePath)).io)
    val readTagMemory = Array.fill(numWays)(Module(new XilinxSimpleDualPortNoChangeBRAM(width=tagType.getWidth, depth=numSetsPerWay)).io)
    val updateTagMemory = Array.fill(numWays)(Module(new XilinxSimpleDualPortNoChangeBRAM(width=tagType.getWidth, depth=numSetsPerWay)).io)
    val invalidating = Wire(Bool()) /* Enabled while the cache is being invalidated */

    /* inReq delay network */
    val inReqPipelineReady = Wire(Bool())
    val delayedRequestThreeCycles = Wire(ValidIO(io.inReq.bits.cloneType))
    val delayedRequestTwoCycles = Wire(ValidIO(io.inReq.bits.cloneType))
    delayedRequestTwoCycles.bits := RegEnable(RegEnable(io.inReq.bits, enable=inReqPipelineReady), enable=inReqPipelineReady)
    delayedRequestTwoCycles.valid := RegEnable(RegEnable(io.inReq.valid & ~invalidating, init=false.B, enable=inReqPipelineReady), init=false.B, enable=inReqPipelineReady)
    delayedRequestThreeCycles.bits := RegEnable(delayedRequestTwoCycles.bits, enable=inReqPipelineReady)
    delayedRequestThreeCycles.valid := RegEnable(delayedRequestTwoCycles.valid, init=false.B, enable=inReqPipelineReady)
    io.inReq.ready := inReqPipelineReady & ~invalidating

    val cacheLines = Wire(Vec(numWays, cacheLineType))
    val valids = Wire(Vec(numWays, Bool()))
    /* b channel of memories: serve requests (read-only) */
    for(i <- 0 until numWays) {
        dataMemories(i).clock := clock
        dataMemories(i).reset := reset
        dataMemories(i).addrb := getSet(io.inReq.bits.addr, io.log2SizeReduction)
        dataMemories(i).enb := inReqPipelineReady
        dataMemories(i).regceb := inReqPipelineReady
        cacheLines(i).data := dataMemories(i).doutb

        //validMemories(i).clock2x := io.clock2x
        //validMemories(i).rdaddrb := getSet(io.inReq.bits.addr, io.log2SizeReduction)
        readTagMemory(i).clock := clock
        readTagMemory(i).reset := reset
        readTagMemory(i).addrb := getSet(io.inReq.bits.addr, io.log2SizeReduction)
        readTagMemory(i).regceb := inReqPipelineReady
        readTagMemory(i).enb := inReqPipelineReady
        valids(i) := tagType.fromBits(readTagMemory(i).doutb).valid
        cacheLines(i).tag := tagType.fromBits(readTagMemory(i).doutb).bits
    }
    val hits = (0 until numWays).map(
      i => valids(i) & MuxLookup(
        io.log2SizeReduction,
        cacheLines(i).tag === getTag(delayedRequestTwoCycles.bits.addr),
        (0 until maxSizeReduction).map(
          j => (j.U -> (cacheLines(i).tag(maxTagWidth-1, maxSizeReduction-j) === getTag(delayedRequestTwoCycles.bits.addr, tagWidth+j)))
        )
      )
    )

    val hit = RegEnable(Vec(hits).asUInt.orR, enable=inReqPipelineReady, init=false.B) & io.enabled
    val selectedLine = RegEnable(Mux1H(hits, cacheLines), enable=inReqPipelineReady)
    val delayedOffset = getOffset(delayedRequestThreeCycles.bits.addr)
    val selectedData = MuxLookup(delayedOffset, selectedLine.data(reqDataWidth-1, 0), (0 until memDataWidth by reqDataWidth).map(i => (i/reqDataWidth).U -> selectedLine.data(i+reqDataWidth-1, i)))

    /* outData EB and connections to output */
    val outDataEb = Module(new ElasticBuffer(io.outData.bits.cloneType))
    outDataEb.io.out <> io.outData
    outDataEb.io.in.valid := delayedRequestThreeCycles.valid & hit
    outDataEb.io.in.bits.id := delayedRequestThreeCycles.bits.id
    outDataEb.io.in.bits.data := selectedData

    /* outMisses EB and connections to output */
    val outMissesEb = Module(new ElasticBuffer(io.outMisses.bits.cloneType))
    outMissesEb.io.out <> io.outMisses
    outMissesEb.io.in.valid := delayedRequestThreeCycles.valid & ~hit
    outMissesEb.io.in.bits := delayedRequestThreeCycles.bits

    /* inReqPipelineReady */
    inReqPipelineReady := MuxCase(true.B, Array(outDataEb.io.in.valid -> outDataEb.io.in.ready, outMissesEb.io.in.valid -> outMissesEb.io.in.ready))

    /* inData (cache update) delay network */
    /* First, we read all the sets to figure out which ones are free. Then, we select one that is free. If they are all full, choose (pseudo)randomly. */
    val delayedData = Wire(ValidIO(io.inData.bits.cloneType))
    delayedData.bits := RegNext(RegNext(io.inData.bits))
    delayedData.valid := RegNext(RegNext(io.inData.fire(), init=false.B), init=false.B)
    /* a channels: cache update (read/write) and invalidation */
    val newCacheLine = Wire(cacheLineType)
    newCacheLine.tag := getTag(delayedData.bits.addr, maxTagWidth)
    newCacheLine.data := delayedData.bits.data
    val newTag = Wire(tagType)
    newTag.bits := newCacheLine.tag
    newTag.valid := ~invalidating
    val availableWaySelectionArbiter = Module(new Arbiter(Bool(), numWays))
    val wayToUpdateSelect = Wire(Vec(numWays, Bool()))
    val invalidationAddressEn = Wire(Bool())
    val invalidationAddress = Counter(invalidationAddressEn, numSetsPerWay)
    /* When an request gets sent out through outMisses but a deallocation
       to the respective MSHR preceeds it, a new MSHR and thus memory request
       will be generated even if the cache line will end up in cache. When this
       happens, and when the response to the new request returns, the cache line
       might still be in cache and so we should not write it again, otherwise
       we would waste a set with duplicated data. Therefore, the cache line
       should not be written to cache if it already exists.

       Checking for the tag can be done in parallel with checking for the valid
       bit; the drawback is that also the data cache must use TDP memories, whose
       minimum depth is 1024 instead of 512. */
    val hitsAPort = (0 until numWays).map(
      i => delayedData.valid & tagType.fromBits(updateTagMemory(i).doutb).valid & MuxLookup(
        io.log2SizeReduction,
        tagType.fromBits(updateTagMemory(i).doutb).bits === getTag(delayedData.bits.addr),
        (0 until maxSizeReduction).map(
          j => (j.U -> (tagType.fromBits(updateTagMemory(i).doutb).bits(maxTagWidth-1, maxSizeReduction-j) === getTag(delayedData.bits.addr, tagWidth+j)))
        )
      )
    )

    val hitOnAPort = Vec(hitsAPort).asUInt.orR
    for(i <- 0 until numWays) {
        // validMemories(i).addra := Mux(invalidating, invalidationAddress._1, getSet(Mux(delayedData.valid, delayedData.bits.addr, io.inData.bits.addr), io.log2SizeReduction))
        // validMemories(i).regcea := true.B
        // validMemories(i).ena := true.B
        // validMemories(i).wea := (delayedData.valid & wayToUpdateSelect(i) & ~hitOnAPort) | invalidating
        // validMemories(i).dina := ~invalidating
        // dataMemories(i).addra := getSet(Mux(delayedData.valid, delayedData.bits.addr, io.inData.bits.addr), io.log2SizeReduction)
        // dataMemories(i).regcea := true.B
        // dataMemories(i).ena := true.B
        // dataMemories(i).dina := newCacheLine.asUInt
        // dataMemories(i).wea := validMemories(i).wea
        // availableWaySelectionArbiter.io.in(i).valid := validMemories(i).douta === 0.U
        updateTagMemory(i).clock := clock
        updateTagMemory(i).reset := reset

        updateTagMemory(i).addrb := getSet(io.inData.bits.addr, io.log2SizeReduction)
        updateTagMemory(i).regceb := true.B
        updateTagMemory(i).enb := true.B
        availableWaySelectionArbiter.io.in(i).valid := ~tagType.fromBits(updateTagMemory(i).doutb).valid

        updateTagMemory(i).addra := Mux(invalidating, invalidationAddress._1, getSet(delayedData.bits.addr, io.log2SizeReduction))
        updateTagMemory(i).dina := newTag.asUInt
        updateTagMemory(i).wea := (delayedData.valid & wayToUpdateSelect(i) & ~hitOnAPort) | invalidating

        readTagMemory(i).addra := updateTagMemory(i).addra
        readTagMemory(i).dina := updateTagMemory(i).dina
        readTagMemory(i).wea := updateTagMemory(i).wea

        dataMemories(i).addra := getSet(delayedData.bits.addr, io.log2SizeReduction)
        dataMemories(i).dina := newCacheLine.data
        dataMemories(i).wea := updateTagMemory(i).wea
    }
    val lfsr = LFSR16(delayedData.valid)
    if (numWays > 1)
        wayToUpdateSelect := UIntToOH(Mux(availableWaySelectionArbiter.io.out.valid, availableWaySelectionArbiter.io.chosen, lfsr(log2Ceil(numWays)-1, 0))).toBools
    else
        wayToUpdateSelect(0) := true.B
    // io.inData.ready := true.B // ~delayedData.valid
    io.inData.ready := true.B // ~delayedData.valid | ~io.enabled

    /* Invalidation FSM */
    val sNormal :: sInvalidating :: Nil = Enum(2)
    val state = RegInit(init=sNormal)

    invalidating := false.B
    invalidationAddressEn := false.B
    switch(state) {
      is (sNormal) {
        when(io.invalidate) {
          state := sInvalidating
        }
      }
      is (sInvalidating) {
        invalidating := true.B
        invalidationAddressEn := true.B
        when(invalidationAddress._2) {
          state := sNormal
        }
      }
    }

    // It can still happen if we do two writes back to back to the same cache line
    // Nevertheless, it is rare enough that it is not worth the effort to try to filter this out
    // Assert(clock, reset, PopCount(hits) <= 1.U | ~io.enabled, "cannot hit in more than one way")
    Assert(clock, reset, (PopCount(updateTagMemory.map(_.wea)) <= 1.U) | invalidating, "cannot write to more than one way in the same cycle")


    if(Profiling.enable) {
      val receivedRequestsCount = ProfilingCounter(io.inReq.valid & io.inReq.ready, io.axiProfiling)
      val hitCount = ProfilingCounter(outDataEb.io.in.valid & outDataEb.io.in.ready, io.axiProfiling)
      val cyclesOutMissesStall = ProfilingCounter(io.outMisses.valid & ~io.outMisses.ready, io.axiProfiling)
      val cyclesOutDataStall = ProfilingCounter(io.outData.valid & ~io.outData.ready, io.axiProfiling)
      val redundantCacheLinesCount = ProfilingCounter(delayedData.valid & hitOnAPort, io.axiProfiling)
      val profilingRegisters = Array(receivedRequestsCount, hitCount, cyclesOutMissesStall, cyclesOutDataStall, redundantCacheLinesCount)
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

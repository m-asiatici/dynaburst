package fpgamshr.reqhandler.cuckoo.variablelength

import chisel3._
import chisel3.util._
import fpgamshr.interfaces._
import fpgamshr.util._
import fpgamshr.profiling._
import chisel3.core.dontTouch

object MSHR {
  val addrWidth = 30 /* Excluding the part that is always 0, i.e. the log2Ceil(reqDataWidth) least significant bits, and the req handler address (log2Ceil(numReqHandlers)) */
  val idWidth = 8
  val memDataWidth = 512
  val burstOffsetWidth = 2
  val ldBufRowAddrWidth = 8
  val reqDataWidth = 32

  val numHashTables = 2
  val numMSHRPerHashTable = 64
  val assocMemorySize = 4

  val bramLatency = 2
  val pipelineLatency = 5
  val maxMultConstWidth = 17 // If larger, the hash function will not be entirely mapped to a DSP48, failing timing
  val reqStashSize = 16
  val getFullBurstOnFailedBurstUpdate = false
  val alwaysGetFullBurst = false

  val dataBufferAddrWidth = 5
}

class CuckooMSHRVariableLength(addrWidth: Int = MSHR.addrWidth, numMSHRPerHashTable: Int = MSHR.numMSHRPerHashTable, numHashTables: Int = MSHR.numHashTables,
  idWidth: Int = MSHR.idWidth, memDataWidth: Int = MSHR.memDataWidth, burstOffsetWidth: Int = MSHR.burstOffsetWidth, dataBufferAddrWidth: Int = MSHR.dataBufferAddrWidth,
  reqDataWidth: Int = MSHR.reqDataWidth, ldBufRowAddrWidth: Int = MSHR.ldBufRowAddrWidth,
  assocMemorySize: Int = MSHR.assocMemorySize, sameHashFunction: Boolean = false, reqStashSize: Int = MSHR.reqStashSize,
  getFullBurstOnFailedBurstUpdate: Boolean=MSHR.getFullBurstOnFailedBurstUpdate) extends Module {

  require(isPow2(memDataWidth / reqDataWidth))
  require(isPow2(numMSHRPerHashTable))
  val offsetWidth = log2Ceil(memDataWidth / reqDataWidth)
  /* Address structure:
   -----------------------------------
   | burstTag | burstOffset | offset |
   -----------------------------------
   |      cacheLineTag      | offset |
   -----------------------------------
   */

  val burstTagWidth = addrWidth - burstOffsetWidth - offsetWidth
  val cacheLineTagWidth = addrWidth - offsetWidth
  val numMSHRTotal = numMSHRPerHashTable * numHashTables
  // See comments in UpdatableBRAMQueue about the if below
  val extMemQueueDepth = if (getFullBurstOnFailedBurstUpdate) numMSHRTotal * 2 else numMSHRTotal
  val extMemQueueAddrWidth = log2Ceil(extMemQueueDepth)
  // val memType = ValidIO(new MSHREntryVariableLength(burstTagWidth, ldBufRowAddrWidth, burstOffsetWidth, extMemQueueAddrWidth))
  val entryType = new MSHREntryVariableLength(burstTagWidth, ldBufRowAddrWidth, burstOffsetWidth, extMemQueueAddrWidth)
  val memType = ValidIO(entryType)
  val memWidth = memType.getWidth
  //val entryType = new MSHREntry(burstTagWidth, ldBufRowAddrWidth)
  val hashTableAddrWidth = log2Ceil(numMSHRPerHashTable)
  val hashMultConstWidth = if (burstTagWidth > MSHR.maxMultConstWidth) MSHR.maxMultConstWidth else burstTagWidth
  val extMemQueueEntryType = new MSHRExtMemType(burstTagWidth, burstOffsetWidth)
  /*
   * a = positive odd integer on addr.getWidth bits
  https://en.wikipedia.org/wiki/Universal_hashing#Avoiding_modular_arithmetic */
  /* The way the hash was computed, b was useless anyway, so we can remove it altogether. */
  private def hash(a: Int, tag: UInt): UInt = (a.U(hashMultConstWidth.W) * tag)(burstTagWidth - 1, burstTagWidth - hashTableAddrWidth)
  private def getBurstTag(addr: UInt): UInt = addr(addrWidth - 1, addrWidth - burstTagWidth)
  private def getOffset(addr: UInt): UInt = addr(offsetWidth - 1, 0)
  private def getBurstOffset(addr: UInt): UInt = addr(offsetWidth + burstOffsetWidth - 1, offsetWidth)

  val io = IO(new Bundle {
    val allocIn = DecoupledIO(new AddrIdIO(addrWidth, idWidth)).flip
    val deallocIn = DecoupledIO(new AddrDataBufferParamsIO(burstTagWidth, dataBufferAddrWidth, burstOffsetWidth)).flip
    /* FRQ = free (load buffer) row queue */
    val frqIn = DecoupledIO(UInt(ldBufRowAddrWidth.W)).flip
    /* Output to the load buffer unit */
    val outLdBuf = DecoupledIO(new MSHRVariableLengthToLdBufIO(offsetWidth, idWidth, dataBufferAddrWidth = dataBufferAddrWidth, burstOffsetWidth, rowAddrWidth = ldBufRowAddrWidth))
    /* Raised by the load buffer unit when the FRQ is empty and allocations
     * need to be stalled. */
    val stopAllocFromLdBuf = Input(Bool())
    /* Interface to memory arbiter, with burst requests to be sent to DDR */
    val outMem = DecoupledIO(extMemQueueEntryType)
    val alwaysGetFullBurst = Input(Bool())
    val axiProfiling = new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth)
  })

  // Support bundle classes
  object AddrDataBufferIdIO {
    def apply(a: AddrIdIO, b: AddrDataBufferParamsIO): AddrDataBufferIdIO = {
      require(a.addr.getWidth == b.addr.getWidth)
      val addrWidth = a.addr.getWidth
      val idWidth = a.id.getWidth
      val dataBufferAddrWidth = b.dataBufferAddr.getWidth
      val burstLenWidth = b.burstLen.getWidth
      new AddrDataBufferIdIO(addrWidth = addrWidth, dataBufferAddrWidth = dataBufferAddrWidth, burstLenWidth = burstLenWidth, idWidth = idWidth)
    }
  }

  class AddrDataBufferIdIO(val addrWidth: Int, val dataBufferAddrWidth: Int, val burstLenWidth: Int, val idWidth: Int)
    extends ModularBundle with HasAddr with HasDataBufferParams with HasID {
    override def cloneType = (new AddrDataBufferIdIO(addrWidth, dataBufferAddrWidth, burstLenWidth, idWidth)).asInstanceOf[this.type]
  }

  class AddrDataBufferIdAllocIO(addrWidth: Int, dataBufferAddrWidth: Int, burstLenWidth: Int, idWidth: Int)
    extends AddrDataBufferIdIO(addrWidth, dataBufferAddrWidth, burstLenWidth, idWidth) {
    val isAlloc = Bool()
    def asAlloc(): AddrIdIO = {
      val w = Wire(new AddrIdIO(addrWidth, idWidth))
      w.connectAllExisting(this)
      w
    }
    def isDealloc(): Bool = { ~this.isAlloc }
    override def cloneType = (new AddrDataBufferIdAllocIO(addrWidth, dataBufferAddrWidth, burstLenWidth, idWidth)).asInstanceOf[this.type]
  }

  class MSHRStashArbiterIO(addrWidth: Int, dataBufferAddrWidth: Int, idWidth: Int,
    val ldBufPtrWidth: Int, val burstOffsetWidth: Int, val queueAddrWidth: Int, val lastTableIdxWidth: Int)
    extends AddrDataBufferIdAllocIO(addrWidth, dataBufferAddrWidth, burstOffsetWidth, idWidth) with HasLdBufPtr with HasLastTableIdx with HasVariableLength with HasMaybeBurstOffset {
    def asRequest: AddrDataBufferIdAllocIO = {
      val w = Wire(new AddrDataBufferIdAllocIO(addrWidth, dataBufferAddrWidth, burstOffsetWidth, idWidth))
      w.connectAllExisting(this)
      w.isAlloc := this.isAlloc
      w
    }

    def asEntry(burstTagWidth: Int): MSHREntryVariableLengthLastTable = {
      val w = Wire(new MSHREntryVariableLengthLastTable(burstTagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth, lastTableIdxWidth))
      w.connectAllExisting(this)
      w.tag := this.addr(addrWidth - 1, addrWidth - burstTagWidth)
      w
    }

    override def cloneType = (new MSHRStashArbiterIO(addrWidth, dataBufferAddrWidth, idWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth, lastTableIdxWidth)).asInstanceOf[this.type]
  }

  class MSHRPipelineIO(addrWidth: Int, burstTagWidth: Int, dataBufferAddrWidth: Int, idWidth: Int, ldBufPtrWidth: Int, burstLenWidth: Int, queueAddrWidth: Int, lastTableIdxWidth: Int)
    extends ModularBundle {
    val isEntry = Bool()
    // _data can represent either a request (AddrDataBufferIdIO) or a stash entry
    // (MSHREntryVariableLengthLastTable). Behaves like a tagged union.
    private val _dataWidth = scala.math.max(
      (new AddrDataBufferIdAllocIO(addrWidth, dataBufferAddrWidth, burstLenWidth, idWidth)).getWidth,
      (new MSHREntryVariableLengthLastTable(burstTagWidth, ldBufPtrWidth, burstLenWidth, queueAddrWidth, lastTableIdxWidth).getWidth))
    val _data = UInt(_dataWidth.W)
    def asRequest(): AddrDataBufferIdAllocIO = {
      val w = Wire(new AddrDataBufferIdAllocIO(addrWidth, dataBufferAddrWidth, burstLenWidth, idWidth))
      w := this._data.asTypeOf(w)
      w
    }
    def asEntry(): MSHREntryVariableLengthLastTable = {
      val w = Wire(new MSHREntryVariableLengthLastTable(burstTagWidth, ldBufPtrWidth, burstLenWidth, queueAddrWidth, lastTableIdxWidth))
      w := this._data.asTypeOf(w)
      w
    }
    def isRequest(): Bool = ~this.isEntry
    def :=(that: AddrDataBufferIdAllocIO): Unit = {
      this._data := that.asUInt
      this.isEntry := false.B
    }
    def :=(that: MSHREntryVariableLengthLastTable): Unit = {
      this._data := that.asUInt
      this.isEntry := true.B
    }
    def connectStashArbiter(that: MSHRStashArbiterIO, isEntry: Bool, burstTagWidth: Int): Unit = {
      when(isEntry) {
        this := that.asEntry(burstTagWidth)
      }.otherwise {
        this := that.asRequest
      }
    }
    def getBurstTag(): UInt = Mux(this.isEntry, this.asEntry.tag, this.asRequest.addr(addrWidth - 1, addrWidth - burstTagWidth))
    override def cloneType = (new MSHRPipelineIO(addrWidth, burstTagWidth, dataBufferAddrWidth, idWidth, ldBufPtrWidth, burstLenWidth, queueAddrWidth, lastTableIdxWidth)).asInstanceOf[this.type]
  }

  val pipelineReady = Wire(Bool())

  /******************************* Input logic *******************************/
  val deallocInExtendedAddress = Wire(DecoupledIO(new AddrDataBufferParamsIO(addrWidth, dataBufferAddrWidth, burstOffsetWidth)))
  HelperFunctions.gatedConnect(deallocInExtendedAddress, io.deallocIn)
  deallocInExtendedAddress.bits := io.deallocIn.bits
  deallocInExtendedAddress.bits.addr := Cat(io.deallocIn.bits.addr, 0.U((offsetWidth + burstOffsetWidth).W))
  val inputArbiterPortCount = if(getFullBurstOnFailedBurstUpdate) 2 else 3
  val inputArbiter = Module(new Arbiter(AddrDataBufferIdIO(io.allocIn.bits, deallocInExtendedAddress.bits), inputArbiterPortCount))
  val stopAllocs = Wire(Bool())
  val stopDeallocs = Wire(Bool())
  val stallOnlyAllocs = Wire(Bool())

  /* Allocations that require updating the burst parameters of a memory request
   * that is not any more in the extMemQueue are stored in the request stash.
   * They will be replayed as soon as the respective response comes back from memory.
   * This is not very efficient but greatly simplifies handling of such (hopefully
   * rare) cases.
   * Inputs, ranked by decreasing priority: deallocations, request stash, allocations
   */
  val reqStash = if (getFullBurstOnFailedBurstUpdate) None else Some(Module(new RequestStash(addrWidth, burstTagWidth, idWidth, reqStashSize, MSHR.pipelineLatency)))
  HelperFunctions.gatedConnect(inputArbiter.io.in(0), deallocInExtendedAddress, ~stopDeallocs)
  inputArbiter.io.in(0).bits connectAllExisting deallocInExtendedAddress.bits
  if(getFullBurstOnFailedBurstUpdate) {
    HelperFunctions.gatedConnect(inputArbiter.io.in(1), io.allocIn, ~stopAllocs)
    inputArbiter.io.in(1).bits connectAllExisting io.allocIn.bits
  } else {
    HelperFunctions.gatedConnect(inputArbiter.io.in(1), reqStash.get.io.deq, ~stopAllocs)
    inputArbiter.io.in(1).bits connectAllExisting reqStash.get.io.deq.bits
    HelperFunctions.gatedConnect(inputArbiter.io.in(2), io.allocIn, ~(stopAllocs | reqStash.get.io.almostFull))
    inputArbiter.io.in(2).bits connectAllExisting io.allocIn.bits
  }

  /* Arbiter between input and stash. Input has higher priority: we try to put back
   * entries in the tables "in the background". */
  val stashArbiter = Module(new Arbiter(new MSHRStashArbiterIO(addrWidth, dataBufferAddrWidth, idWidth, ldBufRowAddrWidth, burstOffsetWidth, extMemQueueAddrWidth, log2Up(numHashTables)), 2))
  /* Queue containing entries that have been kicked out from the hash tables, and that we will try
   * to put back in one of their other possible locations.
   * It is searchable by tag, since it contains entries that we may need to read,
   * deallocate or update.
   */
  val stash = Module(new MSHRStashVariableLength(burstTagWidth, cacheLineTagWidth, ldBufRowAddrWidth, burstOffsetWidth, extMemQueueAddrWidth, assocMemorySize, log2Up(numHashTables), getFullBurstOnFailedBurstUpdate))
  HelperFunctions.gatedConnect(stashArbiter.io.in(0), inputArbiter.io.out)
  stashArbiter.io.in(0).bits connectAllExisting inputArbiter.io.out.bits
  stashArbiter.io.in(0).bits.isAlloc := inputArbiter.io.chosen =/= 0.U
  HelperFunctions.gatedConnect(stashArbiter.io.in(1), stash.io.deq)
  stashArbiter.io.in(1).bits connectAllExisting stash.io.deq.bits
  stashArbiter.io.in(1).bits.addr := Cat(stash.io.deq.bits.tag, 0.U((offsetWidth + burstOffsetWidth).W))
  stashArbiter.io.in(1).bits.isAlloc := true.B

  stashArbiter.io.out.ready := pipelineReady

  /********************************* Pipeline *********************************/
  /* stashArbiter.io.out -> register -> hash computation -> memory read address and register -> register -> data coming back from memory -> register -> data written back to memory */
  val invalidPipelineEntry = Wire(ValidIO(new MSHRPipelineIO(
    addrWidth, burstTagWidth, dataBufferAddrWidth, idWidth, ldBufRowAddrWidth, burstOffsetWidth, extMemQueueAddrWidth, log2Up(numHashTables))))
  invalidPipelineEntry.valid := false.B
  invalidPipelineEntry.bits := DontCare
  val memoryPipeline = RegInit(Vec(Seq.fill(MSHR.pipelineLatency)(invalidPipelineEntry)))
  /* Stage corresponding to the data currently on the memory output port */
  val refPipelineStage = memoryPipeline(MSHR.pipelineLatency - 2)
  val isRefFromStash = refPipelineStage.valid & refPipelineStage.bits.isEntry
  val isRefRequest = refPipelineStage.valid & refPipelineStage.bits.isRequest
  val isRefAlloc = isRefRequest & refPipelineStage.bits.asRequest.isAlloc
  val isRefDealloc = isRefRequest & refPipelineStage.bits.asRequest.isDealloc
  /* Stage corresponding to the data currently on the memory write port */
  val lastPipelineStage = memoryPipeline.last
  val isLastFromStash = lastPipelineStage.valid & lastPipelineStage.bits.isEntry
  val isLastRequest = lastPipelineStage.valid & lastPipelineStage.bits.isRequest
  val isLastAlloc = isLastRequest & lastPipelineStage.bits.asRequest.isAlloc
  val isLastDealloc = isLastRequest & lastPipelineStage.bits.asRequest.isDealloc

  /* We are probably being extra conservative here since the current extMemQueue
   * can update entries even when they are being read. */
  val (lastInFlightExtMemReq, _) = Counter(isLastDealloc & pipelineReady, numMSHRTotal)
  /* One entry per pipeline stage; whether the entry in that pipeline stage is from stash or not
   * Entries from the stash behave like allocations but they do not generate a new read to memory
   * nor a new allocation to the load buffer if they do not hit. */
  /* True if the respective pipeline stage contains an entry:
   - with the same tag as the request in refPipelineStage: */
  val pipelineMatches = memoryPipeline.map(x => (x.bits.getBurstTag === refPipelineStage.bits.getBurstTag) & refPipelineStage.valid & refPipelineStage.bits.isRequest & x.bits.isEntry & x.valid)
  /* - that must be deallocated. */
  val deallocPipelineEntries = memoryPipeline.zip(pipelineMatches).map{case (x, m) => m & ~x.bits.asEntry.ignoreNextResponse & refPipelineStage.bits.asRequest.isDealloc}
  /* - whose burst parameters are going to be tentatively updated, pending
   *   confirmation in the next cycle depending on extMemQueueUpdateAllowed. */
  val updatePipelineEntries = pipelineMatches.map(_ & refPipelineStage.bits.asRequest.isAlloc)
  // val confirmUpdatePipelineEntries = memoryPipeline map (x => x.bits.isEntry & x.bits.asEntry.burstUpdateRequired & x.bits.asEntry.extMemQueueUpdateAllowed)

  val minAllowedQueueAddr = Wire(UInt(extMemQueueAddrWidth.W))
  val maxAllowedQueueAddr = Wire(UInt(extMemQueueAddrWidth.W))

  when(pipelineReady) {
    memoryPipeline(0).bits.connectStashArbiter(stashArbiter.io.out.bits, stashArbiter.io.chosen === 1.U, burstTagWidth)
    memoryPipeline(0).valid := stashArbiter.io.out.valid
    for (i <- 1 until MSHR.pipelineLatency) {
      val w = Wire(memoryPipeline(0).bits.asEntry.cloneType)
      w := memoryPipeline(i - 1).bits.asEntry
      val (burstUpdateRequired, extMemQueueUpdateAllowed) = memoryPipeline(i - 1).bits.asEntry.computeBurstFlags(getBurstOffset(refPipelineStage.bits.asRequest.addr), minAllowedQueueAddr, maxAllowedQueueAddr)
      when(updatePipelineEntries(i-1) & burstUpdateRequired) {
        when(extMemQueueUpdateAllowed) {
          w.minBurstOffset := memoryPipeline(i - 1).bits.asEntry.minBurstOffset min getBurstOffset(refPipelineStage.bits.asRequest.addr)
          w.maxBurstOffset := memoryPipeline(i - 1).bits.asEntry.maxBurstOffset max getBurstOffset(refPipelineStage.bits.asRequest.addr)
          memoryPipeline(i).bits := w
        } .otherwise {
          if(getFullBurstOnFailedBurstUpdate) {
            w.minBurstOffset := 0.U
            w.maxBurstOffset := ((1 << burstOffsetWidth)-1).U
            w.ignoreNextResponse := true.B
            memoryPipeline(i).bits := w
          }
        }
      } .elsewhen(pipelineMatches(i - 1) & refPipelineStage.bits.asRequest.isDealloc & memoryPipeline(i-1).bits.asEntry.ignoreNextResponse) {
        w.ignoreNextResponse := false.B
        memoryPipeline(i).bits := w
      } .otherwise {
        memoryPipeline(i).bits := memoryPipeline(i - 1).bits
      }
      /* Implement in-flight deallocation of entries from the stash if memoryPipeline is the corresponding deallocation. */
      memoryPipeline(i).valid := memoryPipeline(i - 1).valid & ~(deallocPipelineEntries(i - 1) & ~memoryPipeline(i-1).bits.asEntry.ignoreNextResponse)
    }
  }

  val deallocRefEntry = memoryPipeline(MSHR.pipelineLatency - 3).valid &
    memoryPipeline(MSHR.pipelineLatency - 3).bits.isRequest &
    memoryPipeline(MSHR.pipelineLatency - 3).bits.asRequest.isDealloc &
    refPipelineStage.valid &
    refPipelineStage.bits.isEntry &
    ~refPipelineStage.bits.asEntry.ignoreNextResponse &
    (getBurstTag(memoryPipeline(MSHR.pipelineLatency - 3).bits.asRequest.addr) === refPipelineStage.bits.asEntry.tag)
  val deallocLastEntry = RegEnable(deallocRefEntry, enable=pipelineReady, init=false.B)

  /* Address hashing */
  val r = new scala.util.Random(42)
  val a = (0 until numHashTables).map(_ => r.nextInt(1 << hashMultConstWidth))
  val hashedTags = (0 until numHashTables).map(i => if (sameHashFunction) hash(a(0), memoryPipeline(0).bits.getBurstTag) else hash(a(i), memoryPipeline(0).bits.getBurstTag))

  /* Memories instantiation and interconnection */
  /* Memories are initialized with all zeros, which is fine for us since all the valids will be false */
  val memories = Array.fill(numHashTables)(Module(new SDPNoChangeWithStToLoad(addrWidth = hashTableAddrWidth, dataType = memType, numStages = 3)))
  val dataRead = memories.zip(hashedTags).map({
    case (mem, tag) => mem.read(
      rdAddr = RegEnable(tag, enable = pipelineReady),
      rdEn = pipelineReady)
  })
  val dataReadWithBurstFlags = dataRead.map(_.bits.getEntryWithBurstFlags(getBurstOffset(refPipelineStage.bits.asRequest.addr), minAllowedQueueAddr, maxAllowedQueueAddr, useActualBurstOffsets=isRefAlloc, getFullBurstOnFailedBurstUpdate))
  /* Matching and stash deallocation logic */
  /* For the pipeline entries, we select the speculative burst parameters if they
   * are going to be confirmed (confirmUpdatePipelineEntries) */
  // val pipelineStashEntries = memoryPipeline.zip(confirmUpdatePipelineEntries).map { case (entry, confirmUpdate) => entry.bits.asEntry.dropLastTableAndMaybeOffset(confirmUpdate) } ++ Array(stash.io.matchingEntry.bits)
  val pipelineStashEntries = memoryPipeline.map(_.bits.asEntry.getEntryWithBurstFlags(getBurstOffset(refPipelineStage.bits.asRequest.addr), minAllowedQueueAddr, maxAllowedQueueAddr, useActualBurstOffsets=isRefAlloc, getFullBurstOnFailedBurstUpdate)) ++ Array(stash.io.matchingEntry.bits)
  stash.io.lookupTag.valid := refPipelineStage.valid & refPipelineStage.bits.isRequest
  stash.io.lookupTag.bits := refPipelineStage.bits.asRequest.addr(addrWidth - 1, addrWidth - cacheLineTagWidth)
  stash.io.deallocMatchingEntry := refPipelineStage.bits.asRequest.isDealloc
  stash.io.pipelineReady := pipelineReady
  stash.io.minAllowedQueueAddr := minAllowedQueueAddr
  stash.io.maxAllowedQueueAddr := maxAllowedQueueAddr
  /* selected* signals are aligned with refPipelineStage */
  val hashTableMatches = Vec(dataRead.map(x => x.valid & x.bits.tag === refPipelineStage.bits.getBurstTag))
  val pipelineStashMatches = Vec(pipelineMatches ++ Array(stash.io.matchingEntry.valid))
  val selectedHashTableEntry = Mux1H(hashTableMatches, dataReadWithBurstFlags)
  val selectedPipelineStashEntry = Mux1H(pipelineStashMatches, pipelineStashEntries)
  /* delayed* signals are aligned with lastPipelineStage */
  val delayedHashTableMatches = hashTableMatches.map(x => RegEnable(x, enable = pipelineReady))
  val delayedPipelineStashMatches = pipelineStashMatches.map(x => RegEnable(x, enable = pipelineReady))
  val delayedSelectedHashTableEntry = RegEnable(selectedHashTableEntry, enable = pipelineReady)
  val delayedSelectedPipelineStashEntry = RegEnable(selectedPipelineStashEntry, enable = pipelineReady)

  val delayedHashTableHit = Vec(delayedHashTableMatches).asUInt.orR
  val delayedPipelineStashHit = RegEnable(pipelineStashMatches.asUInt.orR, enable = pipelineReady)
  val delayedHit = delayedHashTableHit | delayedPipelineStashHit
  val delayedMatchingEntry = Mux1H(Array(delayedHashTableHit, delayedPipelineStashHit),
    Array(delayedSelectedHashTableEntry, delayedSelectedPipelineStashEntry))

  val delayedDataRead = RegEnable(Vec(dataRead), enable = pipelineReady)
  val delayedAllFull = Vec(delayedDataRead.map(_.valid)).asUInt.andR /* all = all hash tables */

  /********************************* outLdBuf *********************************/
  val burstUpdateRequired = delayedMatchingEntry.burstUpdateRequired
  val isFakeDealloc = delayedMatchingEntry.ignoreNextResponse
  /* True if the MSHR entry that we are about to update is still in the extMemQueue */
  val extMemQueueUpdateAllowed = delayedMatchingEntry.extMemQueueUpdateAllowed
  io.outLdBuf.bits.rowAddr := Mux(delayedHit, delayedMatchingEntry.ldBufPtr, io.frqIn.bits)
  io.outLdBuf.bits.entry.offset := getOffset(lastPipelineStage.bits.asRequest.addr)
  io.outLdBuf.bits.entry.burstOffset := getBurstOffset(lastPipelineStage.bits.asRequest.addr)
  io.outLdBuf.bits.entry.id := lastPipelineStage.bits.asRequest.id
  io.outLdBuf.bits.dataBufferAddr := lastPipelineStage.bits.asRequest.dataBufferAddr
  io.outLdBuf.bits.opType.allocateRow := isLastAlloc & !delayedHit
  io.outLdBuf.bits.opType.allocateEntry := isLastAlloc
  io.outLdBuf.bits.isFakeDealloc := isFakeDealloc
  io.outLdBuf.valid := isLastRequest & (lastPipelineStage.bits.asRequest.isDealloc | ~delayedHit | ~burstUpdateRequired | extMemQueueUpdateAllowed | getFullBurstOnFailedBurstUpdate.B)
  io.outLdBuf.bits.burstLen := lastPipelineStage.bits.asRequest.burstLen
  io.outLdBuf.bits.burstStart := lastPipelineStage.bits.asRequest.burstStart

  /* Queue and interface to external memory arbiter */
  val extMemQueue = Module(new UpdatableBRAMQueue(extMemQueueEntryType, storageDepth=numMSHRTotal, counterDepth=Some(extMemQueueDepth)))
  val updatedData = Wire(memType)
  // to prevent extMemQueue.io.deqPtr from incrementing by more than 1 between
  // generation of extMemQueueUpdateAllowed and its use in the next cycle
  // where pipelineReady is true
  HelperFunctions.gatedConnect(io.outMem, extMemQueue.io.deq, pipelineReady)
  // extMemQueue.io.deq <> io.outMem
  extMemQueue.io.allocEntry := io.frqIn.ready | (getFullBurstOnFailedBurstUpdate.B & burstUpdateRequired & ~extMemQueueUpdateAllowed & isLastAlloc & pipelineReady)
  extMemQueue.io.update.valid := extMemQueue.io.allocEntry | ((extMemQueueUpdateAllowed | getFullBurstOnFailedBurstUpdate.B) & pipelineReady & isLastAlloc & burstUpdateRequired)
  extMemQueue.io.update.bits.addr := Mux(extMemQueue.io.allocEntry, extMemQueue.io.enqPtr, delayedMatchingEntry.queueAddr)
  extMemQueue.io.update.bits.arbData connectAllExisting updatedData.bits
  extMemQueue.io.update.bits.arbData.tag := lastPipelineStage.bits.getBurstTag
  // uncomment if using the _noburst.txt sample data
  // Assert(clock, reset, ~extMemQueue.io.update.valid | (extMemQueue.io.update.bits.addr === extMemQueue.io.enqPtr), "extMemQueueUpdateExisting")

  /* Update logic for the data to be written to memory. If the entry was in the stash
   * or in the pipeline, it has been already updated in place speculatively and must only
   * be confirmed if extMemQueueUpdateAllowed. */
  updatedData.valid := lastPipelineStage.valid & (lastPipelineStage.bits.isEntry | lastPipelineStage.bits.asRequest.isAlloc | delayedMatchingEntry.ignoreNextResponse)
  updatedData.bits.tag := lastPipelineStage.bits.getBurstTag
  // isEntry -> it's an entry to be reinserted -> take its ldBufPtr/queueAddr/burstOffsets (from the pipeline)
  // isRequest & hit -> we are updating an existing entry -> take its ldBufPtr/queueAddr/burstOffsets from delayedMatchingEntry
  // isRequest & ~hit -> we are allocating a new entry -> get a new ldBufPtr from the FRQ/get next queueAddr/get request's burst offsets
  // same for queueAddr and burst offsets
  updatedData.bits.ldBufPtr := MuxCase(io.frqIn.bits, Array((lastPipelineStage.bits.isEntry -> lastPipelineStage.bits.asEntry.ldBufPtr), (delayedHit -> delayedMatchingEntry.ldBufPtr)))
  updatedData.bits.queueAddr := MuxCase(extMemQueue.io.enqPtr, Array((lastPipelineStage.bits.isEntry -> lastPipelineStage.bits.asEntry.queueAddr), (delayedHit -> delayedMatchingEntry.queueAddr)))
  updatedData.bits.minBurstOffset := MuxCase(getBurstOffset(lastPipelineStage.bits.asRequest.addr), Array((io.alwaysGetFullBurst -> 0.U), (lastPipelineStage.bits.isEntry -> lastPipelineStage.bits.asEntry.minBurstOffset), (delayedHit -> delayedMatchingEntry.minBurstOffset)))
  updatedData.bits.maxBurstOffset := MuxCase(getBurstOffset(lastPipelineStage.bits.asRequest.addr), Array((io.alwaysGetFullBurst -> ((1 << burstOffsetWidth)-1).U), (lastPipelineStage.bits.isEntry -> lastPipelineStage.bits.asEntry.maxBurstOffset), (delayedHit -> delayedMatchingEntry.maxBurstOffset)))
  updatedData.bits.ignoreNextResponse := MuxCase(false.B, Array((lastPipelineStage.bits.isEntry -> lastPipelineStage.bits.asEntry.ignoreNextResponse), (delayedHit -> (delayedMatchingEntry.ignoreNextResponse & ~isLastDealloc))))
  minAllowedQueueAddr := extMemQueue.io.deqPtr
  // the condition is essentially extMemQueue.io.allocEntry but without pipelineReady
  // which can be safely removed as nothing happens when pipelineReady is zero,
  // and including it would hurt timing as it is a late-arriving signal
  maxAllowedQueueAddr := Mux((isLastAlloc & !delayedHit) | (getFullBurstOnFailedBurstUpdate.B & burstUpdateRequired & ~extMemQueueUpdateAllowed & isLastAlloc), extMemQueue.io.enqPtrPlusOne, extMemQueue.io.enqPtr)

  // extMemQueueUpdateAllowed := Mux(extMemQueue.io.deqPtr >= lastInFlightExtMemReq,
  //   (delayedMatchingEntry.queueAddr >= extMemQueue.io.deqPtr) | (delayedMatchingEntry.queueAddr < lastInFlightExtMemReq),
  //   (delayedMatchingEntry.queueAddr >= extMemQueue.io.deqPtr) & (delayedMatchingEntry.queueAddr < lastInFlightExtMemReq))
  /* When a tag appears for the first time, we allocate an entry in one of the hash tables (HT).
   * To better spread the entries among HTs, we want all HTs to have the same priority; however, we can only choose
   * a hash table for which the entry corresponding to the new tag is free. We use a RRArbiter to implement this functionality, where we
   * do not care about the value to arbitrate and we use ~entry.valid as valid signal for the arbiter. */
  val fakeRRArbiterForSelect = Module(new ResettableRRArbiter(Bool(), numHashTables))
  for (i <- 0 until numHashTables) fakeRRArbiterForSelect.io.in(i).valid := ~delayedDataRead(i).valid
  val hashTableToUpdate = UIntToOH(fakeRRArbiterForSelect.io.chosen).toBools

  /* Eviction logic */
  /* If the entry has been kicked out from HT i, we will try put it in HT i+1 mod HT_count.
   * We use a round-robin policy also for the first eviction: the index of the last hash
   * table from which we evicted is stored in evictTableForFirstAttempt.
   * This round-robin policy is simpler and works better than using an LFSR16. */
  val evictCounterEnable = Wire(Bool())
  val (evictTableForFirstAttempt, _) = if(numHashTables > 1) Counter(evictCounterEnable, numHashTables) else (0.U(1.W), DontCare)
  /* To support non-power-of-two number of tables, we need to implement the wrapping logic manually. */
  val evictTableForEntryFromStash = if(numHashTables == 1) 0.U(1.W) else if (isPow2(numHashTables)) lastPipelineStage.bits.asEntry.lastTableIdx + 1.U else Mux(lastPipelineStage.bits.asEntry.lastTableIdx === (numHashTables - 1).U, 0.U, lastPipelineStage.bits.asEntry.lastTableIdx + 1.U)
  val evictTable = Mux(isLastFromStash, evictTableForEntryFromStash, evictTableForFirstAttempt)
  val evictOH = UIntToOH(evictTable) // if (numHashTables > 1) UIntToOH(evictTable) else true.B
  stash.io.enq.bits connectAllExisting Mux1H(evictOH, delayedDataRead.map(_.bits))
  stash.io.enq.bits.lastTableIdx := evictTable
  stash.io.enq.valid := (lastPipelineStage.valid & (lastPipelineStage.bits.isEntry | lastPipelineStage.bits.asRequest.isAlloc)) & !delayedHit & delayedAllFull & pipelineReady & ~deallocLastEntry
  evictCounterEnable := stash.io.enq.valid

  /* Memory write port */
  // We have to write to memory i in the following cases:
  // 1) isLastDealloc and delayedHashTableMatches(i) is true
  // 2) isLastFromStash and is not being deallocated, delayedAllFull is true and memory i has been selected for eviction (evictOH(i) is true)
  // 3) isLastFromStash and is not being deallocated, delayedAllFull is false and memory i was empty and selected as destination (hashTableToUpdate(i) is true)
  // 4) isLastAlloc, delayedHit is false, delayedAllFull is false and memory i was empty and selected as destination (hashTableToUpdate(i) is true)
  // 5) isLastAlloc, delayedHit is false, delayedAllFull is true and memory i was selected for eviction (evictOH(i) is true)
  // 6) isLastAlloc, delayedHashTableMatches(i) is true and extMemQueueUpdateAllowed is true
  memories.zipWithIndex.foreach({
    case (mem, i) => mem.write(
      wrData = updatedData,
      wrEn = Mux(isLastFromStash,
        Mux(delayedAllFull,
          evictOH(i), // 2
          hashTableToUpdate(i) // 3
          ) & ~deallocLastEntry,
        (isLastDealloc & delayedHashTableMatches(i)) // 1
          | (isLastAlloc &
            Mux(delayedHit,
              delayedHashTableMatches(i) & (extMemQueueUpdateAllowed | getFullBurstOnFailedBurstUpdate.B) & burstUpdateRequired, // 6
              Mux(delayedAllFull,
                evictOH(i), // 5
                hashTableToUpdate(i) // 4
                )))) & pipelineReady)
  })
  io.frqIn.ready := isLastAlloc & !delayedHit & pipelineReady & isLastRequest
  fakeRRArbiterForSelect.io.out.ready := io.frqIn.ready
  //
  val allocatedMSHRCounter = SimultaneousUpDownSaturatingCounter(numMSHRTotal,
    increment = io.frqIn.ready,
    decrement = isLastDealloc & pipelineReady & ~isFakeDealloc)
  /* The number of allocations + kicked out entries in flight must be limited to the number of slots in the stash since, in the worst case,
   * all of them will give rise to a kick out and must be stored in the stash if the pipeline gets filled with deallocations.
   * One allocation ceases to be in flight if:
   * - it can be put in the hash table without kicking out another entry (delayedHit | ~delayedAllFull)
   * - an entry from the stash can be put in an hash table without more kickouts (isLastFromStash & ~delayedAllFull)
   * - an allocation or a kicked out entry in flight is deallocated
   * Note that now we can have two entries disappearing in the same cycle:
   * 1a) one allocation that hits in the last stage (and does not require a new entry), or
   * 1b) one entry that can be successfully reinserted, and
   * 2) one deallocation that hits on the pipeline or in the stash in the ref stage,
   *    unless the hit was on the last pipeline stage
   * For simplicity, we account for 2) in the following cycle; this is not a problem
   * as it will lead to a (pessimistic) overestimation the number of allocations/entries in the pipeline.
  */
  /* TODO: Consider using actualAllocsInFlight instead of this counter that has
     complicated increase/decrease conditions that depend on late-arriving signals */
  val allocsInFlight = SimultaneousUpDownSaturatingCounter(assocMemorySize + 1,
    increment = io.allocIn.fire() | reqStash.map(_.io.deq.fire()).getOrElse(false.B),
    decrement = pipelineReady & (
      (isLastAlloc & (delayedHit | ~delayedAllFull)) | // 1a) an allocation does not require a new entry (hit) or can be immediately inserted
      (isLastFromStash & ~stash.io.enq.valid) | // 1b) an entry can be processed without reinserting another one in the stash, either because there is no collision or because it is being deallocated
      (isLastDealloc & Vec(delayedPipelineStashMatches).asUInt.orR & ~RegEnable(deallocLastEntry, enable = pipelineReady) & ~isFakeDealloc)) // 2) an entry from the pipeline or the stash gets deallocated, unless it was the last entry in the previous cycle and we already took it into account in the isLastFromStash case
      )
  // Stash and pipeline can temporarily store some more entries on top of the
  // hash tables; however, the extMemQueue can only store up to one request per
  // entry in the hash tables. No matter how unlikely it is to have more than
  // numMSHRTotal entries AND have an extMemQueue full, we have to avoid this
  // by blocking allocations as soon as we may reach numMSHRTotal entries
  // if all allocations currently in the pipeline require a new entry.
  stallOnlyAllocs := (allocsInFlight >= assocMemorySize.U) | (allocatedMSHRCounter >= (numMSHRTotal - MSHR.pipelineLatency).U)

  if(!getFullBurstOnFailedBurstUpdate) {
    reqStash.get.io.enq.valid := isLastAlloc & delayedHit & burstUpdateRequired & ~extMemQueueUpdateAllowed & pipelineReady
    reqStash.get.io.enq.bits := lastPipelineStage.bits.asRequest.asAlloc
    reqStash.get.io.deallocIn.valid := isLastDealloc
    reqStash.get.io.deallocIn.bits := lastPipelineStage.bits.getBurstTag
  }

  stopAllocs := io.stopAllocFromLdBuf | stallOnlyAllocs
  stopDeallocs := false.B

  pipelineReady := io.outLdBuf.ready | ~io.outLdBuf.valid | isLastFromStash


  /* Profiling interface */
  if(Profiling.enable) {
    /* The order by which registers are appended to profilingRegisters defines the register map */
    val profilingRegisters = scala.collection.mutable.ListBuffer[UInt]()
    val currentlyUsedMSHR = RegEnable(allocatedMSHRCounter, enable=io.axiProfiling.snapshot)
/*0*/ profilingRegisters += currentlyUsedMSHR
    val maxUsedMSHR = ProfilingMax(allocatedMSHRCounter, io.axiProfiling)
/*1*/ profilingRegisters += maxUsedMSHR
    val collisionCount = ProfilingCounter(isLastAlloc & !delayedHit & delayedAllFull & pipelineReady & ~isLastFromStash, io.axiProfiling)
/*2*/ profilingRegisters += collisionCount
    val cyclesSpentResolvingCollisions = ProfilingCounter(isLastFromStash & lastPipelineStage.valid & pipelineReady, io.axiProfiling)
/*3*/ profilingRegisters += cyclesSpentResolvingCollisions
    val stallTriggerCount = ProfilingCounter(stallOnlyAllocs & ~RegNext(stallOnlyAllocs), io.axiProfiling)
/*4*/ profilingRegisters += stallTriggerCount
    val cyclesSpentStalling = ProfilingCounter(stallOnlyAllocs & io.allocIn.valid, io.axiProfiling)
/*5*/ profilingRegisters += cyclesSpentStalling
    val acceptedAllocsCount = ProfilingCounter(io.outLdBuf.bits.opType.allocateEntry & io.outLdBuf.valid & io.outLdBuf.ready, io.axiProfiling)
/*6*/ profilingRegisters += acceptedAllocsCount
    val acceptedDeallocsCount = ProfilingCounter(~io.outLdBuf.bits.opType.allocateEntry & io.outLdBuf.valid & io.outLdBuf.ready, io.axiProfiling)
/*7*/ profilingRegisters += acceptedDeallocsCount
    val cyclesAllocsStalled = ProfilingCounter(io.allocIn.valid & ~io.allocIn.ready, io.axiProfiling)
/*8*/ profilingRegisters += cyclesAllocsStalled
    val cyclesDeallocsStalled = ProfilingCounter(io.deallocIn.valid & ~io.deallocIn.ready, io.axiProfiling)
/*9*/ profilingRegisters += cyclesDeallocsStalled
    val enqueuedMemReqsCount = ProfilingCounter(extMemQueue.io.update.valid & extMemQueue.io.allocEntry, io.axiProfiling)
/*10*/ profilingRegisters += enqueuedMemReqsCount
    // val dequeuedMemReqsCount = ProfilingCounter(externalMemoryQueue.io.deq.valid, io.axiProfiling)
    // profilingRegisters += dequeuedMemReqsCount
    val cyclesOutLdBufNotReady = ProfilingCounter(io.outLdBuf.valid & ~io.outLdBuf.ready, io.axiProfiling)
/*11*/ profilingRegisters += cyclesOutLdBufNotReady
    // Can be used to estimate average MSHR occupation by dividing by runtime in cycles
    // We use a hack to prevent sign extension when converting allocatedMSHRCounter to signed int, since asSInt does not accept a width as a parameter
    val (accumUsedMSHR, _) = ProfilingArbitraryIncrementCounter(Array((true.B -> (allocatedMSHRCounter + 0.U((allocatedMSHRCounter.getWidth+1).W)).asSInt)), io.axiProfiling)
/*12*/ profilingRegisters += accumUsedMSHR
    val cyclesStallAllocFromLdBuf = ProfilingCounter(io.allocIn.valid & io.stopAllocFromLdBuf, io.axiProfiling)
/*13*/ profilingRegisters += cyclesStallAllocFromLdBuf
    val successfulBurstUpdatesCount = ProfilingCounter(isLastAlloc & delayedHit & burstUpdateRequired & (extMemQueueUpdateAllowed | getFullBurstOnFailedBurstUpdate.B) & pipelineReady, io.axiProfiling)
/*14*/ profilingRegisters += successfulBurstUpdatesCount
    if(!getFullBurstOnFailedBurstUpdate) {
      val rejectedBurstUpdatesCount = ProfilingCounter(reqStash.get.io.enq.fire(), io.axiProfiling)
      /*15*/ profilingRegisters += rejectedBurstUpdatesCount
      val cyclesStallAllocFromReqStash = ProfilingCounter(reqStash.get.io.deq.valid & io.allocIn.valid & ~io.deallocIn.valid & pipelineReady, io.axiProfiling)
      /*16*/ profilingRegisters += cyclesStallAllocFromReqStash
      val cyclesStallAllocFromReqStashFull = ProfilingCounter(reqStash.get.io.almostFull & io.allocIn.valid & ~io.deallocIn.valid & pipelineReady, io.axiProfiling)
      /*17*/ profilingRegisters += cyclesStallAllocFromReqStashFull
    }
    val (accumBurstLen, _) = ProfilingArbitraryIncrementCounter(Array((io.outMem.fire() -> (io.outMem.bits.maxBurstOffset - io.outMem.bits.minBurstOffset + 0.U((burstOffsetWidth+1).W)).asSInt)), io.axiProfiling)
/*15*/ profilingRegisters += accumBurstLen
    val fakeDeallocs = ProfilingCounter(io.outLdBuf.fire() & ~io.outLdBuf.bits.opType.allocateEntry & io.outLdBuf.bits.isFakeDealloc, io.axiProfiling)
/*16*/ profilingRegisters += fakeDeallocs
    val expectedFakeDeallocs = ProfilingCounter(delayedHit & isLastAlloc & burstUpdateRequired & ~extMemQueueUpdateAllowed & pipelineReady, io.axiProfiling)
/*17*/ profilingRegisters += expectedFakeDeallocs
    if(Profiling.enableHistograms) {
      val currentlyUsedMSHRHistogram = (0 until log2Ceil(numMSHRTotal)).map(i => ProfilingCounter(allocatedMSHRCounter >= (1 << i).U, io.axiProfiling))
      profilingRegisters ++= currentlyUsedMSHRHistogram
    }
    require(Profiling.regAddrWidth >= log2Ceil(profilingRegisters.length))
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

  // ---------------------- DEBUG ---------------------------
  // FileLogger("mshrInAlloc.txt", clock, io.allocIn.fire(), io.allocIn.bits.addr, io.allocIn.bits.id)
  // FileLogger("mshrInDealloc.txt", clock, io.deallocIn.fire(), io.deallocIn.bits.addr, io.deallocIn.bits.dataBufferAddr)
  // FileLogger("mshrExtMem.txt", clock, io.outMem.fire(), io.outMem.bits.tag)
  // FileLogger("mshrToLdBufAlloc.txt", clock, io.outLdBuf.fire() & io.outLdBuf.bits.opType.allocateEntry, io.outLdBuf.bits.entry.id, io.outLdBuf.bits.rowAddr)
  // FileLogger("mshrToLdBufDealloc.txt", clock, io.outLdBuf.fire() & ~io.outLdBuf.bits.opType.allocateEntry, io.outLdBuf.bits.dataBufferAddr, io.outLdBuf.bits.rowAddr)
  val pipeline0IsEntry = memoryPipeline(0).bits.isEntry
  dontTouch(pipeline0IsEntry)
  val pipeline0AsRequest = memoryPipeline(0).bits.asRequest
  dontTouch(pipeline0AsRequest)
  val pipeline0AsEntry = memoryPipeline(0).bits.asEntry
  dontTouch(pipeline0AsEntry)

  val pipeline1IsEntry = memoryPipeline(1).bits.isEntry
  dontTouch(pipeline1IsEntry)
  val pipeline1AsRequest = memoryPipeline(1).bits.asRequest
  dontTouch(pipeline1AsRequest)
  val pipeline1AsEntry = memoryPipeline(1).bits.asEntry
  dontTouch(pipeline1AsEntry)

  val pipeline2IsEntry = memoryPipeline(2).bits.isEntry
  dontTouch(pipeline2IsEntry)
  val pipeline2AsRequest = memoryPipeline(2).bits.asRequest
  dontTouch(pipeline2AsRequest)
  val pipeline2AsEntry = memoryPipeline(2).bits.asEntry
  dontTouch(pipeline2AsEntry)

  val refPipelineStageIsEntry = refPipelineStage.bits.isEntry
  dontTouch(refPipelineStageIsEntry)
  val refPipelineStageAsRequest = refPipelineStage.bits.asRequest
  dontTouch(refPipelineStageAsRequest)
  val refPipelineStageAsEntry = refPipelineStage.bits.asEntry
  dontTouch(refPipelineStageAsEntry)

  val lastPipelineStageIsEntry = lastPipelineStage.bits.isEntry
  dontTouch(lastPipelineStageIsEntry)
  val lastPipelineStageAsRequest = lastPipelineStage.bits.asRequest
  dontTouch(lastPipelineStageAsRequest)
  val lastPipelineStageAsEntry = lastPipelineStage.bits.asEntry
  dontTouch(lastPipelineStageAsEntry)

  Assert(clock, reset, ~(isLastFromStash & delayedHit), "entry cannot hit")
  // one memory had both rdData.valid high in the previous cycle and wrEn enabled, and nothing is going to the stash, and we are not updating an existing entry
  val DEBUG_htBeingOverwritten = dataRead.map(x => RegEnable(x.valid, enable = pipelineReady, init=false.B)).zip(memories.map(_.io.wrEn)).map(x => x._1 & x._2)
  Assert(clock, reset, ~(Vec(DEBUG_htBeingOverwritten).asUInt.orR & ~stash.io.enq.valid & (isLastAlloc | isLastFromStash) &
    ((Mux1H(DEBUG_htBeingOverwritten, dataRead.map(x => RegEnable(x.bits.tag, enable = pipelineReady))) =/= updatedData.bits.tag) |
      (Mux1H(DEBUG_htBeingOverwritten, dataRead.map(x => RegEnable(x.bits.ldBufPtr, enable = pipelineReady))) =/= updatedData.bits.ldBufPtr) |
      (Mux1H(DEBUG_htBeingOverwritten, dataRead.map(x => RegEnable(x.bits.queueAddr, enable = pipelineReady))) =/= updatedData.bits.queueAddr))), "entry being overwritten in HT without going to stash")
  // either there is only one write among hash tables, stash and request stash,
  // or we are writing to exactly one memory and to the stash, and writing
  // different things to each of them
  Assert(clock, reset, (PopCount(memories.map(_.io.wrEn) ++ Array(stash.io.enq.valid, reqStash.map(_.io.enq.valid).getOrElse(false.B))) <= 1.U) | ((PopCount(memories.map(_.io.wrEn)) === 1.U) & stash.io.enq.valid & (updatedData.bits.tag =/= stash.io.enq.bits.tag) & (updatedData.bits.ldBufPtr =/= stash.io.enq.bits.ldBufPtr) & (updatedData.bits.queueAddr =/= stash.io.enq.bits.queueAddr)), "entry being duplicated")
  Assert(clock, reset, ~(stash.io.enq.valid & PopCount(memories.map(_.io.wrEn)) === 0.U), "cannot write to stash without updating an hash table")

  val actualAllocsInFlight = PopCount(memoryPipeline.map(x => x.valid & (x.bits.isEntry | x.bits.asRequest.isAlloc))) + stash.io.DEBUG_entryCount
  val additionalDeallocNotCounted = isLastDealloc & delayedPipelineStashHit & ~isFakeDealloc & ~RegEnable(deallocLastEntry, enable = pipelineReady, init=false.B)
  Assert(clock, reset, allocsInFlight === (actualAllocsInFlight + Mux(additionalDeallocNotCounted, 1.U, 0.U)), "allocsInFlight must count correctly")

  Assert(clock, reset, ~lastPipelineStage.valid | Mux(isLastRequest, reqStash.map(_.io.enq.valid).getOrElse(false.B) | io.outLdBuf.valid | (delayedHit & delayedMatchingEntry.ignoreNextResponse & isLastDealloc), stash.io.enq.valid | Vec(memories.map(_.io.wrEn)).asUInt.orR | deallocLastEntry), "a valid lastPipelineStage must trigger the respective state and output update")
  Assert(clock, reset, ~lastPipelineStage.valid | lastPipelineStage.bits.isEntry | lastPipelineStage.bits.asRequest.isAlloc | delayedHit, "a deallocation must always hit")
  Assert(clock, reset, ~delayedHashTableHit | ~delayedPipelineStashHit | (delayedSelectedHashTableEntry === delayedSelectedPipelineStashEntry), "cannot hit in both hash table and pipeline")
  Assert(clock, reset, ~isLastDealloc | (lastPipelineStage.bits.asRequest.burstStart === delayedMatchingEntry.minBurstOffset) &
    (lastPipelineStage.bits.asRequest.burstStart + lastPipelineStage.bits.asRequest.burstLen === delayedMatchingEntry.maxBurstOffset) | delayedMatchingEntry.ignoreNextResponse,
    "dealloc burst parameters must match MSHR burst parameters")
  Assert(clock, reset, deallocLastEntry === deallocPipelineEntries.last, "deallocLastEntry must coincide with deallocPipelineEntries.last")
  val (receivedFakeDeallocs, _) = Counter(io.outLdBuf.fire() & ~io.outLdBuf.bits.opType.allocateEntry & io.outLdBuf.bits.isFakeDealloc, 1 << 30)
  val (expectedFakeDeallocs, _) = Counter(delayedHit & isLastAlloc & burstUpdateRequired & ~extMemQueueUpdateAllowed & pipelineReady, 1 << 30)
  FileLogger("receivedFakeDeallocs.txt", clock, io.outLdBuf.fire() & ~io.outLdBuf.bits.opType.allocateEntry & io.outLdBuf.bits.isFakeDealloc, io.outLdBuf.bits.rowAddr, delayedMatchingEntry.queueAddr)
  FileLogger("expectedFakeDeallocs.txt", clock, delayedHit & isLastAlloc & burstUpdateRequired & ~extMemQueueUpdateAllowed & pipelineReady, delayedMatchingEntry.ldBufPtr, delayedMatchingEntry.queueAddr)
  Assert(clock, reset, expectedFakeDeallocs >= receivedFakeDeallocs, "expectedFakeDeallocs must always be >= receivedFakeDeallocs")
  Assert(clock, reset, ~((allocatedMSHRCounter === 0.U) & isLastDealloc & pipelineReady & ~isFakeDealloc), "MSHR counter should not go below zero")
  Assert(clock, reset, ~((allocatedMSHRCounter === numMSHRTotal.U) & io.frqIn.ready), "MSHR counter should not go above numMSHRTotal")
  // -------------------- END DEBUG ------------------------

}

class MSHRStashVariableLength(burstTagWidth: Int, cacheLineTagWidth: Int, ldBufRowAddrWidth: Int, burstLenWidth: Int, queueAddrWidth: Int, numEntries: Int, lastTableIdxWidth: Int, getFullBurstOnFailedBurstUpdate: Boolean) extends Module {
  val entryType = new MSHREntryVariableLengthLastTable(burstTagWidth, ldBufRowAddrWidth, burstLenWidth, queueAddrWidth, lastTableIdxWidth)
  val matchingEntryType = new MSHREntryVariableLengthWithBurstUpdateFlags(burstTagWidth, ldBufRowAddrWidth, burstLenWidth, queueAddrWidth)
  val io = IO(new Bundle {
    val enq = DecoupledIO(entryType).flip
    val deq = DecoupledIO(entryType)
    val pipelineReady = Input(Bool()) // predicates all internal updates
    // used for both entry update and deallocation depending on deallocMatchingEntry
    val lookupTag = Flipped(ValidIO(UInt(cacheLineTagWidth.W)))
    val deallocMatchingEntry = Input(Bool())
    // entry corresponding to lookupTag, if existing
    val matchingEntry = ValidIO(matchingEntryType)
    // commits any speculative burst parameter created in the previous cycle
    val minAllowedQueueAddr = Input(UInt(queueAddrWidth.W))
    val maxAllowedQueueAddr = Input(UInt(queueAddrWidth.W))
    val DEBUG_entryCount = Output(UInt(log2Ceil(numEntries).W))
  })

  def getBurstTag(cacheLineAddr: UInt): UInt = cacheLineAddr(cacheLineTagWidth - 1, cacheLineTagWidth - burstTagWidth)
  def getBurstOffset(cacheLineAddr: UInt): UInt = cacheLineAddr(cacheLineTagWidth - burstTagWidth - 1, 0)

  val invalidMemoryEntry = Wire(ValidIO(entryType))
  invalidMemoryEntry.valid := false.B
  invalidMemoryEntry.bits := DontCare
  val memory = RegInit(Vec(Seq.fill(numEntries)(invalidMemoryEntry)))
  val emptyEntrySelect = PriorityEncoderOH(memory.map(x => ~x.valid))
  val full = Vec(memory.map(x => x.valid)).asUInt.andR
  val almostFull = PopCount(memory.map(x => x.valid)) >= 1.U // number of pipeline stages - 1 ?
  io.enq.ready := ~almostFull & ~full
  val outputArbiter = Module(new ResettableRRArbiter(entryType, numEntries))
  val matchWithIncomingValue = (io.enq.bits.tag === getBurstTag(io.lookupTag.bits)) & io.lookupTag.valid & io.enq.valid
  val matches = memory.map(x => (x.bits.tag === getBurstTag(io.lookupTag.bits)) & io.lookupTag.valid & x.valid) ++ Array(matchWithIncomingValue)
  val memoryWithBurstFlags = memory.map(_.bits.dropLastTable().getEntryWithBurstFlags(getBurstOffset(io.lookupTag.bits), io.minAllowedQueueAddr, io.maxAllowedQueueAddr, ~io.deallocMatchingEntry, getFullBurstOnFailedBurstUpdate))
  val incomingValueWithBurstFlags = io.enq.bits.getEntryWithBurstFlags(getBurstOffset(io.lookupTag.bits), io.minAllowedQueueAddr, io.maxAllowedQueueAddr, ~io.deallocMatchingEntry, getFullBurstOnFailedBurstUpdate)
  // For handling of committed/speculative burst parameters: see comments in CuckooMSHRVariableLength
  for (i <- 0 until numEntries) {
    // insertion
    // if an entry is being consumed, the new entry will take its place;
    // if not, it will be allocated in an empty slot.
    when(io.enq.valid & io.pipelineReady & ~(matchWithIncomingValue & io.deallocMatchingEntry & ~io.enq.bits.ignoreNextResponse) & Mux(io.deq.fire, outputArbiter.io.in(i).fire, emptyEntrySelect(i))) {
      memory(i).valid := true.B
      memory(i).bits := io.enq.bits
      //when(matchWithIncomingValue & incomingValueWithBurstFlags.performBurstUpdate) { // store speculative burst parameters if the entry being enqueued matches with the lookupTag
      when(matchWithIncomingValue) { // store speculative burst parameters if the entry being enqueued matches with the lookupTag
        memory(i).bits.ignoreNextResponse := incomingValueWithBurstFlags.ignoreNextResponse & ~io.deallocMatchingEntry
        memory(i).bits.minBurstOffset := incomingValueWithBurstFlags.minBurstOffset
        memory(i).bits.maxBurstOffset := incomingValueWithBurstFlags.maxBurstOffset
        // when(io.deallocMatchingEntry & io.enq.bits.ignoreNextResponse) {
        //   memory(i).bits.ignoreNextResponse := false.B
        // }
      }
    }.elsewhen(io.pipelineReady & (outputArbiter.io.in(i).fire() | (matches(i) & io.deallocMatchingEntry & ~memory(i).bits.ignoreNextResponse))) { // value consumed or deallocated
      memory(i).valid := false.B
    }.elsewhen(io.pipelineReady & matches(i)) {
      memory(i).bits.minBurstOffset := memoryWithBurstFlags(i).minBurstOffset
      memory(i).bits.maxBurstOffset := memoryWithBurstFlags(i).maxBurstOffset
      memory(i).bits.ignoreNextResponse := memoryWithBurstFlags(i).ignoreNextResponse & ~io.deallocMatchingEntry
    }
    // }.elsewhen(io.pipelineReady & matches(i) & io.deallocMatchingEntry & memory(i).bits.ignoreNextResponse) {
    //   memory(i).bits.ignoreNextResponse := false.B
    // }
    outputArbiter.io.in(i).valid := memory(i).valid & ~matches(i) // for simplicity we don't release matching entries, so we never have to propagate burstUpdateRequired and extMemQueueUpdateAllowed
    outputArbiter.io.in(i).bits := memory(i).bits
  }
  outputArbiter.io.out <> io.deq
  io.matchingEntry.bits := Mux1H(matches, memoryWithBurstFlags ++ Array(incomingValueWithBurstFlags))
  io.matchingEntry.valid := Vec(matches).asUInt.orR
  Assert(clock, reset, ~(io.enq.valid & full & ~io.deq.ready), "cannot enqueue new entry when stash is full")
  io.DEBUG_entryCount := PopCount(memory.map(_.valid))
}

class RequestStash(addrWidth: Int, burstTagWidth: Int, idWidth: Int, numEntries: Int, almostFullMargin: Int) extends Module {
  require(addrWidth > burstTagWidth)

  val io = IO(new Bundle {
    val enq = Flipped(DecoupledIO(new AddrIdIO(addrWidth, idWidth)))
    val deq = DecoupledIO(new AddrIdIO(addrWidth, idWidth))
    val deallocIn = Flipped(ValidIO(UInt(burstTagWidth.W))) // used to flag entries for release (ready bit)
    val almostFull = Output(Bool())
  })

  class RequestStashEntry(addrWidth: Int, val burstTagWidth: Int, idWidth: Int) extends AddrIdIO(addrWidth, idWidth) with HasValid {
    val ready = Bool() // entry can be released (its MSHR, which could not be updated, has been deallocated)

    def getInvalidEntry(): RequestStashEntry = {
      val w = Wire(this)
      w.invalidate()
      w.ready := DontCare
      w.addr := DontCare
      w.id := DontCare
      w
    }

    def storeRequest(in: AddrIdIO): Unit = {
      this.connectAllExisting(in)
      this.setValid()
      this.ready := false.B
    }

    def getBurstTag(): UInt = {
      this.addr(addrWidth - 1, addrWidth - burstTagWidth)
    }

    def tagLookup(tag: UInt): Unit = {
      when(this.getBurstTag === tag) { this.ready := true.B }
    }

    def getRequest(): AddrIdIO = {
      val w = Wire(new AddrIdIO(addrWidth, idWidth))
      w.connectAllExisting(this)
      w
    }

    override def cloneType = (new RequestStashEntry(addrWidth, burstTagWidth, idWidth)).asInstanceOf[this.type]
  }

  val entryType = new RequestStashEntry(addrWidth, burstTagWidth, idWidth)
  val requestType = io.enq.bits.cloneType

  val entries = RegInit(Vec(Seq.fill(numEntries)(entryType.getInvalidEntry)))
  val full = Vec(entries.map(_.valid)).asUInt.andR
  val entriesCount = SimultaneousUpDownWrappingCounter(
    maxVal = numEntries,
    increment = io.enq.fire,
    decrement = io.deq.fire)
  val emptyEntrySelect = PriorityEncoderOH(entries.map(~_.valid))
  /* Dequeue */
  val outputArbiter = Module(new ResettableRRArbiter(requestType, numEntries))
  outputArbiter.io.in.zip(entries).foreach({
    case (in, entry) => {
      in.valid := entry.valid & entry.ready
      in.bits := entry.getRequest
      when(in.fire()) { entry.invalidate() }
    }
  })
  ElasticBuffer(outputArbiter.io.out) <> io.deq
  /* Enqueue */
  entries.zipWithIndex.foreach({
    case (entry, i) => {
      when(io.enq.valid & emptyEntrySelect(i)) { entry.storeRequest(io.enq.bits) }
      when(io.deallocIn.valid) { entry.tagLookup(io.deallocIn.bits) }
    }
  })
  io.enq.ready := ~full
  io.almostFull := entriesCount >= (numEntries - almostFullMargin).U
}

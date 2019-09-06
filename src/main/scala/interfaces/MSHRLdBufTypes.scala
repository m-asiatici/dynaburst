package fpgamshr.interfaces

import chisel3._
import chisel3.util.{log2Ceil}

trait HasRowAddr extends ModularBundle {
  val rowAddrWidth: Int
  val rowAddr = UInt(rowAddrWidth.W)
}

trait HasLdBufEntries extends ModularBundle {
  val entriesPerRow: Int
  val offsetWidth: Int
  val idWidth: Int
  val entries = Vec(entriesPerRow, new LdBufEntry(offsetWidth, idWidth))
}

trait HasLdBufEntriesVariableLength extends ModularBundle {
  val entriesPerRow: Int
  val offsetWidth: Int
  val burstOffsetWidth: Int
  val idWidth: Int
  val entries = Vec(entriesPerRow, new LdBufEntryVariableLength(offsetWidth, burstOffsetWidth, idWidth))
}

trait HasLastValidIdx extends ModularBundle {
  val lastValidIdxWidth: Int
  val lastValidIdx = UInt(lastValidIdxWidth.W)
}

trait HasBurstOffset extends ModularBundle {
  val burstOffsetWidth: Int
  val minBurstOffset = UInt(burstOffsetWidth.W)
  val maxBurstOffset = UInt(burstOffsetWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasBurstOffset => {
      this.maxBurstOffset := same.maxBurstOffset
      this.minBurstOffset := same.minBurstOffset
    }
    case _ => if(ignoreNotMatching) {
      this.maxBurstOffset := DontCare
      this.minBurstOffset := DontCare
    }
  })
}

trait HasBurstUpdateFlags extends HasBurstOffset {
  val extMemQueueUpdateAllowed = Bool()
  val burstUpdateRequired = Bool()
  def performBurstUpdate(): Bool = {this.extMemQueueUpdateAllowed & this.burstUpdateRequired}
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasBurstUpdateFlags => {
      this.extMemQueueUpdateAllowed := same.extMemQueueUpdateAllowed
      this.burstUpdateRequired := same.burstUpdateRequired
    }
    case _ => if(ignoreNotMatching) {
      this.extMemQueueUpdateAllowed := DontCare
      this.burstUpdateRequired := DontCare
    }
  })
}

trait HasMaybeBurstOffset extends HasBurstUpdateFlags {
  val maybeMinBurstOffset = UInt(burstOffsetWidth.W)
  val maybeMaxBurstOffset = UInt(burstOffsetWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasMaybeBurstOffset => {
      this.maybeMaxBurstOffset := same.maybeMaxBurstOffset
      this.maybeMinBurstOffset := same.maybeMinBurstOffset
    }
    case _ => if(ignoreNotMatching) {
      this.maybeMaxBurstOffset := DontCare
      this.maybeMinBurstOffset := DontCare
    }
  })
}

trait HasVariableLength extends HasBurstOffset {
  val queueAddrWidth: Int
  val queueAddr = UInt(queueAddrWidth.W)
  val ignoreNextResponse = Bool()
  // val deallocOnIgnored = Bool()
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasVariableLength => {
      this.queueAddr := same.queueAddr
      this.ignoreNextResponse := same.ignoreNextResponse
      // this.deallocOnIgnored := same.deallocOnIgnored
    }
    case _ => if(ignoreNotMatching) {
      this.queueAddr := DontCare
      this.ignoreNextResponse := DontCare
      // this.deallocOnIgnored := DontCare
    }
  })
}

trait HasLastTableIdx extends ModularBundle {
  val lastTableIdxWidth: Int
  val lastTableIdx = UInt(lastTableIdxWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) =>that match {
    case same: HasLastTableIdx => this.lastTableIdx := same.lastTableIdx
    case _ => if(ignoreNotMatching) this.lastTableIdx := DontCare
  })
}

trait HasLdBufPtr extends ModularBundle {
  val ldBufPtrWidth: Int
  val ldBufPtr = UInt(ldBufPtrWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) =>that match {
    case same: HasLdBufPtr => this.ldBufPtr := same.ldBufPtr
    case _ => if(ignoreNotMatching) this.ldBufPtr := DontCare
  })
}

class MSHREntry(val tagWidth: Int, val ldBufPtrWidth: Int) extends ModularBundle with HasTag with HasLdBufPtr {
    override def cloneType = (new MSHREntry(tagWidth, ldBufPtrWidth)).asInstanceOf[this.type]
}

class MSHREntryValid(tagWidth: Int, ldBufPtrWidth: Int)
extends MSHREntry(tagWidth, ldBufPtrWidth) with HasValid {
  override def cloneType = (new MSHREntryValid(tagWidth, ldBufPtrWidth)).asInstanceOf[this.type]
}

class MSHREntryVariableLength(tagWidth: Int, ldBufPtrWidth: Int, val burstOffsetWidth: Int, val queueAddrWidth: Int)
  extends MSHREntry(tagWidth, ldBufPtrWidth) with HasVariableLength {
    // println(s"tagWidth=$tagWidth, ldBufPtrWidth=$ldBufPtrWidth, burstOffsetWidth=$burstOffsetWidth, queueAddrWidth=$queueAddrWidth")
    def ===(that: MSHREntryVariableLength): Bool = {this.asUInt === that.asUInt}
    def getEntryWithBurstFlags(burstOffsetNewReq: UInt, minAllowedQueueAddr: UInt, maxAllowedQueueAddr: UInt, useActualBurstOffsets: Bool, getFullBurstOnFailedBurstUpdate: Boolean): MSHREntryVariableLengthWithBurstUpdateFlags = {
      val entry = Wire(new MSHREntryVariableLengthWithBurstUpdateFlags(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth))
      entry connectAllExisting this
      val (burstUpdateRequired, extMemQueueUpdateAllowed) = this.computeBurstFlags(burstOffsetNewReq, minAllowedQueueAddr, maxAllowedQueueAddr)
      entry.burstUpdateRequired := burstUpdateRequired
      entry.extMemQueueUpdateAllowed := extMemQueueUpdateAllowed
      when(useActualBurstOffsets) {
        when(entry.performBurstUpdate) {
          entry.minBurstOffset := this.minBurstOffset min burstOffsetNewReq
          entry.maxBurstOffset := this.maxBurstOffset max burstOffsetNewReq
        } .elsewhen(getFullBurstOnFailedBurstUpdate.B & burstUpdateRequired & ~extMemQueueUpdateAllowed) {
          entry.minBurstOffset := 0.U
          entry.maxBurstOffset := ((1 << burstOffsetWidth)-1).U
          entry.ignoreNextResponse := true.B
        }
      }
      // when(entry.ignoreNextResponse & isFullBurstDealloc) {
      //   entry.deallocOnIgnored := true.B
      // }
      // when(useActualBurstOffsets & entry.performBurstUpdate) {
      //   entry.minBurstOffset := this.minBurstOffset min burstOffsetNewReq
      //   entry.maxBurstOffset := this.maxBurstOffset max burstOffsetNewReq
      // }
      entry
    }
    def computeBurstFlags(burstOffsetNewReq: UInt, minAllowedQueueAddr: UInt, maxAllowedQueueAddr: UInt): (Bool, Bool) = {
      val burstUpdateRequired = (this.minBurstOffset > burstOffsetNewReq) |
        (this.maxBurstOffset < burstOffsetNewReq)
      val extMemQueueUpdateAllowed = Mux(minAllowedQueueAddr > maxAllowedQueueAddr,
        (this.queueAddr >= minAllowedQueueAddr) | (this.queueAddr < maxAllowedQueueAddr),
        (this.queueAddr >= minAllowedQueueAddr) & (this.queueAddr < maxAllowedQueueAddr))
      (burstUpdateRequired, extMemQueueUpdateAllowed)
    }
    override def cloneType = (new MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth)).asInstanceOf[this.type]
}

class MSHREntryValidVariableLength(tagWidth: Int, ldBufPtrWidth: Int, burstOffsetWidth: Int, queueAddrWidth: Int)
  extends MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth) with HasValid {
    def dropValid(): MSHREntryVariableLength = {
      val entry = Wire(new MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth))
      entry.connectAllExisting(this)
      entry
    }
    override def cloneType = (new MSHREntryValidVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth)).asInstanceOf[this.type]
}

class MSHREntryLastTable(tagWidth: Int, ldBufPtrWidth: Int, val lastTableIdxWidth: Int)
  extends MSHREntry(tagWidth, ldBufPtrWidth) with HasLastTableIdx {
    override def cloneType = (new MSHREntryLastTable(tagWidth, ldBufPtrWidth, lastTableIdxWidth)).asInstanceOf[this.type]
}

class MSHREntryVariableLengthWithBurstUpdateFlags(tagWidth: Int, ldBufPtrWidth: Int, burstOffsetWidth: Int, queueAddrWidth: Int)
  extends MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth) with HasBurstUpdateFlags {
    def useActualBurstOffsets(burstOffsetNewReq: UInt): MSHREntryVariableLengthWithBurstUpdateFlags = {
      val entry = Wire(new MSHREntryVariableLengthWithBurstUpdateFlags(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth))
      entry connectAllExisting this
      when(this.burstUpdateRequired & this.extMemQueueUpdateAllowed) {
        entry.minBurstOffset := burstOffsetNewReq min this.minBurstOffset
        entry.maxBurstOffset := burstOffsetNewReq max this.maxBurstOffset
      }
      entry
    }
    def ===(that: MSHREntryVariableLengthWithBurstUpdateFlags): Bool = {this.asUInt === that.asUInt}
    override def cloneType = (new MSHREntryVariableLengthWithBurstUpdateFlags(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth)).asInstanceOf[this.type]
}

class MSHREntryVariableLengthLastTable(tagWidth: Int, ldBufPtrWidth: Int, burstOffsetWidth: Int, queueAddrWidth: Int, val lastTableIdxWidth: Int)
  extends MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth) with HasLastTableIdx {
    // def dropLastTableAndMaybeOffset(useMaybeBurstOffsets: Bool=false.B): MSHREntryVariableLengthWithBurstUpdateFlags = {
    //   val entry = Wire(new MSHREntryVariableLengthWithBurstUpdateFlags(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth))
    //   entry connectAllExisting this
    //   when(useMaybeBurstOffsets) {
    //     entry.minBurstOffset := this.maybeMinBurstOffset
    //     entry.maxBurstOffset := this.maybeMaxBurstOffset
    //   }
    //   entry
    // }
    def dropLastTable(): MSHREntryVariableLength = {
      val entry = Wire(new MSHREntryVariableLength(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth))
      entry connectAllExisting this
      entry
    }
    override def cloneType = (new MSHREntryVariableLengthLastTable(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth, lastTableIdxWidth)).asInstanceOf[this.type]
}

class MSHREntryValidVariableLengthLastTable(tagWidth: Int, ldBufPtrWidth: Int, burstOffsetWidth: Int, queueAddrWidth: Int, lastTableIdxWidth: Int)
  extends MSHREntryVariableLengthLastTable(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth, lastTableIdxWidth) with HasValid {
    override def cloneType = (new MSHREntryValidVariableLengthLastTable(tagWidth, ldBufPtrWidth, burstOffsetWidth, queueAddrWidth, lastTableIdxWidth)).asInstanceOf[this.type]

}

class MSHREntryValidLastTable(tagWidth: Int, ldBufPtrWidth: Int, val lastTableIdxWidth: Int)
  extends MSHREntry(tagWidth, ldBufPtrWidth) with HasValid with HasLastTableIdx {
    override def cloneType = (new MSHREntryValidLastTable(tagWidth, ldBufPtrWidth, lastTableIdxWidth)).asInstanceOf[this.type]
    def getInvalidEntry() = {
      val m = Wire(this)
      m.valid := false.B
      m.tag := DontCare
      m.ldBufPtr := DontCare
      m.lastTableIdx := DontCare
      m
    }
}

class MSHRExtMemType(val tagWidth: Int, val burstOffsetWidth: Int) extends ModularBundle with HasTag with HasBurstOffset {
  override def cloneType = (new MSHRExtMemType(tagWidth, burstOffsetWidth)).asInstanceOf[this.type]
}

class TraditionalMSHREntry(val tagWidth: Int, ldBufCountWidth: Int) extends ModularBundle with HasTag with HasValid {
    val ldBufLastValidIdx = UInt(ldBufCountWidth.W)
    override def cloneType = (new TraditionalMSHREntry(tagWidth, ldBufCountWidth)).asInstanceOf[this.type]
}

class LdBufEntry(offsetWidth: Int, idWidth: Int) extends ModularBundle {
    val offset = UInt(offsetWidth.W)
    val id = UInt(idWidth.W)

    override def cloneType = (new LdBufEntry(offsetWidth, idWidth)).asInstanceOf[this.type]
}

class LdBufEntryVariableLength(offsetWidth: Int, burstOffsetWidth: Int, idWidth: Int) extends LdBufEntry(offsetWidth, idWidth) {
    val burstOffset = UInt(burstOffsetWidth.W)
    def dropBurstOffset(): LdBufEntry = {
      val w = Wire(new LdBufEntry(offsetWidth, idWidth))
      w.offset := this.offset
      w.id := this.id
      w
    }

    override def cloneType = (new LdBufEntryVariableLength(offsetWidth, burstOffsetWidth, idWidth)).asInstanceOf[this.type]
}

class LdBufRow(val offsetWidth: Int, val idWidth: Int, val entriesPerRow: Int, nextPtrWidth: Int)
  extends {
    val lastValidIdxWidth = if (log2Ceil(entriesPerRow) > 0) log2Ceil(entriesPerRow) else 1
  } with ModularBundle with HasLdBufEntries with HasLastValidIdx {
    val nextPtr = UInt(nextPtrWidth.W)
    val nextPtrValid = Bool()

    override def cloneType = (new LdBufRow(offsetWidth, idWidth, entriesPerRow, nextPtrWidth)).asInstanceOf[this.type]
}

class LdBufRowVariableLength(val offsetWidth: Int, val idWidth: Int, val burstOffsetWidth: Int, val entriesPerRow: Int, nextPtrWidth: Int)
  extends {
    val lastValidIdxWidth = if (log2Ceil(entriesPerRow) > 0) log2Ceil(entriesPerRow) else 1
  } with ModularBundle with HasLdBufEntriesVariableLength with HasLastValidIdx {
    val nextPtr = UInt(nextPtrWidth.W)
    val nextPtrValid = Bool()

    override def cloneType = (new LdBufRowVariableLength(offsetWidth, idWidth, burstOffsetWidth, entriesPerRow, nextPtrWidth)).asInstanceOf[this.type]
}

class LdBufRowTraditional(val offsetWidth: Int, val idWidth: Int, val entriesPerRow: Int)
  extends ModularBundle with HasLdBufEntries {
    override def cloneType = (new LdBufRowTraditional(offsetWidth, idWidth, entriesPerRow)).asInstanceOf[this.type]
}

class LdBufOpType extends ModularBundle {
    /* Whether we want to allocate (true) or deallocate (false) an entry */
    val allocateEntry = Bool()
    /* Whether the new entry goes to a new line (true) or to an existing line (false) */
    val allocateRow = Bool()
    /* allocateEntry = true and allocateRow = false should not be used */
}

class MSHRToLdBufIO(offsetWidth: Int, idWidth: Int, val dataWidth: Int, val rowAddrWidth: Int)
  extends ModularBundle with HasData with HasRowAddr {
    val entry = new LdBufEntry(offsetWidth, idWidth)
    val opType = new LdBufOpType()

    override def cloneType = (new MSHRToLdBufIO(offsetWidth, idWidth, dataWidth, rowAddrWidth)).asInstanceOf[this.type]
}

class MSHRVariableLengthToLdBufIO(offsetWidth: Int, idWidth: Int, val dataBufferAddrWidth: Int, val burstLenWidth: Int, val rowAddrWidth: Int)
  extends ModularBundle with HasDataBufferParams with HasRowAddr {
    val entry = new LdBufEntryVariableLength(offsetWidth, burstLenWidth, idWidth)
    val opType = new LdBufOpType()
    val isFakeDealloc = Bool()

    override def cloneType = (new MSHRVariableLengthToLdBufIO(offsetWidth, idWidth, dataBufferAddrWidth, burstLenWidth, rowAddrWidth)).asInstanceOf[this.type]
}

class TraditionalMSHRToLdBufIO(offsetWidth: Int, idWidth: Int, dataWidth: Int, rowAddrWidth: Int, entryIdxWidth: Int)
  extends {
    val lastValidIdxWidth = entryIdxWidth
  } with MSHRToLdBufIO(offsetWidth, idWidth, dataWidth, rowAddrWidth) with HasLastValidIdx {
    val additionalEntryValid = Bool()

    override def cloneType = (new TraditionalMSHRToLdBufIO(offsetWidth, idWidth, dataWidth, rowAddrWidth, entryIdxWidth)).asInstanceOf[this.type]
}

class RespGenIO(val dataWidth: Int, val offsetWidth: Int, val idWidth: Int, val entriesPerRow: Int)
  extends {
    val lastValidIdxWidth = log2Ceil(entriesPerRow)
  } with ModularBundle with HasLdBufEntries with HasData with HasLastValidIdx {
    override def cloneType = (new RespGenIO(dataWidth, offsetWidth, idWidth, entriesPerRow)).asInstanceOf[this.type]
}

class RespGenVariableLengthIO(val dataBufferAddrWidth: Int, val burstOffsetWidth: Int, val offsetWidth: Int, val idWidth: Int, val entriesPerRow: Int)
  extends {
    val lastValidIdxWidth = log2Ceil(entriesPerRow)
    val burstLenWidth = burstOffsetWidth
  } with ModularBundle with HasLdBufEntriesVariableLength with HasDataBufferParams with HasLastValidIdx {
    val isFirstRow = Bool()
    val isLastRow = Bool()
    val isFakeDealloc = Bool()
    override def cloneType = (new RespGenVariableLengthIO(dataBufferAddrWidth, burstLenWidth, offsetWidth, idWidth, entriesPerRow)).asInstanceOf[this.type]
}

class LdBufWritePipelineIO(offsetWidth: Int, idWidth: Int, rowAddrWidth: Int, entriesPerRow: Int) extends ModularBundle {
    val entry = new LdBufEntry(offsetWidth, idWidth)
    val rowAddr = UInt(rowAddrWidth.W)
    val origRowAddr = UInt(rowAddrWidth.W)
    val row = new LdBufRow(offsetWidth, idWidth, entriesPerRow, rowAddrWidth)
    val rowFull = Bool()

    override def cloneType = (new LdBufWritePipelineIO(offsetWidth, idWidth, rowAddrWidth, entriesPerRow)).asInstanceOf[this.type]
}

class LdBufWritePipelineVariableLengthIO(offsetWidth: Int, burstOffsetWidth: Int, idWidth: Int, rowAddrWidth: Int, entriesPerRow: Int) extends ModularBundle {
    val entry = new LdBufEntryVariableLength(offsetWidth, burstOffsetWidth, idWidth)
    val rowAddr = UInt(rowAddrWidth.W)
    val origRowAddr = UInt(rowAddrWidth.W)
    val row = new LdBufRowVariableLength(offsetWidth, idWidth, burstOffsetWidth, entriesPerRow, rowAddrWidth)
    val rowFull = Bool()

    override def cloneType = (new LdBufWritePipelineVariableLengthIO(offsetWidth, burstOffsetWidth, idWidth, rowAddrWidth, entriesPerRow)).asInstanceOf[this.type]
}

class NextPtrCacheEntryIO(val rowAddrWidth: Int) extends ModularBundle with HasRowAddr {
  val nextPtr = UInt(rowAddrWidth.W)

  override def cloneType = (new NextPtrCacheEntryIO(rowAddrWidth)).asInstanceOf[this.type]
}

class OrigAndNewRowAddrIO(val rowAddrWidth: Int) extends ModularBundle with HasRowAddr {
  val origRowAddr = UInt(rowAddrWidth.W)

  override def cloneType = (new OrigAndNewRowAddrIO(rowAddrWidth)).asInstanceOf[this.type]
}

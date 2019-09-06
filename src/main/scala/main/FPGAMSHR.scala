package fpgamshr.main

import chisel3._
import chisel3.util._
import fpgamshr.util.{DReg, ElasticBuffer, BaseReorderBufferAXI, ReorderBufferAXI, DummyReorderBufferAXI, ReorderBufferIO}
import fpgamshr.interfaces._
import fpgamshr.crossbar.{Crossbar}
import fpgamshr.reqhandler.RequestHandlerBase
import fpgamshr.reqhandler.traditional
import fpgamshr.reqhandler.cuckoo
import fpgamshr.extmemarbiter.{ExternalMemoryArbiterBase, ReorderingExternalMemoryArbiter}
import fpgamshr.extmemarbiter.variablelength.{InOrderExternalMultiPortedMemoryArbiter}
import fpgamshr.profiling.{Profiling, ProfilingCounter, ProfilingInterface, ProfilingSelector}

import scala.collection.mutable.ArrayBuffer
import com.typesafe.config.ConfigFactory

import java.io.File

object FPGAMSHR {
  def loadParams(configFilePath: Option[String]) = {
    val fileConfig = if(configFilePath.isDefined) ConfigFactory.load(ConfigFactory.parseFile(new File(configFilePath.get))) else ConfigFactory.load("FPGAMSHR")
    if(configFilePath.isDefined) {
      println(s"Reading configuration from ${configFilePath.get}")
    } else {
      println(s"No configuration file passed, reading from default configuration src/main/resources/FPGAMSHR.conf")
    }
    reqAddrWidth = fileConfig.getInt("reqAddrWidth")
    memAddrWidth = fileConfig.getInt("memAddrWidth")
    // We need a Long because with an Int (signed) addresses greater than
    // 0x7FFFFFFF would be treated as negative
    memAddrOffset = java.lang.Long.decode(fileConfig.getString("memAddrOffset"))
    reqDataWidth = fileConfig.getInt("reqDataWidth")
    reqIdWidth = fileConfig.getInt("reqIdWidth")
    memIdWidth = fileConfig.getInt("memIdWidth")
    memDataWidth = fileConfig.getInt("memDataWidth")

    burstLengthWidth = fileConfig.getInt("burstLengthWidth")
    dataBufferAddrWidth = fileConfig.getInt("dataBufferAddrWidth")

    useROB = fileConfig.getInt("useROB") != 0
    numInputs = fileConfig.getInt("numInputs")
    numReqHandlers = fileConfig.getInt("numReqHandlers")

    numCacheWays = fileConfig.getInt("numCacheWays")
    cacheSizeBytes = fileConfig.getInt("cacheSizeBytes")
    cacheSizeReductionWidth = fileConfig.getInt("cacheSizeReductionWidth")

    numHashTables = fileConfig.getInt("numHashTables")
    numMSHRPerHashTable = fileConfig.getInt("numMSHRPerHashTable")
    mshrAssocMemorySize = fileConfig.getInt("mshrAssocMemorySize")
    mshrAlmostFullRelMargin = fileConfig.getInt("mshrAlmostFullRelMargin")
    sameHashFunction = fileConfig.getInt("sameHashFunction") != 0
    getFullBurstOnFailedBurstUpdate = true
    alwaysGetFullBurst = false

    numSubentriesPerRow = fileConfig.getInt("numSubentriesPerRow")
    subentriesAddrWidth = fileConfig.getInt("subentryAddrWidth")
    nextPtrCacheSize = fileConfig.getInt("nextPtrCacheSize")
    blockOnNextPtr = fileConfig.getInt("blockOnNextPtr") != 0

    memMaxOutstandingReads = fileConfig.getInt("memMaxOutstandingReads")
    reordExtMemArbiterQueueDepth = 0
    numMemoryPorts = fileConfig.getInt("numMemoryPorts")
    systemType = { fileConfig.getInt("system_type") match {
        case 1 => Some("PL")
        case 2 => Some("PS")
        case _ => None
      }
    }
  }

  def ipName(): String = s"""DynaBurst_reqaddr${FPGAMSHR.reqAddrWidth}
_id${FPGAMSHR.reqIdWidth}
_numin${FPGAMSHR.numInputs}
_rh${FPGAMSHR.numReqHandlers}
_ht${FPGAMSHR.numHashTables}
_mshr${FPGAMSHR.numMSHRPerHashTable}
_assoc${if(FPGAMSHR.numHashTables > 0) FPGAMSHR.mshrAssocMemorySize else 0}
_seperrow${FPGAMSHR.numSubentriesPerRow}
_sebufaddr${if(FPGAMSHR.numHashTables > 0) FPGAMSHR.subentriesAddrWidth else 0}
_nextptrcache${if(FPGAMSHR.numHashTables > 0) FPGAMSHR.nextPtrCacheSize else 0}
${if (FPGAMSHR.blockOnNextPtr) "_nonextptr" else ""}
${if (FPGAMSHR.sameHashFunction) "_nocuckoo" else ""}
_cways${if((FPGAMSHR.cacheSizeBytes > 0) && (FPGAMSHR.numCacheWays > 0)) FPGAMSHR.numCacheWays else 0}
_csize${if((FPGAMSHR.cacheSizeBytes > 0) && (FPGAMSHR.numCacheWays > 0)) FPGAMSHR.cacheSizeBytes else 0}
_memports${FPGAMSHR.numMemoryPorts}""".replace("\n", "") +
(if(FPGAMSHR.burstLengthWidth > 0) s"_burstlen${FPGAMSHR.burstLengthWidth}_db${FPGAMSHR.dataBufferAddrWidth}" else "") +
(if(FPGAMSHR.burstLengthWidth > 0 && FPGAMSHR.alwaysGetFullBurst) "_alwaysfullburst" else "") +
(if(FPGAMSHR.useROB) "_rob" else "") +
(if(Profiling.enable) "" else "_noprof")

    var reqAddrWidth = 0
    var memAddrWidth = 0
    // We need a Long because with an Int (signed) addresses greater than
    // 0x7FFFFFFF would be treated as negative
    var memAddrOffset = 0L
    var reqDataWidth = 0
    var reqIdWidth = 0
    var memIdWidth = 0
    var memDataWidth = 0

    var useROB = true
    var numInputs = 0
    var numReqHandlers = 0

    var burstLengthWidth = 3
    var dataBufferAddrWidth = 9

    var numCacheWays = 0
    var cacheSizeBytes = 0
    var cacheSizeReductionWidth = 0

    var numHashTables = 0
    var numMSHRPerHashTable = 0
    var mshrAssocMemorySize = 0
    var mshrAlmostFullRelMargin = 0
    var sameHashFunction = true
    var getFullBurstOnFailedBurstUpdate = true
    var alwaysGetFullBurst = false

    var numSubentriesPerRow = 0
    var subentriesAddrWidth = 0
    var nextPtrCacheSize = 0
    var blockOnNextPtr = true

    var memMaxOutstandingReads = 0
    var reordExtMemArbiterQueueDepth = 0
    var numMemoryPorts = 0

    var systemType: Option[String] = None

    var outputDir = "."
    val version = 0.2
}

class FPGAMSHR extends Module {
    require(isPow2(FPGAMSHR.reqDataWidth))
    require(isPow2(FPGAMSHR.memDataWidth))
    require(isPow2(FPGAMSHR.numInputs))
    require(isPow2(FPGAMSHR.numReqHandlers))
    if(FPGAMSHR.burstLengthWidth > 0) require(FPGAMSHR.dataBufferAddrWidth > 0)
    /* +1 because of the special section dedicated to the FPGAMSHR, crossbar and external memory arbiter */
    val totalProfilingAddrWidth = log2Ceil(FPGAMSHR.numReqHandlers + FPGAMSHR.numInputs) + 1 + Profiling.regAddrWidth + Profiling.subModuleAddrWidth + log2Ceil(Profiling.dataWidth / 8)
    val io = IO(new Bundle{
        val in = Vec(FPGAMSHR.numInputs, new AXI4FullReadOnly(UInt(FPGAMSHR.reqDataWidth.W), FPGAMSHR.reqAddrWidth, FPGAMSHR.reqIdWidth))
        val out = Flipped(Vec(FPGAMSHR.numMemoryPorts, new AXI4FullReadOnly(UInt(FPGAMSHR.memDataWidth.W), FPGAMSHR.memAddrWidth, FPGAMSHR.memIdWidth)))
        val axiProfiling = new AXI4Lite(UInt(Profiling.dataWidth.W), totalProfilingAddrWidth)
        // val clock2x = Input(Clock())
    })

    /* Control interface */
    /* Address 0 (control):
    - bit 0: clear if write 1
    - bit 1: snapshot if write 1
    - bit 2: invalidate if write 1
    Address 8: log2CacheSizeReduction
    Address 16: maxUsedMSHRs
    */
    /* TODO: rename axiProfiling to axiControl */
    val inputProfilingWriteDataEb = Module(new ElasticBuffer(new DataStrobeIO(io.axiProfiling.WDATA.getWidth)))
    val inputProfilingWriteAddrEb = Module(new ElasticBuffer(UInt(4.W)))
    inputProfilingWriteDataEb.io.in.bits.data := io.axiProfiling.WDATA
    inputProfilingWriteDataEb.io.in.bits.strb := io.axiProfiling.WSTRB
    inputProfilingWriteDataEb.io.in.valid := io.axiProfiling.WVALID
    io.axiProfiling.WREADY := inputProfilingWriteDataEb.io.in.ready
    inputProfilingWriteAddrEb.io.in.bits := io.axiProfiling.AWADDR(log2Ceil(Profiling.dataWidth / 8) + 3, log2Ceil(Profiling.dataWidth / 8))
    inputProfilingWriteAddrEb.io.in.valid := io.axiProfiling.AWVALID
    io.axiProfiling.AWREADY := inputProfilingWriteAddrEb.io.in.ready
    /* Consume one address and one data only when both are available */
    inputProfilingWriteDataEb.io.out.ready := inputProfilingWriteAddrEb.io.out.valid & ~io.axiProfiling.BVALID
    inputProfilingWriteAddrEb.io.out.ready := inputProfilingWriteDataEb.io.out.valid & ~io.axiProfiling.BVALID
    val dataAddrAvailable = inputProfilingWriteAddrEb.io.out.valid & inputProfilingWriteDataEb.io.out.valid & ~io.axiProfiling.BVALID

    val clear = dataAddrAvailable & (inputProfilingWriteAddrEb.io.out.bits === 0.U) & (inputProfilingWriteDataEb.io.out.bits.data(0) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)
    val snapshot = dataAddrAvailable & (inputProfilingWriteAddrEb.io.out.bits === 0.U) & (inputProfilingWriteDataEb.io.out.bits.data(1) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)
    val invalidate = dataAddrAvailable & (inputProfilingWriteAddrEb.io.out.bits === 0.U) & (inputProfilingWriteDataEb.io.out.bits.data(2) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)
    val enableCache = RegInit(true.B)
    val log2CacheSizeReduction = RegInit(0.U(FPGAMSHR.cacheSizeReductionWidth.W))
    val numMSHRTotal = FPGAMSHR.numHashTables * FPGAMSHR.numMSHRPerHashTable
    val alwaysGetFullBurst = RegInit(false.B)
    when(dataAddrAvailable & (inputProfilingWriteAddrEb.io.out.bits === 0.U)) {
      when((inputProfilingWriteDataEb.io.out.bits.data(3) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)) {
        enableCache := true.B
      } .elsewhen((inputProfilingWriteDataEb.io.out.bits.data(4) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)) {
        enableCache := false.B
      }
      when((inputProfilingWriteDataEb.io.out.bits.data(5) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)) {
        alwaysGetFullBurst := true.B
      } .elsewhen((inputProfilingWriteDataEb.io.out.bits.data(6) === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)) {
        alwaysGetFullBurst := false.B
      }
    }
    if (FPGAMSHR.cacheSizeReductionWidth > 0) {
      when(dataAddrAvailable & (inputProfilingWriteAddrEb.io.out.bits === 1.U) & (inputProfilingWriteDataEb.io.out.bits.strb(0) === 1.U)) {
        log2CacheSizeReduction := inputProfilingWriteDataEb.io.out.bits.data(FPGAMSHR.cacheSizeReductionWidth-1, 0)
      }
    } else {
      log2CacheSizeReduction := 0.U
    }

    /* Input address structure:
    --------------------------------------------------------------------------------------------------
    |     tag    |  req handler address  |     burstOffset    |    offset     |          0           |
    --------------------------------------------------------------------------------------------------
    |<-tagWidth->|<-reqHandlerAddrWidth->|<-burstOffsetWidth->|<-offsetWidth->|<-subWordOffsetWidth->|
    |<------------------------------------------addrWidth------------------------------------------->|
    Address between crossbar and request handler:
    ---------------------------------------------------
    |     tag    |     burstOffset    |    offset     |
    ---------------------------------------------------
    |<-tagWidth->|<-burstOffsetWidth->|<-offsetWidth->|
    */
    val bitsPerByte = 8
    val subWordOffsetWidth = log2Ceil(FPGAMSHR.reqDataWidth / bitsPerByte) /* Completely ignored */
    val offsetWidth = log2Ceil(FPGAMSHR.memDataWidth / FPGAMSHR.reqDataWidth)
    val reqHandlerAddrWidth = log2Ceil(FPGAMSHR.numReqHandlers)
    val tagWidth = FPGAMSHR.reqAddrWidth - subWordOffsetWidth - offsetWidth - reqHandlerAddrWidth
    /* ID structure:
    ---------------------------------
    |    input id    | original id  |
    ---------------------------------
    |<-inputIdWidth->|<-reqIdWidth->|
    */

    val crossbar = Module(new Crossbar(nInputs = FPGAMSHR.numInputs, nOutputs = FPGAMSHR.numReqHandlers, addrWidth = FPGAMSHR.reqAddrWidth - subWordOffsetWidth, burstOffsetWidth = FPGAMSHR.burstLengthWidth, reqDataWidth = FPGAMSHR.reqDataWidth, memDataWidth = FPGAMSHR.memDataWidth, idWidth = FPGAMSHR.reqIdWidth))
    val reorderBuffers: Array[ReorderBufferIO] = Array.fill(FPGAMSHR.numInputs)(Module(if(FPGAMSHR.useROB) new ReorderBufferAXI(FPGAMSHR.reqAddrWidth, FPGAMSHR.reqDataWidth, FPGAMSHR.reqIdWidth) else new DummyReorderBufferAXI(FPGAMSHR.reqAddrWidth, FPGAMSHR.reqDataWidth, FPGAMSHR.reqIdWidth)).io)
    io.in.zip(reorderBuffers).foreach(x => x._2.in <> x._1)
    // reorderBuffers.foreach(_.clock2x := io.clock2x)
    val crossbarInputs = reorderBuffers.map(_.out)
    for(i <- 0 until FPGAMSHR.numInputs) {
        crossbar.io.ins(i).addr.bits.addr := crossbarInputs(i).ARADDR(FPGAMSHR.reqAddrWidth-1, subWordOffsetWidth)
        crossbar.io.ins(i).addr.valid := crossbarInputs(i).ARVALID
        crossbarInputs(i).ARREADY := crossbar.io.ins(i).addr.ready
        crossbar.io.ins(i).addr.bits.id := crossbarInputs(i).ARID
        crossbarInputs(i).RDATA := crossbar.io.ins(i).data.bits.data
        crossbarInputs(i).RVALID := crossbar.io.ins(i).data.valid
        crossbar.io.ins(i).data.ready := crossbarInputs(i).RREADY
        crossbarInputs(i).RID := crossbar.io.ins(i).data.bits.id
        /* TODO: respond with SLVERR (2) if ARLEN and ARSIZE signal a burst
         * longer than 1 beat. */
        crossbarInputs(i).RRESP := 0.U
        /* Unused signals */
        crossbarInputs(i).RLAST := true.B
    }

    val outCrossbarIdWidth = crossbar.io.outs(0).addr.bits.id.getWidth
    val outCrossbarAddrWidth = crossbar.io.outs(0).addr.bits.addr.getWidth
    // var reqHandlers: Array[RequestHandlerIO] = Array.fill(FPGAMSHR.numReqHandlers)(Module(new RequestHandlerBlockingCache(reqAddrWidth=outCrossbarAddrWidth,
    //     FPGAMSHR.reqDataWidth, reqIdWidth=outCrossbarIdWidth, FPGAMSHR.memDataWidth, FPGAMSHR.numCacheWays, FPGAMSHR.cacheSizeBytes)).io)
    val reqHandlers: Array[RequestHandlerIO] =
        if(FPGAMSHR.numMSHRPerHashTable > 0) {
            if(FPGAMSHR.numHashTables > 0) {
              if(FPGAMSHR.burstLengthWidth > 0) {
                Array.fill(FPGAMSHR.numReqHandlers)(Module(new cuckoo.variablelength.RequestHandler(reqAddrWidth=outCrossbarAddrWidth, FPGAMSHR.burstLengthWidth,
                  FPGAMSHR.reqDataWidth, reqIdWidth=outCrossbarIdWidth, FPGAMSHR.memDataWidth, FPGAMSHR.numHashTables,
                  FPGAMSHR.numMSHRPerHashTable, FPGAMSHR.mshrAssocMemorySize, FPGAMSHR.numSubentriesPerRow, FPGAMSHR.subentriesAddrWidth,
                  FPGAMSHR.numCacheWays, FPGAMSHR.cacheSizeBytes, FPGAMSHR.dataBufferAddrWidth, FPGAMSHR.cacheSizeReductionWidth,
                  log2Ceil(numMSHRTotal+1), FPGAMSHR.nextPtrCacheSize, FPGAMSHR.blockOnNextPtr, FPGAMSHR.sameHashFunction,
                  FPGAMSHR.getFullBurstOnFailedBurstUpdate, FPGAMSHR.alwaysGetFullBurst)).io)
              } else {
                Array.fill(FPGAMSHR.numReqHandlers)(Module(new cuckoo.RequestHandlerCuckoo(reqAddrWidth=outCrossbarAddrWidth,
                  FPGAMSHR.reqDataWidth, reqIdWidth=outCrossbarIdWidth, FPGAMSHR.memDataWidth, FPGAMSHR.numHashTables,
                  FPGAMSHR.numMSHRPerHashTable, FPGAMSHR.mshrAssocMemorySize, FPGAMSHR.numSubentriesPerRow, FPGAMSHR.subentriesAddrWidth,
                  FPGAMSHR.numCacheWays, FPGAMSHR.cacheSizeBytes, FPGAMSHR.cacheSizeReductionWidth, log2Ceil(numMSHRTotal+1), FPGAMSHR.nextPtrCacheSize, FPGAMSHR.blockOnNextPtr, FPGAMSHR.sameHashFunction)).io)
              }
            } else {
            Array.fill(FPGAMSHR.numReqHandlers)(Module(new traditional.RequestHandlerTraditionalMSHR(reqAddrWidth=outCrossbarAddrWidth,
                FPGAMSHR.reqDataWidth, reqIdWidth=outCrossbarIdWidth, FPGAMSHR.memDataWidth, FPGAMSHR.numMSHRPerHashTable,
                FPGAMSHR.numSubentriesPerRow, FPGAMSHR.numCacheWays, FPGAMSHR.cacheSizeBytes, FPGAMSHR.cacheSizeReductionWidth)).io)
            }
        } else {
            Array.fill(FPGAMSHR.numReqHandlers)(Module(new traditional.RequestHandlerBlockingCache(reqAddrWidth=outCrossbarAddrWidth,
                FPGAMSHR.reqDataWidth, reqIdWidth=outCrossbarIdWidth, FPGAMSHR.memDataWidth, FPGAMSHR.numCacheWays, FPGAMSHR.cacheSizeBytes, FPGAMSHR.cacheSizeReductionWidth)).io)
        }

    val extMemArbiter: ExternalMemoryArbiterBase = if(FPGAMSHR.reordExtMemArbiterQueueDepth > 0) {
      Module(new ReorderingExternalMemoryArbiter(FPGAMSHR.reqAddrWidth, FPGAMSHR.memAddrWidth, FPGAMSHR.memDataWidth, FPGAMSHR.memIdWidth, FPGAMSHR.numReqHandlers, FPGAMSHR.memMaxOutstandingReads, FPGAMSHR.memAddrOffset, FPGAMSHR.reordExtMemArbiterQueueDepth))
    } else {
      Module(new InOrderExternalMultiPortedMemoryArbiter(FPGAMSHR.reqAddrWidth, FPGAMSHR.burstLengthWidth, FPGAMSHR.memAddrWidth, FPGAMSHR.memDataWidth, FPGAMSHR.memIdWidth, FPGAMSHR.numReqHandlers, FPGAMSHR.memMaxOutstandingReads, FPGAMSHR.memAddrOffset, FPGAMSHR.numMemoryPorts, useScrambler=false))
    }

    for(i <- 0 until FPGAMSHR.numReqHandlers) {
        reqHandlers(i).inReq <> crossbar.io.outs(i)
        reqHandlers(i).invalidate := invalidate
        reqHandlers(i).log2CacheSizeReduction := log2CacheSizeReduction
        reqHandlers(i).enableCache := enableCache
        reqHandlers(i).alwaysGetFullBurst := alwaysGetFullBurst
        extMemArbiter.io.inReq(i) <> reqHandlers(i).outMemReq
        reqHandlers(i).inMemResp <> extMemArbiter.io.outResp(i)
        // reqHandlers(i).clock2x := io.clock2x
    }

    io.out.zip(extMemArbiter.io.outMem).foreach{ case(x1, x2) => x1 <> x2 }

    /* Profiling */
    if (Profiling.enable) {
        val inputProfilingReadEb = Module(new ElasticBuffer(UInt((totalProfilingAddrWidth - log2Ceil(Profiling.dataWidth / 8)).W))) /* We latch the address */

        inputProfilingReadEb.io.in.bits := io.axiProfiling.ARADDR(totalProfilingAddrWidth-1, log2Ceil(Profiling.dataWidth / 8))
        inputProfilingReadEb.io.in.valid := io.axiProfiling.ARVALID
        io.axiProfiling.ARREADY := inputProfilingReadEb.io.in.ready

        val totalCycleCounter = ProfilingCounter(true.B, Profiling.dataWidth, snapshot, clear)
        val cyclesExtMemNotReady = io.out.map(x => ProfilingCounter(x.ARVALID & ~x.ARREADY, Profiling.dataWidth, snapshot, clear))
        /* TODO: do things properly and allocate profiling memory space for the data buffer.
           This way we can also monitor how many cycles are wasted because of full buffer. */
        val cyclesInDataNotReady = extMemArbiter.io.outResp.map(x => ProfilingCounter(x.valid & ~x.ready, Profiling.dataWidth, snapshot, clear))
        // val fpgamshrRegAddr = Wire(DecoupledIO(UInt(Profiling.regAddrWidth.W)))
        val fpgamshrSubModuleAddr = Wire(DecoupledIO(UInt((Profiling.regAddrWidth + Profiling.subModuleAddrWidth).W)))
        val w = fpgamshrSubModuleAddr.bits.getWidth
        // println(s"fpgamshrSubModuleAddr.bits.getWidth=$w")


        val fpgamshrRegAxiProfiling = Wire(new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth))
        val fpgamshrProfilingInterface = ProfilingInterface(fpgamshrRegAxiProfiling.axi, Vec(ArrayBuffer(totalCycleCounter) ++ cyclesExtMemNotReady ++ cyclesInDataNotReady))
        fpgamshrRegAxiProfiling.axi.RDATA := fpgamshrProfilingInterface.bits
        fpgamshrRegAxiProfiling.axi.RRESP := 0.U
        fpgamshrRegAxiProfiling.axi.RVALID := fpgamshrProfilingInterface.valid
        fpgamshrProfilingInterface.ready := fpgamshrRegAxiProfiling.axi.RREADY
        val dummyAxiProfiling = Wire(new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth))
        dummyAxiProfiling.axi.RDATA  := DontCare
        dummyAxiProfiling.axi.RRESP  := 0.U
        dummyAxiProfiling.axi.RVALID := false.B
        dummyAxiProfiling.axi.ARREADY := true.B

        val fpgamshrSelector = ProfilingSelector(fpgamshrSubModuleAddr, Array(fpgamshrRegAxiProfiling) ++ Seq.fill(3)(dummyAxiProfiling), snapshot=snapshot, clear=clear)
        val fpgamshrAxiProfiling = Wire(new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth + Profiling.subModuleAddrWidth))
        fpgamshrAxiProfiling.axi.RDATA := fpgamshrSelector.bits
        fpgamshrAxiProfiling.axi.RRESP := 0.U
        fpgamshrAxiProfiling.axi.RVALID := fpgamshrSelector.valid

        fpgamshrSelector.ready := fpgamshrAxiProfiling.axi.RREADY
        fpgamshrSubModuleAddr.bits := fpgamshrAxiProfiling.axi.ARADDR
        fpgamshrSubModuleAddr.valid := fpgamshrAxiProfiling.axi.ARVALID
        fpgamshrAxiProfiling.axi.ARREADY := fpgamshrSubModuleAddr.ready
        val subModulesProfilingInterfaces = reqHandlers.map(_.axiProfiling) ++ reorderBuffers.map(_.axiProfiling) ++ Array(fpgamshrAxiProfiling)
        val globalSelector = ProfilingSelector(inputProfilingReadEb.io.out, subModulesProfilingInterfaces, clear=clear, snapshot=snapshot)
        val outputProfilingEb = ElasticBuffer(globalSelector)
        io.axiProfiling.RDATA := outputProfilingEb.bits
        io.axiProfiling.RVALID := outputProfilingEb.valid
        outputProfilingEb.ready := io.axiProfiling.RREADY
        io.axiProfiling.RRESP := 0.U
        io.axiProfiling.BRESP := 0.U
        val axiprofBVALID = RegInit(false.B)
        when(dataAddrAvailable) {
          axiprofBVALID := true.B
        } .elsewhen(axiprofBVALID & io.axiProfiling.BREADY) {
          axiprofBVALID := false.B
        }
        io.axiProfiling.BVALID := axiprofBVALID
        // io.axiProfiling.BVALID := RegNext(io.axiProfiling.WVALID)
        // io.axiProfiling.AWREADY := true.B
        // io.axiProfiling.WREADY := true.B
    } else {
        io.axiProfiling.ARREADY := false.B
        io.axiProfiling.RVALID := false.B
        io.axiProfiling.RDATA := DontCare
        io.axiProfiling.RRESP := DontCare
        io.axiProfiling.AWREADY := false.B
        io.axiProfiling.WREADY := false.B
        io.axiProfiling.BRESP := 0.U
        io.axiProfiling.BVALID := false.B
    }
}

package fpgamshr.reqhandler.cuckoo.variablelength

import chisel3._
import fpgamshr.interfaces._
import fpgamshr.util._
import chisel3.util._
import fpgamshr.profiling._
import fpgamshr.reqhandler.ResponseGeneratorOneOutputArbitraryEntriesPerRow
import fpgamshr.reqhandler.{RequestHandlerBase}

object RequestHandler {
    val reqAddrWidth = 28   /* Excluding the part that is always 0, i.e. the log2Ceil(reqDataWidth) least significant bits, and the req handler address (log2Ceil(numReqHandlers)) */
    val reqDataWidth = 32
    val reqIdWidth = 20     /* Original ID width + input port address (log2Ceil(numInputPorts)) */
    val memDataWidth = 512
    val burstOffsetWidth = 2
    val dataBufferAddrWidth = 5
    val getFullBurstOnFailedBurstUpdate = false
    val alwaysGetFullBurst = false

    val numHashTables = 2
    val numMSHRPerHashTable = 32
    val mshrAssocMemorySize = 6

    val numMSHRWidth = log2Ceil(numHashTables * numMSHRPerHashTable)

    val numSubentriesPerRow = 4
    val subentriesAddrWidth = 11
    val numCacheWays = 4
    val cacheSizeBytes = 4096
    val cacheSizeReductionWidth = 2
    val nextPtrCacheSize = 8

    // val branchAddrWidth = numLevelComparators * log2Ceil(numSplPerLevelComparator + 1)
    val responseGeneratorPorts = 1 /* More ports are supported by the responseGenerator but not by the RequestHandler */
}

class RequestHandler(reqAddrWidth: Int,
  burstOffsetWidth: Int,
  reqDataWidth: Int,
  reqIdWidth: Int,
  memDataWidth: Int,
  numHashTables: Int,
  numMSHRPerHashTable: Int,
  mshrAssocMemorySize: Int,
  numSubentriesPerRow: Int,
  subentriesAddrWidth: Int,
  numCacheWays: Int,
  cacheSizeBytes: Int,
  dataBufferAddrWidth: Int,
  cacheSizeReductionWidth: Int,
  numMSHRWidth: Int,
  nextPtrCacheSize: Int,
  blockOnNextPtr: Boolean, sameHashFunction: Boolean,
  getFullBurstOnFailedBurstUpdate: Boolean,
  alwaysGetFullBurst: Boolean) extends RequestHandlerBase(reqAddrWidth, burstOffsetWidth, reqDataWidth, reqIdWidth, memDataWidth, cacheSizeReductionWidth, numMSHRWidth) {
  /* Cache */
  val cache: Cache =
      if(numCacheWays > 0 && cacheSizeBytes > 0) {
          Module(new RRCache(reqAddrWidth, reqIdWidth, reqDataWidth, memDataWidth, numCacheWays, cacheSizeBytes, cacheSizeReductionWidth))
      } else {
          Module(new DummyCache(reqAddrWidth, reqIdWidth, reqDataWidth, memDataWidth, cacheSizeReductionWidth))
      }
  val reqCacheLineTagWidth = tagWidth
  val reqBurstTagWidth = tagWidth - burstOffsetWidth
  cache.io.inReq <> io.inReq.addr
  cache.io.log2SizeReduction := io.log2CacheSizeReduction
  cache.io.invalidate := io.invalidate
  cache.io.enabled := io.enableCache

  val totalNumMSHR = numHashTables * numMSHRPerHashTable
  val mshrManager = Module(new CuckooMSHRVariableLength(addrWidth=reqAddrWidth, numMSHRPerHashTable,
    numHashTables, idWidth=reqIdWidth, memDataWidth, burstOffsetWidth,
    dataBufferAddrWidth, reqDataWidth, subentriesAddrWidth,
    mshrAssocMemorySize, sameHashFunction, reqStashSize=16,
    getFullBurstOnFailedBurstUpdate))

  mshrManager.io.allocIn <> cache.io.outMisses
  mshrManager.io.alwaysGetFullBurst := io.alwaysGetFullBurst
  // HelperFunctions.gatedConnect(mshrManager.io.allocIn, cache.io.outMisses)
  // mshrManager.io.allocIn.bits.addr := Cat(cache.io.outMisses.bits.addr(reqAddrWidth-1, offsetWidth), cache.io.outMisses.bits.addr(offsetWidth-1, 0))
  // mshrManager.io.allocIn.bits.id := cache.io.outMisses.bits.id

  val dataBuffer = Module(new DataBuffer(reqAddrWidth, reqDataWidth, memDataWidth, burstOffsetWidth, dataBufferAddrWidth))
  val inMemRespEb = ElasticBuffer(io.inMemResp)
  // FileLogger("inMemResp.txt", clock, io.inMemResp.fire(), io.inMemResp.bits.addr)
  val inMemRespEagerFork = Module(new EagerFork(new AddrDataLastIO(reqCacheLineTagWidth, memDataWidth), 2))
  HelperFunctions.gatedConnect(inMemRespEagerFork.io.in, inMemRespEb)
  inMemRespEagerFork.io.in.bits := inMemRespEb.bits
  // inMemRespEagerFork.io.in.bits.addr := Cat(inMemRespEb.bits.addr, 0.U(offsetWidth.W))
  // inMemRespEagerFork.io.in.bits.data := inMemRespEb.bits.data
  // inMemRespEagerFork.io.in.bits.isLast := inMemRespEb.bits.isLast
  // inMemRespEagerFork.io.in.bits.data := inMemRespEb.bits.data
  dataBuffer.io.inData <> inMemRespEagerFork.io.out(0)
  HelperFunctions.gatedConnect(cache.io.inData, inMemRespEagerFork.io.out(1))
  cache.io.inData.bits connectAllExisting inMemRespEagerFork.io.out(1).bits
  cache.io.inData.bits.addr := Cat(inMemRespEagerFork.io.out(1).bits.addr, 0.U((reqAddrWidth-inMemRespEagerFork.io.out(1).bits.addr.getWidth).W))
  dataBuffer.io.outDealloc <> mshrManager.io.deallocIn
  // cache.io.inData.bits.addr := Cat(inMemRespEagerFork.io.out(1).bits.addr(reqAddrWidth-1, offsetWidth), inMemRespEagerFork.io.out(1).bits.addr(offsetWidth-1, 0))
  // cache.io.inData.bits.data := inMemRespEagerFork.io.out(1).bits.data
  // cache.io.inData.valid := inMemRespEagerFork.io.out(1).valid
  // inMemRespEagerFork.io.out(1).ready := cache.io.inData.ready


  // mshrManager.io.outMem <> io.outMemReq
  mshrManager.io.outMem <> io.outMemReq
  /* SubentryBuffer */
  val subentryBuffer = Module(new SubentryBuffer(reqIdWidth, burstOffsetWidth, memDataWidth,
    reqDataWidth, subentriesAddrWidth, dataBufferAddrWidth, numSubentriesPerRow, MSHR.pipelineLatency,
    nextPtrCacheSize, blockOnNextPtr))
  subentryBuffer.io.in <> mshrManager.io.outLdBuf
  subentryBuffer.io.frqOut <> mshrManager.io.frqIn
  mshrManager.io.stopAllocFromLdBuf := subentryBuffer.io.stopAlloc

  /* ResponseGenerator */
  val responseGenerator = Module(new ResponseGenerator(reqIdWidth, dataBufferAddrWidth, burstOffsetWidth, memDataWidth, reqDataWidth, numSubentriesPerRow))
  responseGenerator.io.inReq <> subentryBuffer.io.respGenOut
  responseGenerator.io.outDataBufferReq <> dataBuffer.io.inReq
  responseGenerator.io.inMemData <> dataBuffer.io.outData_2
  dataBuffer.io.inDataPipelineEnable := responseGenerator.io.outDataBufferPipelineEnable
  responseGenerator.io.outDataBufferDeallocRows <> dataBuffer.io.inDeallocRows

  /* Returned data */
  val returnedDataArbiter = Module(new ResettableRRArbiter(new DataIdIO(reqDataWidth, reqIdWidth), 2))
  returnedDataArbiter.io.in(0) <> cache.io.outData
  returnedDataArbiter.io.in(1) <> responseGenerator.io.outReqData
  returnedDataArbiter.io.out <> io.inReq.data

  /* Profiling */
  if (Profiling.enable) {
      val subModulesProfilingInterfaces = Array(cache.io.axiProfiling, mshrManager.io.axiProfiling, subentryBuffer.io.axiProfiling, responseGenerator.io.axiProfiling)
      require(Profiling.subModuleAddrWidth >= log2Ceil(subModulesProfilingInterfaces.length))
      val profilingAddrDecoupledIO = Wire(DecoupledIO(UInt((Profiling.regAddrWidth + Profiling.subModuleAddrWidth).W)))
      profilingAddrDecoupledIO.bits := io.axiProfiling.axi.ARADDR
      profilingAddrDecoupledIO.valid := io.axiProfiling.axi.ARVALID
      io.axiProfiling.axi.ARREADY := profilingAddrDecoupledIO.ready
      val profilingSelector = ProfilingSelector(profilingAddrDecoupledIO, subModulesProfilingInterfaces, io.axiProfiling.clear, io.axiProfiling.snapshot)
      io.axiProfiling.axi.RDATA := profilingSelector.bits
      io.axiProfiling.axi.RVALID := profilingSelector.valid
      profilingSelector.ready := io.axiProfiling.axi.RREADY
      io.axiProfiling.axi.RRESP := 0.U
  } else {
      io.axiProfiling.axi.ARREADY := false.B
      io.axiProfiling.axi.RVALID := false.B
      io.axiProfiling.axi.RDATA := DontCare
      io.axiProfiling.axi.RRESP := DontCare
  }
}

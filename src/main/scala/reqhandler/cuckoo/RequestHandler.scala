package fpgamshr.reqhandler.cuckoo

import chisel3._
import fpgamshr.interfaces._
import fpgamshr.util._
import chisel3.util._
import fpgamshr.profiling._
import fpgamshr.reqhandler.ResponseGeneratorOneOutputArbitraryEntriesPerRow
import fpgamshr.reqhandler.{RequestHandlerBase, RequestHandler}

class RequestHandlerCuckoo(reqAddrWidth: Int, reqDataWidth: Int, reqIdWidth: Int,
   memDataWidth: Int, numHashTables: Int, numMSHRPerHashTable: Int,
   mshrAssocMemorySize: Int, numSubentriesPerRow: Int, subentriesAddrWidth: Int,
   numCacheWays: Int, cacheSizeBytes: Int, cacheSizeReductionWidth: Int,
   numMSHRWidth: Int, nextPtrCacheSize: Int, blockOnNextPtr: Boolean,
   sameHashFunction: Boolean) extends RequestHandlerBase(reqAddrWidth, 0, reqDataWidth, reqIdWidth, memDataWidth, cacheSizeReductionWidth, numMSHRWidth) {
  /* Cache */
  val cache: Cache =
      if(numCacheWays > 0 && cacheSizeBytes > 0) {
          Module(new RRCache(reqAddrWidth, reqIdWidth, reqDataWidth, memDataWidth, numCacheWays, cacheSizeBytes, cacheSizeReductionWidth))
      } else {
          Module(new DummyCache(reqAddrWidth, reqIdWidth, reqDataWidth, memDataWidth, cacheSizeReductionWidth))
      }

  cache.io.inReq <> io.inReq.addr
  cache.io.log2SizeReduction := io.log2CacheSizeReduction
  cache.io.invalidate := io.invalidate
  cache.io.enabled := io.enableCache

  val totalNumMSHR = numHashTables * numMSHRPerHashTable
  // mshrAlmostFullMargin can now be redefined at runtime via axiProfiling interface
  // val mshrAlmostFullMargin = (totalNumMSHR * RequestHandler.mshrAlmostFullRelMargin).toInt
  val mshrManager = Module(new CuckooMSHR(reqAddrWidth, numMSHRPerHashTable, numHashTables,reqIdWidth, memDataWidth, reqDataWidth, subentriesAddrWidth, 0, mshrAssocMemorySize, sameHashFunction))

  mshrManager.io.allocIn <> cache.io.outMisses
  mshrManager.io.allocIn.bits.addr := Cat(cache.io.outMisses.bits.addr(reqAddrWidth-1, offsetWidth), cache.io.outMisses.bits.addr(offsetWidth-1, 0))
  mshrManager.io.allocIn.bits.id := cache.io.outMisses.bits.id
  mshrManager.io.allocIn.valid := cache.io.outMisses.valid
  cache.io.outMisses.ready := mshrManager.io.allocIn.ready
  val inMemRespEagerFork = Module(new EagerFork(new AddrDataIO(reqAddrWidth, memDataWidth), 2))
  val inMemRespEb = ElasticBuffer(io.inMemResp)

  inMemRespEagerFork.io.in.bits.data := inMemRespEb.bits.data
  inMemRespEagerFork.io.in.bits.addr := Cat(inMemRespEb.bits.addr, 0.U(offsetWidth.W))
  inMemRespEagerFork.io.in.valid := inMemRespEb.valid
  inMemRespEb.ready := inMemRespEagerFork.io.in.ready
  mshrManager.io.deallocIn <> inMemRespEagerFork.io.out(0)
  cache.io.inData.bits.addr := Cat(inMemRespEagerFork.io.out(1).bits.addr(reqAddrWidth-1, offsetWidth), inMemRespEagerFork.io.out(1).bits.addr(offsetWidth-1, 0))
  cache.io.inData.bits.data := inMemRespEagerFork.io.out(1).bits.data
  cache.io.inData.valid := inMemRespEagerFork.io.out(1).valid
  inMemRespEagerFork.io.out(1).ready := cache.io.inData.ready

  // mshrManager.io.outMem <> io.outMemReq
  HelperFunctions.gatedConnect(io.outMemReq, mshrManager.io.outMem)
  io.outMemReq.bits.tag := mshrManager.io.outMem.bits
  io.outMemReq.bits.minBurstOffset := 0.U
  io.outMemReq.bits.maxBurstOffset := 0.U

  /* SubentryBuffer */
  val subentryBuffer = Module(new SubentryBuffer(reqIdWidth, memDataWidth, reqDataWidth, subentriesAddrWidth, numSubentriesPerRow, MSHR.pipelineLatency, nextPtrCacheSize, blockOnNextPtr))
  subentryBuffer.io.in <> mshrManager.io.outLdBuf
  subentryBuffer.io.frqOut <> mshrManager.io.frqIn
  mshrManager.io.stopAllocFromLdBuf := subentryBuffer.io.stopAlloc

  /* ResponseGenerator */
  // val responseGenerator = Module(new ResponseGenerator(reqIdWidth, memDataWidth, reqDataWidth, numSubentriesPerRow, RequestHandler.responseGeneratorPorts))
  val responseGenerator = Module(new ResponseGeneratorOneOutputArbitraryEntriesPerRow(reqIdWidth, memDataWidth, reqDataWidth, numSubentriesPerRow))
  responseGenerator.io.in <> subentryBuffer.io.respGenOut

  /* Returned data */
  val returnedDataArbiter = Module(new ResettableRRArbiter(new DataIdIO(reqDataWidth, reqIdWidth), 2))
  returnedDataArbiter.io.in(0) <> cache.io.outData
  returnedDataArbiter.io.in(1) <> responseGenerator.io.out
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

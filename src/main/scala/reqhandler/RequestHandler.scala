package fpgamshr.reqhandler

import chisel3._
import fpgamshr.interfaces._
import fpgamshr.util._
import chisel3.util._
import fpgamshr.profiling._

/* Test configurations:
 - trigger MSHRAlmostFull:
 val numLevelComparators = 2
 val numSplPerLevelComparator = 3
 val numMSHRPerRow = numSplPerLevelComparator
 val numLdBufPerRow = 4
 val mshrAlmostFullRelMargin = 0.5
 p_change = 0.5
 previous_tag_window_width = 20
 - trigger stopAlloc:
 val numLevelComparators = 2
 val numSplPerLevelComparator = 3
 val numMSHRPerRow = numSplPerLevelComparator
 val numLdBufPerRow = 4
 val ldBufAddrWidth = 5
 p_change = 0.1
 previous_tag_window_width = 10
 - cache:
 p_change = 0.05
 previous_tag_window_width = 10
 MIN_MEM_LATENCY = 1
 MAX_MEM_LATENCY = 1
 */

object RequestHandler {
    val reqAddrWidth = 28   /* Excluding the part that is always 0, i.e. the log2Ceil(reqDataWidth) least significant bits, and the req handler address (log2Ceil(numReqHandlers)) */
    val reqDataWidth = 32
    val reqIdWidth = 22     /* Original ID width + input port address (log2Ceil(numInputPorts)) */
    val memDataWidth = 512

    val numHashTables = 4
    val numMSHRPerHashTable = 128
    val mshrAssocMemorySize = 6

    val numMSHRWidth = log2Ceil(numHashTables * numMSHRPerHashTable)

    val numSubentriesPerRow = 4
    val subentriesAddrWidth = 11
    val numCacheWays = 4
    val cacheSizeBytes = 4096
    val cacheSizeReductionWidth = 2
    val nextPtrCacheSize = 8

    /* Set to >= 0.5 to actually trigger MSHRAlmostFullMargin (for testing, for example) */
    val mshrAlmostFullRelMargin = 0.0 /* As fraction of total number of MSHRs */
    // val branchAddrWidth = numLevelComparators * log2Ceil(numSplPerLevelComparator + 1)
    val responseGeneratorPorts = 1 /* More ports are supported by the responseGenerator but not by the RequestHandler */
}

class RequestHandlerBase(reqAddrWidth: Int=RequestHandler.reqAddrWidth, burstOffsetWidth: Int=0, reqDataWidth: Int=RequestHandler.reqDataWidth, reqIdWidth: Int=RequestHandler.reqIdWidth, memDataWidth: Int=RequestHandler.memDataWidth, cacheSizeReductionWidth: Int=RequestHandler.cacheSizeReductionWidth, numMSHRWidth: Int=0) extends Module {
    require(isPow2(memDataWidth / reqDataWidth))
    require(RequestHandler.responseGeneratorPorts == 1)
    val offsetWidth = log2Ceil(memDataWidth / reqDataWidth)
    val tagWidth = reqAddrWidth - offsetWidth
    val io = IO(new RequestHandlerIO(reqAddrWidth, tagWidth, burstOffsetWidth, reqDataWidth, reqIdWidth, memDataWidth, cacheSizeReductionWidth, numMSHRWidth))
}

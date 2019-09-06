package fpgamshr.interfaces

import chisel3._
import chisel3.util._
import fpgamshr.profiling._
import fpgamshr.reqhandler.cuckoo.{CuckooMSHR}

class RequestHandlerIO(addrWidth: Int, tagWidth: Int, burstOffsetWidth: Int, reqDataWidth: Int, idWidth: Int, memDataWidth: Int, cacheSizeReductionWidth: Int, numMSHRWidth: Int) extends Bundle {
    val inReq = new DecAddrIdDecDataIdIO(addrWidth, reqDataWidth, idWidth)
    val outMemReq = DecoupledIO(new MSHRExtMemType(tagWidth - burstOffsetWidth, burstOffsetWidth))
    val inMemResp = DecoupledIO(new AddrDataLastIO(tagWidth, memDataWidth)).flip
    val invalidate = Input(Bool()) /* Trigger cache invalidation */
    val log2CacheSizeReduction = Input(UInt(cacheSizeReductionWidth.W))
    val enableCache = Input(Bool())
    val alwaysGetFullBurst = Input(Bool())
    val axiProfiling = new AXI4LiteReadOnlyProfiling(Profiling.dataWidth, Profiling.regAddrWidth + Profiling.subModuleAddrWidth)
}

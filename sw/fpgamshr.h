/*
 * fpgamshr.h
 *
 *  Created on: Jul 5, 2018
 *      Author: asiatici
 */

#ifndef FPGAMSHR_H_
#define FPGAMSHR_H_

#include <limits.h>
#include "math.h"
#include "params.h"

#define VARIABLE_LENGTH (BURST_LENGTH_WIDTH > 0)
#define MEMORY_SPAN (1 << ADDR_BITS)
#define CACHE_SIZE_REDUCTION_VALUES (1 << CACHE_SIZE_REDUCTION_WIDTH)
#define PRINT_MIX_MAX_AVG_STDEV 0

#if FPGAMSHR_EXISTS
#define FPGAMSHR_BASEADDR XPAR_FPGAMSHR_0_BASEADDR
#define FPGAMSHR_BASE_ADDR ((volatile u64*)(XPAR_FPGAMSHR_0_BASEADDR))
#define CACHE_RECV_REQS_OFFSET (0)
#define CACHE_HITS_OFFSET (1)
#define CACHE_CYCLES_OUT_MISSES_STALL_OFFSET (2)
#define CACHE_CYCLES_OUT_DATA_STALL_OFFSET (3)
#define CACHE_DOUBLE_HITS_OFFSET (4)
#define MSHR_CURRENTLY_USED_OFFSET (REGS_PER_REQ_HANDLER_MODULE)
#define MSHR_MAX_USED_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 1)
#define MSHR_COLLISION_TRIGGER_COUNT_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 2)
#define TRAD_MSHR_CYCLES_MSHR_FULL (REGS_PER_REQ_HANDLER_MODULE + 2)
#define MSHR_CYCLES_IN_COLLISION_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 3)
#define TRAD_MSHR_CYCLES_SE_BUF_FULL (REGS_PER_REQ_HANDLER_MODULE + 3)
#define MSHR_STALL_TRIGGER_COUNT_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 4)
#define MSHR_CYCLES_IN_STALL_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 5)
#define MSHR_ACCEPTED_ALLOCS_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 6)
#define MSHR_ACCEPTED_DEALLOCS_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 7)
#define MSHR_CYCLES_ALLOCS_STALLED_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 8)
#define MSHR_CYCLES_DEALLOCS_STALLED_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 9)
#define MSHR_ENQUEUED_MEM_REQS_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 10)
#define MSHR_CYCLES_OUT_SE_BUF_NOT_READY_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 11)
#define MSHR_ACCUM_USED_MSHR_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 12)
#define MSHR_CYCLES_STOP_ALLOC_FROM_SE_BUF_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 13)
#define MSHR_SUCCESSFUL_BURST_UPDATES_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 14)
#define MSHR_ACCUM_BURST_LEN_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 15)
#define MSHR_FAKE_DEALLOCS_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 16)
#define MSHR_EXPECTED_FAKE_DEALLOCS_OFFSET (REGS_PER_REQ_HANDLER_MODULE + 17)
#define SE_BUF_CURR_USED_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 0)
#define SE_BUF_MAX_USED_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 1)
#define SE_BUF_CURR_USED_ROWS_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 2)
#define SE_BUF_MAX_USED_ROWS_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 3)
#define SE_BUF_CURR_ROWS_WITH_NEXT_PTR_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 4)
#define SE_BUF_MAX_ROWS_WITH_NEXT_PTR_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 5)
#define SE_BUF_CYCLES_RESP_GEN_STALL_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 6)
#define SE_BUF_CYCLES_WRITE_PIPELINE_STALL_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 7)
#define SE_BUF_CYCLES_VALID_NEXT_PTR_STALL_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 8)
#define SE_BUF_NEXT_PTR_CACHE_HITS_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 9)
#define SE_BUF_NEXT_PTR_CACHE_MISSES_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 10)
#define SE_BUF_ACCUM_USED_ENTRIES_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 11)
#define SE_BUF_ACCUM_USED_ROWS_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 12)
#define SE_CYCLES_DEALLOC_ROB_STALL_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 13)
#define SE_FAKE_DEALLOCS_OFFSET (2*REGS_PER_REQ_HANDLER_MODULE + 14)
#define RESP_GEN_ACCEPTED_INPUTS_OFFSET (3*REGS_PER_REQ_HANDLER_MODULE)
#define RESP_GEN_RESP_SENT_OUT_OFFSET (3*REGS_PER_REQ_HANDLER_MODULE + 1)
#define RESP_GEN_CYCLES_OUT_NOT_READY_OFFSET (3*REGS_PER_REQ_HANDLER_MODULE + 2)
#define RESP_GEN_CYCLES_INTERNAL_STALL_OFFSET (3*REGS_PER_REQ_HANDLER_MODULE + 3)
#define RESP_GEN_FAKE_DEALLOCS_OFFSET (3*REGS_PER_REQ_HANDLER_MODULE + 4)
#define ROB_RECEIVED_REQS (0)
#define ROB_RECEIVED_RESP (1)
#define ROB_CURR_USED_ENTRIES (2)
#define ROB_MAX_USED_ENTRIES (3)
#define ROB_SENT_RESP (4)
#define ROB_CYCLES_FULL_STALLED (5)
#define ROB_CYCLES_REQS_IN_STALLED (6)
#define ROB_CYCLES_REQS_OUT_STALLED (7)
#define ROB_CYCLES_RESP_OUT_STALLED (8)
#define GET_REG_ADDR(x) (FPGAMSHR_BASE_ADDR + x)
#define CONTROL_REG_OFFSET (0)
#define CACHE_REDUCTION_OFFSET (8)
#endif

void FPGAMSHR_Clear_stats() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 1;
#endif
}

void FPGAMSHR_Profiling_snapshot() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 2;
#endif
}

void FPGAMSHR_Get_stats_pretty() {
#if FPGAMSHR_EXISTS
	// get snapshot
	FPGAMSHR_Profiling_snapshot();
	int i;
	for(i = 0; i < NUM_REQ_HANDLERS; i++) {
		printf("Bank %d\n\r", i);
		volatile u64 recv_reqs = *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + CACHE_RECV_REQS_OFFSET);
		volatile u64 hits = *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + CACHE_HITS_OFFSET);
		printf("Cache: received requests: %"PRIu64"\n\r", recv_reqs);
		printf("Cache: hits: %"PRIu64" (hit rate=%f)\n\r", hits, (float)hits/recv_reqs);
		printf("Cache: cyclesOutMissesStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + CACHE_CYCLES_OUT_MISSES_STALL_OFFSET));
		printf("Cache: cyclesOutDataStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + CACHE_CYCLES_OUT_DATA_STALL_OFFSET));
		printf("Cache: doubleHits: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + CACHE_DOUBLE_HITS_OFFSET));
#if MSHR_PER_HASH_TABLE > 0
		printf("MSHR: currentlyUsedMSHR: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CURRENTLY_USED_OFFSET));
		printf("MSHR: maxUsedMSHR: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_MAX_USED_OFFSET));
#if MSHR_HASH_TABLES > 0
		printf("MSHR: collisonTriggerCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_COLLISION_TRIGGER_COUNT_OFFSET));
		printf("MSHR: cyclesSpentHandlingCollisons: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_IN_COLLISION_OFFSET));
#else // MSHR_HASH_TABLES > 0
		printf("MSHR: cyclesMSHRFull: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + TRAD_MSHR_CYCLES_MSHR_FULL));
		printf("MSHR: cyclesLdBufFull: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + TRAD_MSHR_CYCLES_SE_BUF_FULL));
#endif // MSHR_HASH_TABLES > 0
		printf("MSHR: stallTriggerCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_STALL_TRIGGER_COUNT_OFFSET));
		printf("MSHR: cyclesSpentStalling: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_IN_STALL_OFFSET));
		printf("MSHR: acceptedAllocsCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_ACCEPTED_ALLOCS_OFFSET));
		printf("MSHR: acceptedDeallocsCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_ACCEPTED_DEALLOCS_OFFSET));
		printf("MSHR: cyclesAllocsStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_ALLOCS_STALLED_OFFSET));
		printf("MSHR: cyclesDeallocsStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_DEALLOCS_STALLED_OFFSET));
		printf("MSHR: enqueuedMemReqsCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_ENQUEUED_MEM_REQS_OFFSET));
		printf("MSHR: cyclesOutSeBufNotReady: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_OUT_SE_BUF_NOT_READY_OFFSET));
#if MSHR_HASH_TABLES > 0
		printf("MSHR: accumUsedMSHR: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_ACCUM_USED_MSHR_OFFSET));
		printf("MSHR: cyclesStallAllocFromLdBuf: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_CYCLES_STOP_ALLOC_FROM_SE_BUF_OFFSET));
#endif
#if VARIABLE_LENGTH
		printf("MSHR: successfulBurstUpdatesCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_SUCCESSFUL_BURST_UPDATES_OFFSET));
		printf("MSHR: accumBurstLen: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_ACCUM_BURST_LEN_OFFSET));
		printf("MSHR: fakeDeallocs: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_FAKE_DEALLOCS_OFFSET));
		printf("MSHR: expectedFakeDeallocs: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + MSHR_EXPECTED_FAKE_DEALLOCS_OFFSET));
#endif
		printf("Subentry buffer: snapshotUsedEntries: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CURR_USED_OFFSET));
		printf("Subentry buffer: maxUsedEntries: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_MAX_USED_OFFSET));
#if MSHR_HASH_TABLES > 0
		printf("Subentry buffer: currentlyUsedRows: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CURR_USED_ROWS_OFFSET));
		printf("Subentry buffer: maxUsedRows: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_MAX_USED_ROWS_OFFSET));
		printf("Subentry buffer: snapshotRowsWithNextRowPtrValid: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CURR_ROWS_WITH_NEXT_PTR_OFFSET));
		printf("Subentry buffer: maxRowsWithNextRowPtrValid: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_MAX_ROWS_WITH_NEXT_PTR_OFFSET));
#endif
		printf("Subentry buffer: cyclesRespGenStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CYCLES_RESP_GEN_STALL_OFFSET));
#if MSHR_HASH_TABLES > 0
		printf("Subentry buffer: cyclesWritePipelineStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CYCLES_WRITE_PIPELINE_STALL_OFFSET));
		printf("Subentry buffer: cyclesValidNextPtrInputStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_CYCLES_VALID_NEXT_PTR_STALL_OFFSET));
		printf("Subentry buffer: nextPtrCacheHits: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_NEXT_PTR_CACHE_HITS_OFFSET));
		printf("Subentry buffer: nextPtrCacheMisses: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_NEXT_PTR_CACHE_MISSES_OFFSET));
		printf("Subentry buffer: accumUsedEntries: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_ACCUM_USED_ENTRIES_OFFSET));
		printf("Subentry buffer: accumUsedRows: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_BUF_ACCUM_USED_ROWS_OFFSET));
#endif
#if VARIABLE_LENGTH
		printf("Subentry buffer: cyclesStallDeallocReorderBuffer: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_CYCLES_DEALLOC_ROB_STALL_OFFSET));
		printf("Subentry buffer: fakeDeallocs: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + SE_FAKE_DEALLOCS_OFFSET));
#endif
		printf("RespGen: acceptedInputsCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + RESP_GEN_ACCEPTED_INPUTS_OFFSET));
		printf("RespGen: responsesSentOutCount: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + RESP_GEN_RESP_SENT_OUT_OFFSET));
		printf("RespGen: cyclesOutNotReady: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + RESP_GEN_CYCLES_OUT_NOT_READY_OFFSET));
#if VARIABLE_LENGTH
		printf("RespGen: cyclesInternalStall: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + RESP_GEN_CYCLES_INTERNAL_STALL_OFFSET));
		printf("RespGen: fakeDeallocs: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + i*REGS_PER_REQ_HANDLER + RESP_GEN_FAKE_DEALLOCS_OFFSET));
		printf("DataBuffer: cyclesInDataNotReady: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_INPUTS + NUM_REQ_HANDLERS)*REGS_PER_REQ_HANDLER + 1 + NUM_MEM_PORTS + i));
#endif
#endif // MSHR_PER_HASH_TABLE > 0
	}
	for(i = 0; i < NUM_INPUTS; i++) {
		printf("Input %d\n\r", i);
		printf("ROB: receivedRequests: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_RECEIVED_REQS));
		printf("ROB: receivedResponses: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_RECEIVED_RESP));
		printf("ROB: currentlyUsedEntries: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_CURR_USED_ENTRIES));
		printf("ROB: maxUsedEntries: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_MAX_USED_ENTRIES));
		printf("ROB: sentResponses: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_SENT_RESP));
		printf("ROB: cyclesFullStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_CYCLES_FULL_STALLED));
		printf("ROB: cyclesReqsInStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_CYCLES_REQS_IN_STALLED));
		printf("ROB: cyclesReqsOutStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_CYCLES_REQS_OUT_STALLED));
		printf("ROB: cyclesRespOutStalled: %"PRIu64"\n\r", *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + i)*REGS_PER_REQ_HANDLER + ROB_CYCLES_RESP_OUT_STALLED));
	}
	volatile u64 cycles = *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_INPUTS + NUM_REQ_HANDLERS)*REGS_PER_REQ_HANDLER);
	printf("Total cycles: %"PRIu64"\n\r", cycles);
	for(i = 0; i < NUM_MEM_PORTS; i++) {
		printf("extMem%d not ready: %"PRIu64"\n\r", i, *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_INPUTS + NUM_REQ_HANDLERS)*REGS_PER_REQ_HANDLER + 1 + i));
	}
#endif
}

#define MIN_MAX_AVG_STDEV(x) "" #x "_Min " #x "_Max " #x "_Avg " #x "_Stdev"
#if PRINT_MIX_MAX_AVG_STDEV
#define MODIFIER(x)			 MIN_MAX_AVG_STDEV(#x)
#else
#define MODIFIER(x)			 #x
#endif


u64 FPGAMSHR_Get_extMemCyclesNotReady(int portIndex) {
#if FPGAMSHR_EXISTS
	return *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + NUM_INPUTS)*REGS_PER_REQ_HANDLER + 1 + portIndex);
#endif
}

u64 FPGAMSHR_Get_extMemCyclesIdle() {
#if FPGAMSHR_EXISTS
	return *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + NUM_INPUTS)*REGS_PER_REQ_HANDLER + 2);
#endif
}

u64 FPGAMSHR_Get_totalCycles() {
#if FPGAMSHR_EXISTS
	return *((volatile u64*)(FPGAMSHR_BASEADDR) + (NUM_REQ_HANDLERS + NUM_INPUTS)*REGS_PER_REQ_HANDLER);
#endif
}

void FPGAMSHR_Get_stats_header() {
	for(int i = 0; i < NUM_MEM_PORTS; i++)
		xil_printf("extMem%dNotReady ", i);
    xil_printf(MODIFIER(Cache_received) " ");
		xil_printf(MODIFIER(Cache_hits) " ");
    xil_printf(MODIFIER(Cache_cyclesOutMissesStall) " ");
    xil_printf(MODIFIER(Cache_cyclesOutDataStall) " ");
    xil_printf(MODIFIER(Cache_doubleHits) " ");
#if MSHR_PER_HASH_TABLE > 0
	xil_printf(MODIFIER(MSHR_maxUsedMSHR) " ");
#if MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(MSHR_collisonTriggerCount) " ");
	xil_printf(MODIFIER(MSHR_cyclesSpentHandlingCollisons) " ");
#else // MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(MSHR_cyclesMSHRFull) " ");
	xil_printf(MODIFIER(MSHR_cyclesLdBufFull) " ");
#endif // MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(MSHR_stallTriggerCount) " ");
	xil_printf(MODIFIER(MSHR_cyclesSpentStalling) " ");
	xil_printf(MODIFIER(MSHR_acceptedAllocsCount) " ");
	xil_printf(MODIFIER(MSHR_acceptedDeallocsCount) " ");
	xil_printf(MODIFIER(MSHR_cyclesAllocsStalled) " ");
	xil_printf(MODIFIER(MSHR_cyclesDeallocsStalled) " ");
	xil_printf(MODIFIER(MSHR_enqueuedMemReqsCount) " ");
	xil_printf(MODIFIER(MSHR_cyclesOutSeBufNotReady) " ");
#if MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(MSHR_accumUsedMSHR) " ");
	xil_printf(MODIFIER(MSHR_cyclesStallAllocFromLdBuf) " ");
#endif
#if VARIABLE_LENGTH
	xil_printf(MODIFIER(MSHR_successfulBurstUpdatesCount) " ");
	xil_printf(MODIFIER(MSHR_accumBurstLen) " ");
	xil_printf(MODIFIER(MSHR_fakeDeallocs) " ");
#endif
	xil_printf(MODIFIER(SEBuf_maxUsedEntries) " ");
#if MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(SEBuf_maxUsedRows) " ");
	xil_printf(MODIFIER(SEBuf_maxRowsWithNextRowPtrValid) " ");
#endif
	xil_printf(MODIFIER(SEBuf_cyclesRespGenStall) " ");
#if MSHR_HASH_TABLES > 0
	xil_printf(MODIFIER(SEBuf_cyclesWritePipelineStall) " ");
	xil_printf(MODIFIER(SEBuf_cyclesValidNextPtrInputStall) " ");
	xil_printf(MODIFIER(SEBuf_nextPtrCacheHits) " ");
	xil_printf(MODIFIER(SEBuf_nextPtrCacheMisses) " ");
	xil_printf(MODIFIER(SEBuf_accumUsedEntries) " ");
	xil_printf(MODIFIER(SEBuf_accumUsedRows) " ");
#endif
#if VARIABLE_LENGTH
	xil_printf(MODIFIER(SEBuf_cyclesStallDeallocReorderBuffer) " ");
#endif
	xil_printf(MODIFIER(RespGen_acceptedInputsCount) " ");
	xil_printf(MODIFIER(RespGen_responsesSentOutCount) " ");
	xil_printf(MODIFIER(RespGen_cyclesOutNotReady) " ");

	xil_printf(MODIFIER(ROB_maxUsedEntries) " ");
	xil_printf(MODIFIER(ROB_cyclesFullStalled) " ");
	xil_printf(MODIFIER(ROB_cyclesReqsInStalled) " ");
	xil_printf(MODIFIER(ROB_cyclesReqsOutStalled) " ");
	xil_printf(MODIFIER(ROB_cyclesRespOutStalled) " ");
#endif // MSHR_PER_HASH_TABLE > 0
}

void print_min_max_avg_stdev(volatile u64* regOffset) {
//	u64 min = ULLONG_MAX, max = 0;
//	double mean = 0, M2 = 0, variance = 0;
//	int i;
//	for(i = 0; i < NUM_REQ_HANDLERS; i++) {
//		u64 val = *(regOffset + i*REGS_PER_REQ_HANDLER);
//		if(val < min)
//			min = val;
//		if(val > max)
//			max = val;
//		double delta = val - mean;
//		mean += delta / (i + 1);
//		M2 += delta * (val - mean);
//		variance = M2 / (i + 1);
//	}
//	double stdev = sqrt(variance);
//	printf("%"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64" ", min, max, (u64)mean, (u64)stdev);
}

void print_profiling_reg(volatile u64* regOffset, int printMinMaxAvgStdev) {
	if(printMinMaxAvgStdev)
		print_min_max_avg_stdev(regOffset);
	else {
		double mean = 0;
		for(int i = 0; i < NUM_REQ_HANDLERS; i++) {
			u64 val = *(regOffset + i*REGS_PER_REQ_HANDLER);
			double delta = val - mean;
			mean += delta / (i + 1);
		}
		printf("%"PRIu64" ", (u64)mean);
	}
}

void print_rob_min_max_avg_stdev(volatile u64* regOffset) {
//	u64 min = ULLONG_MAX, max = 0;
//	double mean = 0, M2 = 0, variance = 0;
//	int i;
//	for(int i = 0; i < NUM_INPUTS; i++) {
//		u64 val = *(regOffset + (NUM_REQ_HANDLERS+i)*REGS_PER_REQ_HANDLER);
//		if(val < min)
//			min = val;
//		if(val > max)
//			max = val;
//		double delta = val - mean;
//		mean += delta / (i + 1);
//		M2 += delta * (val - mean);
//		variance = M2 / (i + 1);
//	}
//	double stdev = sqrt(variance);
//	printf("%"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64" ", min, max, (u64)mean, (u64)stdev);
}

void print_rob_profiling_reg(volatile u64* regOffset, int printMinMaxAvgStdev) {
	if(printMinMaxAvgStdev)
		print_rob_min_max_avg_stdev(regOffset);
	else {
		double mean = 0;
		for(int i = 0; i < NUM_INPUTS; i++) {
			u64 val = *(regOffset + (NUM_REQ_HANDLERS+i)*REGS_PER_REQ_HANDLER);
			double delta = val - mean;
			mean += delta / (i + 1);
		}
		printf("%"PRIu64" ", (u64)mean);
	}
}

void FPGAMSHR_Get_stats_row() {
#if FPGAMSHR_EXISTS
	FPGAMSHR_Profiling_snapshot();
	for(int i = 0; i < NUM_MEM_PORTS; i++)
		printf("%"PRIu64" ", FPGAMSHR_Get_extMemCyclesNotReady(i));
	print_profiling_reg(GET_REG_ADDR(CACHE_RECV_REQS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(CACHE_HITS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(CACHE_CYCLES_OUT_MISSES_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(CACHE_CYCLES_OUT_DATA_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(CACHE_DOUBLE_HITS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	#if MSHR_PER_HASH_TABLE > 0
	print_profiling_reg(GET_REG_ADDR(MSHR_MAX_USED_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	#if MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(MSHR_COLLISION_TRIGGER_COUNT_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_IN_COLLISION_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	#else // MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(TRAD_MSHR_CYCLES_MSHR_FULL), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(TRAD_MSHR_CYCLES_SE_BUF_FULL), PRINT_MIX_MAX_AVG_STDEV);
	#endif // MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(MSHR_STALL_TRIGGER_COUNT_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_IN_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_ACCEPTED_ALLOCS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_ACCEPTED_DEALLOCS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_ALLOCS_STALLED_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_DEALLOCS_STALLED_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_ENQUEUED_MEM_REQS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_OUT_SE_BUF_NOT_READY_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#if MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(MSHR_ACCUM_USED_MSHR_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_CYCLES_STOP_ALLOC_FROM_SE_BUF_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#endif
#if VARIABLE_LENGTH
	print_profiling_reg(GET_REG_ADDR(MSHR_SUCCESSFUL_BURST_UPDATES_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_ACCUM_BURST_LEN_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(MSHR_FAKE_DEALLOCS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#endif
	print_profiling_reg(GET_REG_ADDR(SE_BUF_MAX_USED_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#if MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(SE_BUF_MAX_USED_ROWS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_MAX_ROWS_WITH_NEXT_PTR_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#endif
	print_profiling_reg(GET_REG_ADDR(SE_BUF_CYCLES_RESP_GEN_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#if MSHR_HASH_TABLES > 0
	print_profiling_reg(GET_REG_ADDR(SE_BUF_CYCLES_WRITE_PIPELINE_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_CYCLES_VALID_NEXT_PTR_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_NEXT_PTR_CACHE_HITS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_NEXT_PTR_CACHE_MISSES_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_ACCUM_USED_ENTRIES_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(SE_BUF_ACCUM_USED_ROWS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#endif
#if VARIABLE_LENGTH
	print_profiling_reg(GET_REG_ADDR(SE_CYCLES_DEALLOC_ROB_STALL_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
#endif
	print_profiling_reg(GET_REG_ADDR(RESP_GEN_ACCEPTED_INPUTS_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(RESP_GEN_RESP_SENT_OUT_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_profiling_reg(GET_REG_ADDR(RESP_GEN_CYCLES_OUT_NOT_READY_OFFSET), PRINT_MIX_MAX_AVG_STDEV);
	print_rob_profiling_reg(GET_REG_ADDR(ROB_MAX_USED_ENTRIES), PRINT_MIX_MAX_AVG_STDEV);
	print_rob_profiling_reg(GET_REG_ADDR(ROB_CYCLES_FULL_STALLED), PRINT_MIX_MAX_AVG_STDEV);
	print_rob_profiling_reg(GET_REG_ADDR(ROB_CYCLES_REQS_IN_STALLED), PRINT_MIX_MAX_AVG_STDEV);
	print_rob_profiling_reg(GET_REG_ADDR(ROB_CYCLES_REQS_OUT_STALLED), PRINT_MIX_MAX_AVG_STDEV);
	print_rob_profiling_reg(GET_REG_ADDR(ROB_CYCLES_RESP_OUT_STALLED), PRINT_MIX_MAX_AVG_STDEV);
#endif // MSHR_PER_HASH_TABLE > 0
	fflush(stdout);
#endif
}

void FPGAMSHR_Invalidate_cache() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 4;
#endif
}

void FPGAMSHR_Disable_cache() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 16;
#endif
}

void FPGAMSHR_Enable_cache() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 8;
#endif
}

void FPGAMSHR_Enable_AlwaysGetFullBurst() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 32;
#endif
}

void FPGAMSHR_Disable_AlwaysGetFullBurst() {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CONTROL_REG_OFFSET) = 64;
#endif
}

void FPGAMSHR_SetCacheDivider(u32 div) {
#if FPGAMSHR_EXISTS
	*(volatile u32*)(FPGAMSHR_BASEADDR + CACHE_REDUCTION_OFFSET) = div;
#endif
}

#endif /* FPGAMSHR_H_ */

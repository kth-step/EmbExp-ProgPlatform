
.globl _cache_run

.section .experiment_code_sec

scamv_entry:
.include "experiment/cache_run_input.h"
	ret


.section .text

scamv_setup1:
.include "experiment/cache_run_input_setup1.h"
	ret

scamv_setup2:
.include "experiment/cache_run_input_setup2.h"
	ret


_cache_run:
	sub sp, sp, #(8 * 40)
	str x0,  [sp, #(8 *  0)] // cache1
	str x1,  [sp, #(8 *  1)] // cache2
	str x2,  [sp, #(8 *  2)]
	str x3,  [sp, #(8 *  3)]
	str x4,  [sp, #(8 *  4)]
	str x5,  [sp, #(8 *  5)]
	str x6,  [sp, #(8 *  6)]
	str x7,  [sp, #(8 *  7)]
	str x8,  [sp, #(8 *  8)]
	str x9,  [sp, #(8 *  9)]
	str x10, [sp, #(8 * 10)]
	str x11, [sp, #(8 * 11)]
	str x12, [sp, #(8 * 12)]
	str x13, [sp, #(8 * 13)]
	str x14, [sp, #(8 * 14)]
	str x15, [sp, #(8 * 15)]
	str x16, [sp, #(8 * 16)]
	str x17, [sp, #(8 * 17)]
	str x18, [sp, #(8 * 18)]
	str x19, [sp, #(8 * 19)]
	str x20, [sp, #(8 * 20)]
	str x21, [sp, #(8 * 21)]
	str x22, [sp, #(8 * 22)]
	str x23, [sp, #(8 * 23)]
	str x24, [sp, #(8 * 24)]
	str x25, [sp, #(8 * 25)]
	str x26, [sp, #(8 * 26)]
	str x27, [sp, #(8 * 27)]
	str x28, [sp, #(8 * 28)]
	str x29, [sp, #(8 * 29)] // FP
	str x30, [sp, #(8 * 30)] // LR

// flush the cache
	//flush_d_cache(0);
	mov x0, #0
	bl flush_d_cache
	//flush_d_cache(1);
	mov x0, #1
	bl flush_d_cache

// run the experiment code - run#1
	bl scamv_setup1
	bl scamv_entry

// save the cache state for run#1
	//save_cache_state(cache1);
	ldr x0,  [sp, #(8 *  0)]
	bl save_cache_state

/*
// debug the first cache set
	//debug_set(cache1[SET(0)]);
	ldr x0,  [sp, #(8 *  0)]
	bl debug_set
*/

// flush the cache
	//flush_d_cache(0);
	mov x0, #0
	bl flush_d_cache
	//flush_d_cache(1);
	mov x0, #1
	bl flush_d_cache

// run the experiment code - run#2
	bl scamv_setup2
	bl scamv_entry

// save the cache state for run#2
	//save_cache_state(cache1);
	ldr x0,  [sp, #(8 *  1)]
	bl save_cache_state


	ldr x0,  [sp, #(8 *  0)]
	ldr x1,  [sp, #(8 *  1)]
	ldr x2,  [sp, #(8 *  2)]
	ldr x3,  [sp, #(8 *  3)]
	ldr x4,  [sp, #(8 *  4)]
	ldr x5,  [sp, #(8 *  5)]
	ldr x6,  [sp, #(8 *  6)]
	ldr x7,  [sp, #(8 *  7)]
	ldr x8,  [sp, #(8 *  8)]
	ldr x9,  [sp, #(8 *  9)]
	ldr x10, [sp, #(8 * 10)]
	ldr x11, [sp, #(8 * 11)]
	ldr x12, [sp, #(8 * 12)]
	ldr x13, [sp, #(8 * 13)]
	ldr x14, [sp, #(8 * 14)]
	ldr x15, [sp, #(8 * 15)]
	ldr x16, [sp, #(8 * 16)]
	ldr x17, [sp, #(8 * 17)]
	ldr x18, [sp, #(8 * 18)]
	ldr x19, [sp, #(8 * 19)]
	ldr x20, [sp, #(8 * 20)]
	ldr x21, [sp, #(8 * 21)]
	ldr x22, [sp, #(8 * 22)]
	ldr x23, [sp, #(8 * 23)]
	ldr x24, [sp, #(8 * 24)]
	ldr x25, [sp, #(8 * 25)]
	ldr x26, [sp, #(8 * 26)]
	ldr x27, [sp, #(8 * 27)]
	ldr x28, [sp, #(8 * 28)]
	ldr x29, [sp, #(8 * 29)]
	ldr x30, [sp, #(8 * 30)]
	add sp, sp, #(8 * 40)

	ret



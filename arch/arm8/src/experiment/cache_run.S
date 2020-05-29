#include "config.h"

#ifdef RUN_CACHE

.globl _cache_run
.globl _scamv_run1
.globl _scamv_run2
.globl _scamv_train_bp

.section .experiment_code
scamv_entry:
.include "experiment/asm.h"
	b scamv_exit


.section .data
.align 3
_sp_store:
	.quad 0
.align 3
_scamv_ret_store:
	.quad 0


.section .text

_scamv_run1:
	ldr x0, =_scamv_ret_store
	str x30, [x0]
	mov x0,  #0
	mov x30, #0
.include "experiment/asm_setup1.h"
	dsb sy
	isb
	b scamv_entry

_scamv_run2:
	ldr x0, =_scamv_ret_store
	str x30, [x0]
	mov x0,  #0
	mov x30, #0
.include "experiment/asm_setup2.h"
	dsb sy
	isb
	b scamv_entry

scamv_exit:
	dsb sy
	isb
	ldr x0, =_scamv_ret_store
	ldr x30, [x0]
	ret
	
// Program flow prediction is always enabled and no programming is required to
// take advantage of program flow prediction. Moreover, AArch64 state does not
// implement BTB flush instructions. If the invalidation is required one has to 
// turn the MMU off, turn it back on.
// Cortex-a72 reference manual sections:
//   --"Enabling program flow prediction"
//   -- "BTB invalidation and context switches"

_scamv_train_bp:	
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	mov x30, #0
// run experiment code in loop
// flush the cache
	//flush_d_cache(0);
	mov x0, #0
	bl flush_d_cache
	//flush_d_cache(1);
	mov x0, #1
	bl flush_d_cache
    //bl _clean_experiment_memory
    dsb sy
	isb

	str	wzr, [sp, 28]
	b	.L3
// load experiment data	
.L1:
.include "experiment/asm_train.h"
	dsb sy
	isb
//	bl _check_experiment_memory
.L2:
 .include "experiment/asm.h"
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L3:
	ldr	w0, [sp, 28]
// number of iterations	
	cmp	w0, 29
	ble	.L1
	dsb sy
	isb
	ldp	x29, x30, [sp], 32
	ret

_cache_run:
// save registers on stack
	sub sp, sp, #(8 * 40)
	str x0,  [sp, #(8 *  0)] // _scamv_run
	str x1,  [sp, #(8 *  1)] // cache
	str x29, [sp, #(8 * 2)]  // FP
	str x30, [sp, #(8 * 3)]  // LR

// store SP register
	ldr x0, =_sp_store
	mov x1, sp
	str x1, [x0]

// flush the cache
	//flush_d_cache(0);
	mov x0, #0
	bl flush_d_cache
	//flush_d_cache(1);
	mov x0, #1
	bl flush_d_cache

// move _scamv_run to x30 (LR)
	ldr x30, [sp, #(8 *  0)]

// run the experiment code
	blr x30
// restore SP register
	ldr x0, =_sp_store
	ldr x1, [x0]
	mov sp, x1
// save the cache state for run
	//save_cache_state(cache);
	ldr x0,  [sp, #(8 *  1)]
	bl save_cache_state

// save registers from stack
	ldr x0,  [sp, #(8 *  0)]
	ldr x1,  [sp, #(8 *  1)]
	ldr x29, [sp, #(8 * 2)]
	ldr x30, [sp, #(8 * 3)]
	add sp, sp, #(8 * 40)

	ret


#endif // RUN_CACHE


// Program flow prediction is always enabled and no programming is required to
// take advantage of program flow prediction. Moreover, AArch64 state does not
// implement BTB flush instructions. If the invalidation is required one has to 
// turn the MMU off, turn it back on.
// Cortex-a72 reference manual sections:
//   --"Enabling program flow prediction"
//   -- "BTB invalidation and context switches"

	.globl spectre
	
	.global	bound
	.data
	.align	3
	.type	bound, %object
	.size	bound, 8
bound:
	.xword	6
	.local	cache_temp
	.comm	cache_temp,49152,8
	.text
	.align	2
	.global	_clean_board_state
	.type	_clean_board_state, %function
_clean_board_state:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	// clean experiment memory
	bl _clean_experiment_memory
	// create defined processor state
	mov     x0,  #0
	mov     x1,  #0
	mov     x2,  #0
	mov     x3,  #0
	mov     x4,  #0
	mov     x5,  #0
	mov     x6,  #0
	mov     x7,  #0
	mov     x8,  #0
	mov     x9,  #0
	mov     x10, #0
	mov     x11, #0
	mov     x12, #0
	mov     x13, #0
	mov     x14, #0
	mov     x15, #0
	mov     x16, #0
	mov     x17, #0
	mov     x18, #0
	mov     x19, #0
	mov     x20, #0
	mov     x21, #0
	mov     x22, #0
	mov     x23, #0
	mov     x24, #0
	mov     x25, #0
	mov     x26, #0
	mov     x27, #0
	mov     x28, #0
	mov     x29, #0
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
	.size	_clean_board_state, .-_clean_board_state
	.align	2
	.global	bounds_check
	.type	bounds_check, %function
bounds_check:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x0, 0
	bl	flush_d_cache
	mov	x0, 1
	bl	flush_d_cache
	DSB SY
.include "experiment/asm.h"
	nop
	ldp	x29, x30, [sp], 16
	ret
	.size	bounds_check, .-bounds_check
	.align	2
	.global	spectre
	.type	spectre, %function
spectre:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x0, [sp, 24]
	strb	w1, [sp, 23]
	strb	w2, [sp, 22]
	strb	wzr, [sp, 47]
	str	xzr, [sp, 56]
	b	.L3
.L10:
	mov	x0, 1
	str	x0, [sp, 48]
	b	.L4
.L5:
.include "experiment/asm_train.h"
	bl	bounds_check
	ldr	x0, [sp, 48]
	add	x0, x0, 1
	str	x0, [sp, 48]
.L4:
	ldr	x0, [sp, 48]
	cmp	x0, 6
	bls	.L5
	ldrb	w0, [sp, 22]
	cmp	w0, 1
	bne	.L6
	
	bl      _clean_board_state
.include "experiment/asm_setup1.h"
	b	.L7
.L6:
	bl      _clean_board_state
.include "experiment/asm_setup2.h"
.L7:
	bl	bounds_check
	ldr	x0, [sp, 56]
	cmp	x0, 3
	bhi	.L8
	adrp	x0, cache_temp
	add	x0, x0, :lo12:cache_temp
	bl	save_cache_state
//	adrp	x0, cache_temp
//	add	x0, x0, :lo12:cache_temp
//	bl	print_cache_valid
	b	.L9
	
.L8:
	ldr	x0, [sp, 24]
	bl	save_cache_state
	adrp	x0, cache_temp
	add	x1, x0, :lo12:cache_temp
	ldr	x0, [sp, 24]
	bl	compare_cache
	cmp	x0, 0
	beq	.L9
	ldrb	w0, [sp, 47]
	add	w0, w0, 1
	strb	w0, [sp, 47]
.L9:
	ldr	x0, [sp, 56]
	add	x0, x0, 1
	str	x0, [sp, 56]
.L3:
	ldrb	w0, [sp, 23]
	add	w0, w0, 4
	sxtw	x0, w0
	ldr	x1, [sp, 56]
	cmp	x1, x0
	bcc	.L10
	ldrb	w0, [sp, 47]
	ldp	x29, x30, [sp], 64
	ret
	.size	spectre, .-spectre

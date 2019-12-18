#include "config.h"

#ifdef RUN_TIME

.globl _time_run
.globl _time_run1
.globl _time_run2

.section .experiment_code
scamv_entry:
.include "experiment/asm.h"
	bx r13


.section .data
.align 3
_sp_store:
	.quad 0
.align 3
_scamv_ret_store:
	.quad 0
.align 3
_scamv_timeafter_store:
	.quad 0


.section .text

_time_run1:
	b comebackhere
	bx lr
	ldr r0, =_scamv_ret_store
	mov r1, r14
	str r1, [r0]
	ldr r0, =scamv_entry
	mov r14, r0
	ldr r0, =scamv_exit
	mov r13, r0
	mov r0,  #0
	mov r1,  #0
.include "experiment/asm_setup1.h"
	dmb
	dsb
	isb
	// TODO: reset timer here
	bx r14

_time_run2:
	bx lr
	ldr r0, =_scamv_ret_store
	mov r1, r14
	str r1, [r0]
	ldr r0, =scamv_entry
	mov r14, r0
	ldr r0, =scamv_exit
	mov r13, r0
	mov r0,  #0
	mov r1,  #0
.include "experiment/asm_setup2.h"
	dmb
	dsb
	isb
	// TODO: reset timer here
	bx r14

scamv_exit:
	dmb
	dsb
	isb
	// TODO: measure time here in r0 (subtract two indirect jumps and barrier instructions, should we remove barriers because this should not matter?)
	mov r0, #0x99
	ldr r1, =_scamv_timeafter_store
	str r0, [r1]
	ldr r0, =_scamv_ret_store
	ldr r1, [r0]
	mov r14, r1
	bx lr


_time_run:
// save registers on stack
	sub sp, sp, #(8 * 40)
	str r0,  [sp, #(8 *  0)] // _scamv_run
	str r1,  [sp, #(8 *  1)]
	str r2,  [sp, #(8 *  2)]
	str r3,  [sp, #(8 *  3)]
	str r4,  [sp, #(8 *  4)]
	str r5,  [sp, #(8 *  5)]
	str r6,  [sp, #(8 *  6)]
	str r7,  [sp, #(8 *  7)]

	mov r0,  r8
	mov r1,  r9
	mov r2,  r10
	mov r3,  r11
	mov r4,  r12
	mov r5,  r13 // SP
	mov r6,  r14 // LR

	str r0,  [sp, #(8 *  8)]
	str r1,  [sp, #(8 *  9)]
	str r2,  [sp, #(8 * 10)]
	str r3,  [sp, #(8 * 11)]
	str r4,  [sp, #(8 * 12)]
	str r5,  [sp, #(8 * 13)] // SP
	str r6,  [sp, #(8 * 14)] // LR

// store SP register
	ldr r0, =_sp_store
	mov r1, sp
	str r1, [r0]

// =======================================================
// context save finished
// =======================================================

// clean experiment memory
	bl _clean_experiment_memory
// move _scamv_run to r14 (LR)
	ldr r1, [sp, #(8 *  0)]
	mov r14, r1
// create defined processor state
	mov r0,  #0
	mov r1,  #0
	mov r2,  #0
	mov r3,  #0
	mov r4,  #0
	mov r5,  #0
	mov r6,  #0
	mov r7,  #0
	mov r8,  r0
	mov r9,  r0
	mov r10, r0
	mov r11, r0
	mov r12, r0
	mov r13, r0

// run the experiment code
	ldr r2, =_time_run1
	mov lr, r2
	//bx r2
	//bl _time_run1
	mov pc, r2

// proxy code for experiment run
comebackhere:
	mov r0, #17
	ldr r1, =_scamv_timeafter_store
	str r0, [r1]

// =======================================================
// context restore starts
// =======================================================

// restore SP register
	ldr r0, =_sp_store
	ldr r1, [r0]
	mov sp, r1

// restore registers from stack
	ldr r0,  [sp, #(8 *  8)]
	ldr r1,  [sp, #(8 *  9)]
	ldr r2,  [sp, #(8 * 10)]
	ldr r3,  [sp, #(8 * 11)]
	ldr r4,  [sp, #(8 * 12)]
	ldr r5,  [sp, #(8 * 13)]
	ldr r6,  [sp, #(8 * 14)]

	mov r8,  r0
	mov r9,  r1
	mov r10, r2
	mov r11, r3
	mov r12, r4
	mov r13, r5 // SP
	mov r14, r6 // LR

	ldr r0,  [sp, #(8 *  0)]
	ldr r1,  [sp, #(8 *  1)]
	ldr r2,  [sp, #(8 *  2)]
	ldr r3,  [sp, #(8 *  3)]
	ldr r4,  [sp, #(8 *  4)]
	ldr r5,  [sp, #(8 *  5)]
	ldr r6,  [sp, #(8 *  6)]
	ldr r7,  [sp, #(8 *  7)]

	add sp, sp, #(8 * 40)

	// load the measured time value to r0
	ldr r1, =_scamv_timeafter_store
	ldr r0, [r1]

	bx lr


#endif // RUN_CACHE


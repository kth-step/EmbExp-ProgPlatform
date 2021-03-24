
    .text
    .align 3

    .global __drop_el2
// u-boot/arch/arm/cpu/armv8/transition.S
__drop_el2:
	//msr ELR_EL3, x0
	mov	x0, #0x501	/* Non-secure EL0/EL1 | HVC | 64bit EL2 */
	msr	scr_el3, x0
	msr	cptr_el3, xzr	/* Disable coprocessor traps to EL3 */
	mov	x0, #0x33ff
	msr	cptr_el2, x0	/* Disable coprocessor traps to EL2 */

	/* Initialize Generic Timers */
	msr	cntvoff_el2, xzr

	/* Initialize SCTLR_EL2
	 *
	 * setting RES1 bits (29,28,23,22,18,16,11,5,4) to 1
	 * and RES0 bits (31,30,27,26,24,21,20,17,15-13,10-6) +
	 * EE,WXN,I,SA,C,A,M to 0
	 */
	mov	x0, #0x0830
	movk	x0, #0x30C5, lsl #16
	msr	sctlr_el2, x0

	/* Return to the EL2_SP2 mode from EL3 */
	mov	x0, sp
	msr	sp_el2, x0	/* Migrate SP */
	mrs	x0, vbar_el3
	msr	vbar_el2, x0	/* Migrate VBAR */
	mov	x0, #0x3c9
	msr	spsr_el3, x0	/* EL2_SP2 | D | A | I | F */
	msr	elr_el3, lr
	
	isb	
	eret

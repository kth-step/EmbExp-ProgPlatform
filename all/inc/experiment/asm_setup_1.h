
	// reset the temporary registers to zero
	mov x0, #0
	mov x1, #0


	// x7 = 0x0000000080120000
	movk x7, #0x0000, lsl #0
	movk x7, #0x8012, lsl #16
	movk x7, #0x0000, lsl #32
	movk x7, #0x0000, lsl #48



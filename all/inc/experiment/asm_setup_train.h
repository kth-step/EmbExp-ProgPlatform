	// MEM[0x0000000000100000] =LONG= 0x0000000000000000

	movk x1, #0x0000, lsl #0
	movk x1, #0x0000, lsl #16
	movk x1, #0x0000, lsl #32
	movk x1, #0x0000, lsl #48


	movk x0, #0x0000, lsl #0
	movk x0, #0x0010, lsl #16
	movk x0, #0x0000, lsl #32
	movk x0, #0x0000, lsl #48

	str x1, [x0]


	// reset the temporary registers to zero
	mov x0, #0
	mov x1, #0


	// x1 = 0x0000000040000000
	movk x1, #0x0000, lsl #0
	movk x1, #0x4000, lsl #16
	movk x1, #0x0000, lsl #32
	movk x1, #0x0000, lsl #48

	// x2 = 0x0000000040000001
	movk x2, #0x0000, lsl #0
	movk x2, #0x4000, lsl #16
	movk x2, #0x0000, lsl #32
	movk x2, #0x0000, lsl #48

	// x3 = 0x0000000040100000
	movk x3, #0x0000, lsl #0
	movk x3, #0x4010, lsl #16
	movk x3, #0x0000, lsl #32
	movk x3, #0x0000, lsl #48

	// x5 = 0x0000000080100000
	movk x5, #0x0000, lsl #0
	movk x5, #0x8010, lsl #16
	movk x5, #0x0000, lsl #32
	movk x5, #0x0000, lsl #48







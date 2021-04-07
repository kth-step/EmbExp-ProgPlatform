	// MEM[0x0000000000100200] =LONG= 0x0000000001fc0000

	movk x1, #0x0000, lsl #0
	movk x1, #0x01fc, lsl #16
	movk x1, #0x0000, lsl #32
	movk x1, #0x0000, lsl #48


	movk x0, #0x0200, lsl #0
	movk x0, #0x0010, lsl #16
	movk x0, #0x0000, lsl #32
	movk x0, #0x0000, lsl #48

	str x1, [x0]


	// reset the temporary registers to zero
	mov x0, #0
	mov x1, #0


	// x1 = 0x8000008000000000
	movk x1, #0x0000, lsl #0
	movk x1, #0x0000, lsl #16
	movk x1, #0x0080, lsl #32
	movk x1, #0x8000, lsl #48

	// x2 = 0x0000008000000001
	movk x2, #0x0001, lsl #0
	movk x2, #0x0000, lsl #16
	movk x2, #0x0080, lsl #32
	movk x2, #0x0000, lsl #48

	// x3 = 0x7fffff8080100200
	movk x3, #0x0200, lsl #0
	movk x3, #0x8010, lsl #16
	movk x3, #0xff80, lsl #32
	movk x3, #0x7fff, lsl #48

	// x5 = 0x0000000001100000
	movk x5, #0x0000, lsl #0
	movk x5, #0x0110, lsl #16
	movk x5, #0x0000, lsl #32
	movk x5, #0x0000, lsl #48



	// x3 = 0x0000000080100200
	movk x3, #0x0200, lsl #0
	movk x3, #0x8010, lsl #16
	movk x3, #0x0000, lsl #32
	movk x3, #0x0000, lsl #48



	// x8 = 0x0000000000000200
	movk x8, #0x0200, lsl #0
	movk x8, #0x0000, lsl #16
	movk x8, #0x0000, lsl #32
	movk x8, #0x0000, lsl #48



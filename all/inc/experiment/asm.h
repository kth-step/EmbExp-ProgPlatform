	ldr x24, [x0, #0x1E50]
	subs x10, x24, #0x5B0
	cbnz w29, #8
	b.le #4
	cbnz w16, #4
	cbz w1, #4

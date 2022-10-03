nop
nop
nop
nop
nop

// start here: 40 cycles + ?

// select one of three experiments here
//b finished // this gives 4 extra cycles
//b ait_e1 // this gives 10 extra cycles
b ait_e2 // this also gives 10 extra cycles



// aligned experiment
.align 3
ait_e1:
nop
nop
nop
b finished



// not aligned experiment
.align 3
nop // this breaks the alignment
ait_e2:
nop
nop
nop
b finished




nop
nop
nop

// we finish aligned
.align 3
finished:
nop


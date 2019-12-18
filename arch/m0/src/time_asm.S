#include "config.h"

#ifdef RUN_TIME

.globl _time_run
.globl _input_code
.globl _barriers
_input_code:
loop_cont:
    cmp r0, #0
    beq loop_exit
    add r1, r0, #0x3
    sub r0, r0, #1
    b loop_cont
loop_exit:
    bx lr


_time_run:
    dmb
    dsb
    isb
    // Reset time 
    ldr r0, =0xE000E014  // SYST_RVR
    mov r1, #99
    str r1, [r0]

    ldr r0, =0xE000E018  // SYST_CVR
    mov r1, #100
    str r1, [r0]
    dmb
    dsb
    isb
    // Code for input 1
    mov r0, #12
    bl _input_code
    dmb
    dsb
    isb
    // Measure time 
    ldr r0, =0xE000E018  // SYST_CVR
    ldr r1, [r0]
    mov r0, #100
    sub r0, r0, r1 
    //mov r14, r0
	bx lr
_barriers :
    dmb
    dsb
    isb
#endif // RUN_TIME
/* 
// Experiment 1 : Beggining
// Exepriment 1 : End  
*/

/* 
// Experiment 2 : Beggining
mov r0, #3
mov r1, #5
mul r0, r1, r0
// Exepriment 2 : End  
*/


// Experiment 3 : Beggining
b _branch0

_branch0:
    cmp r3, r2
    beq _branch1
    bne _branch3

_branch1:
    mov r0, #4
    mov r1, #5
    mul r0, r0, r1
    sub r1, r1, #2
    add r2, r2, #1
    mul r0, r0, r2
_branch3:
    sub r0, r0, #1
    // Experiment 3 : End


/*
// Experiments 4, 5 and 6 : Beggining
isb
dsb
// Experiments 4, 5 and 6 : End
*/
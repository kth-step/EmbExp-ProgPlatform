#include "config.h"

#ifdef RUN_TIME

.globl _time_run

_time_run:
    mov r0, #0x5
	bx lr

#endif // RUN_TIME
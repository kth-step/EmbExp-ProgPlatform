#include "lib/printf.h"
#include "LPC11xx.h"
#include "core_cm0.h"
#include "config.h"
#include <stdint.h>

#define BARRIER_DMB_DSB_ISB() __asm__ __volatile__("DMB \t\n DSB \t\n ISB \t\n")

#ifdef RUN_TIME

/*uint32_t input_code(uint32_t x) {
    if (x > 5) {
        return x + 3*x ;
    } 
    else {
        return x;
    }
}*/

void timer_reset() {
    // TODO: reset the systick timer here
    SysTick->VAL = 0 ;
}

uint32_t timer_measure() {
    uint32_t t ;
     /* Since CVR register counts down, the execution time is the difference
      between the start value (reload value) and the current value */
    t = SysTick->LOAD - SysTick->VAL ; 
    return t;
}

void time_run_c()  {
    uint32_t t1,t2;

    // NOTICE: this is a super crude mockup, and we need the barriers to prevent reorderings (brute force solution)

    uint32_t input1 = 14;
    uint32_t input2 = 11;

    SysTick->CTRL |= SysTick_CTRL_CLKSOURCE_Msk ;
    SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk ;
    SysTick->LOAD = 120 ;
    BARRIER_DMB_DSB_ISB();
    timer_reset();
    printf("time tst = %d\n", SysTick->VAL);
    BARRIER_DMB_DSB_ISB();
    //_input_code(input1);
    BARRIER_DMB_DSB_ISB();
    t1 = timer_measure();
    BARRIER_DMB_DSB_ISB();

    BARRIER_DMB_DSB_ISB();
    timer_reset();
    BARRIER_DMB_DSB_ISB();
    //_input_code(input2);
    BARRIER_DMB_DSB_ISB();
    t2 = timer_measure();
    BARRIER_DMB_DSB_ISB();

    printf("Time for each experiment\n");
    printf("t1 = %d\n", t1);
    printf("t2 = %d\n", t2);
    printf("t2 - t1 = %d\n", t2 -  t1);
}

uint32_t _time_run() ;
void run_time_experiment(void)
{
    //uint32_t res = _time_run() ;
    //printf("%d\n", res);
    time_run_c();
}


#endif // RUN_TIME


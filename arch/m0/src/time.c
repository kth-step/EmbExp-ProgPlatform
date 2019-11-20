#include "config.h"
#include "lib/printf.h"
#include <stdint.h>

#include "experiment/time_run.h"

#ifdef RUN_TIME

void run_time_experiment(void)
{
    uint32_t t1 = _time_run(_time_run1);
    uint32_t t2 = _time_run(_time_run2);

    printf("t1 = %d\n", t1);
    printf("t2 = %d\n", t2);
}

#endif // RUN_TIME

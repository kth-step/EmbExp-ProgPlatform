#include <stdint.h>
#include <stdarg.h>
#include "lib/printf.h"
#include "config.h"


#ifdef RUN_CACHE
void run_cache_experiment();
#endif

#ifdef RUN_TIME
void run_time_experiment();
#endif

void experiment_complete_marker() {
  // infinite echo loop
  printf_echoloop();
}

int main()
{
  printf_init();

  printf("Init complete.\n");

#ifdef RUN_CACHE
  run_cache_experiment();
#elif defined RUN_TIME
  run_time_experiment();
#endif
  
  printf("Experiment complete.\n");

  experiment_complete_marker();
}

void main_core1()
{
}

void main_core2()
{
}

void main_core3()
{
}


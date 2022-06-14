#include <stdint.h>
#include <stdarg.h>
#include "lib/printf.h"
#include "config.h"

#include "binarypatcher.h"


#ifdef RUN_CACHE
void run_cache_experiment();
void reset_cache_experiment();
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

  // make this an option, think of a way to pass the locations through to here (config options or similar), allow processing of multiple items, (later also need to revert the patches afterwards)
  patch_arm8_br(0x200038, 0x2004);

#ifdef RUN_CACHE
  reset_cache_experiment();
#endif

  printf_init();

  printf("Init complete.\n");

#ifdef RUN_CACHE
  run_cache_experiment();
#elif defined RUN_TIME
  run_time_experiment();
#endif

  printf("Experiment complete.\n");

  experiment_complete_marker();

  return 0;
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


#include <stdint.h>
#include <stdarg.h>
#include "led.h"
#include "rpi3hw.h"
#include "lib/printf.h"
#include "config.h"


void run_cache_experiment();

void experiment_complete_marker() {
  // infinite echo loop
  printf_echoloop();
}


int main()
{
  uart_init();

  printf("Init complete.\n");

#ifdef RUN_CACHE
  run_cache_experiment();
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


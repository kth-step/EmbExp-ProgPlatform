#include <stdint.h>
#include <stdarg.h>
#include "board/rpi3/led.h"
#include "board/rpi3/rpi3hw.h"
#include "lib/printf.h"


void run_cache_experiment();

void experiment_complete_marker() {
  // infinite echo loop
  printf_echoloop();
}


int main()
{
  uart_init();

  printf("Init complete.\n");

  run_cache_experiment();
  
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


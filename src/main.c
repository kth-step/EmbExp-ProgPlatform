#include <stdint.h>
#include <stdarg.h>
#include "board/rpi3/led.h"
#include "board/rpi3/rpi3hw.h"
#include "lib/printf.h"


void run_cache_experiment();


int main()
{
  uart_init();

  printf("start\r\n");
  printf("\nInit complete.\n");

  run_cache_experiment();
  
  printf("Experiment complete.\n");

  // infinite echo loop
  printf_echoloop();
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


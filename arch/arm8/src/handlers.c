#include "uart.h"
#include "cache.h"
#include "smc.h"

static cache_state cache;

void experiment_complete_marker();

void do_bad_sync() {
  uart_print_string("EXCEPTION: do_bad_sync\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_irq() {
  uart_print_string("EXCEPTION: do_bad_irq\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_fiq() {
  uart_print_string("EXCEPTION: do_bad_fiq\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_error() {
  uart_print_string("EXCEPTION: do_bad_error\n");
  experiment_complete_marker();
  while (1);
}

void do_sync() {
  uint32_t extn;
  asm volatile ("mrs %0, ESR_EL3" : "=r" (extn) :  :);
  if(extn == ESR_EL3_A64_SMC0)
    {
      smc_handler();
      /* printf("In el%x mode\n",get_current_el()); */
      /* save_cache_state(cache); */
      /* find_cache_valid(cache); */
      while (1);
    }
  else
    {
      uart_print_string("EXCEPTION: do_sync\n");
      save_cache_state(cache);
      find_cache_valid(cache);
      experiment_complete_marker();
      while (1);
    }
}

void do_irq() {
  uart_print_string("EXCEPTION: do_irq\n");
  experiment_complete_marker();
  while (1);
}

void do_fiq() {
  uart_print_string("EXCEPTION: do_fiq\n");
  experiment_complete_marker();
  while (1);
}

void do_error() {
  uart_print_string("EXCEPTION: do_error\n");
  experiment_complete_marker();
  while (1);
}



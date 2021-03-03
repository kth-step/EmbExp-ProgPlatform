#include "uart.h"
#include "cache.h"

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
  uart_print_string("EXCEPTION: do_sync\n");
  save_cache_state(cache);
  find_cache_valid(cache);
  experiment_complete_marker();
  while (1);
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



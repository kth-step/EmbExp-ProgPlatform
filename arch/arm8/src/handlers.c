void bcm283x_mu_serial_putc(const char data);
#define putc bcm283x_mu_serial_putc
void print_string(const char* str) {
  while(*str) {
    putc(*str);
    str++;
  }
}

void experiment_complete_marker();

void do_bad_sync() {
  print_string("EXCEPTION: do_bad_sync\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_irq() {
  print_string("EXCEPTION: do_bad_irq\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_fiq() {
  print_string("EXCEPTION: do_bad_fiq\n");
  experiment_complete_marker();
  while (1);
}

void do_bad_error() {
  print_string("EXCEPTION: do_bad_error\n");
  experiment_complete_marker();
  while (1);
}

void do_sync() {
  print_string("EXCEPTION: do_sync\n");
  experiment_complete_marker();
  while (1);
}

void do_irq() {
  print_string("EXCEPTION: do_irq\n");
  experiment_complete_marker();
  while (1);
}

void do_fiq() {
  print_string("EXCEPTION: do_fiq\n");
  experiment_complete_marker();
  while (1);
}

void do_error() {
  print_string("EXCEPTION: do_error\n");
  experiment_complete_marker();
  while (1);
}



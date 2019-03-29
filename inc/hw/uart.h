#ifndef _UART_H
#define _UART_H

#include <stdint.h>

void bcm283x_mu_serial_putc(const char data);
uint32_t bcm283x_mu_serial_getc();

#endif

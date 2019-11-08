#ifndef _UART_H
#define _UART_H

#include <stdint.h>

void uart_init();

void uart_putchar(char c);
char uart_getchar();

#endif

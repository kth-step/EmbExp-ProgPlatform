#ifndef _UART_H
#define _UART_H

void uart_init();

void uart_putchar(char c);
char uart_getchar();

static void uart_print_string(const char* str) {
  while(*str) {
    uart_putchar(*str);
    str++;
  }
}

#endif

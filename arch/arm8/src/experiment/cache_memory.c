#include "config.h"

#ifdef RUN_CACHE


#include <stdint.h>

uint64_t expmem_byte_to_word(uint8_t v) {
  uint64_t w = v;
  return ((w << 56) | (w << 48) | (w << 40) | (w << 32) |
          (w << 24) | (w << 16) | (w << 8 ) | (w << 0 ));
}

// memory space allocated for experiments
extern uint64_t _experiment_memory[32 * 1024 * 8 / 8];
void _clean_experiment_memory() {
  uint64_t default_val = EXPMEM_DEFAULT_VALUE;
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = default_val;
  }
}


#endif // RUN_CACHE


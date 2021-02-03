#include "config.h"

#ifdef RUN_TIME


#include <stdint.h>

uint32_t expmem_byte_to_word(uint8_t v) {
  uint32_t w = v;
  return ((w << 24) | (w << 16) | (w << 8 ) | (w << 0 ));
}

// memory space allocated for experiments
uint32_t _experiment_memory[1024/4];
void _clean_experiment_memory() {
  uint32_t default_val = EXPMEM_DEFAULT_VALUE;
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = default_val;
  }
}


#endif // RUN_TIME


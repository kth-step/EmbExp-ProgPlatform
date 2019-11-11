#include "config.h"

#ifdef RUN_CACHE


#include <stdint.h>

// memory space allocated for experiments
extern uint64_t _experiment_memory[32 * 1024 * 8 / 8];
void _clean_experiment_memory() {
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = 0;
  }
}


#endif // RUN_CACHE


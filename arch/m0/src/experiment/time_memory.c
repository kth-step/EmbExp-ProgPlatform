#include "config.h"

#ifdef RUN_TIME


#include <stdint.h>

// memory space allocated for experiments
uint32_t _experiment_memory[1024/4];
void _clean_experiment_memory() {
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = 0;
  }
}


#endif // RUN_TIME


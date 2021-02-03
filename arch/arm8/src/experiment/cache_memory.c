#include "config.h"

#ifdef RUN_CACHE

#if !defined(__has_include)
#  error "need __has_include"
#endif

#if !__has_include("experiment/asm_setup_1.h")
#  error "need at least asm code to setup state 1"
#endif

#if __has_include("experiment/asm_setup_train.h")
#  define EXP_HAS_INPUT_TRAIN
#endif

#if __has_include("experiment/asm_setup_2.h")
#  define EXP_HAS_INPUT_2
#endif

#include <stdint.h>

uint64_t expmem_byte_to_word(uint8_t v) {
  uint64_t w = v;
  return ((w << 56) | (w << 48) | (w << 40) | (w << 32) |
          (w << 24) | (w << 16) | (w << 8 ) | (w << 0 ));
}

// memory space allocated for experiments
extern uint64_t _experiment_memory[32 * 1024 * 8 / 8];
void _clean_experiment_memory(uint64_t default_val) {
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = default_val;
  }
}

void _clean_experiment_memory_for_input(uint8_t _input_id) {
  switch (_input_id) {
#ifdef EXP_HAS_INPUT_TRAIN
    case 0:
      // training
      _clean_experiment_memory(0);
      break;
#endif
    case 1:
      // input 1
      _clean_experiment_memory(0);
      break;
#ifdef EXP_HAS_INPUT_2
    case 2:
      // input 2
      _clean_experiment_memory(0);
      break;
#endif
    default:
      while (1);
  }
}


#endif // RUN_CACHE


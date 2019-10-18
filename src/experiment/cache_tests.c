#include "lib/printf.h"
#include "config.h"
#include "cpu/aarch64/mmu.h"
#include "cpu/aarch64/cache.h"

#include "experiment/cache_run.h"


#define __UNUSED __attribute__((unused))
#define __ALIGN(x) __attribute__ ((aligned (x)))
#define PAGE_SIZE (4096)
/* page table memory */
uint64_t page_table_l1[4] __ALIGN(PAGE_SIZE);

static void basic_mmu() {
  init_mmu();
  set_l1(page_table_l1);
  // Set up translation table entries in memory with looped store
  // instructions.
  // Set the level 1 translation table.
  l1_set_translation(page_table_l1, 0, 0, 0);
  l1_set_translation(page_table_l1, 0x40000000, 0, 0);
  // Executable Inner and Outer Shareable.
  // R/W at all ELs secure memory
  // AttrIdx=000 Device-nGnRnE.
  // The third entry is 1GB block from 0x80000000 to 0xBFFFFFFF.
  l1_set_translation(page_table_l1, 0x80000000, 0, 1);
  l1_set_translation(page_table_l1, 0xC0000000, 0, 1);
  
  enable_mmu();
}

#define CACHEABLE(x) ((void *)(((uint64_t)(&x)) + 0x80000000))
#define ALIAS(x)     ((void *)(((uint64_t)(&x)) + 0x40000000))

// allocated data for cache state data structures
#ifdef RUN_2EXPS
static cache_state cache1;
static cache_state cache2;
#elif defined RUN_1EXPS
static cache_state cache;
#else
  #error "no experiment type selected"
#endif

// memory space allocated for experiments
extern uint64_t _experiment_memory[32 * 1024 * 8 / 8];
void _clean_experiment_memory() {
  int length = sizeof(_experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    _experiment_memory[i] = 0;
  }
}

static cache_state cache_temp;
uint8_t cache_run_mult_compare(void (*_scamv_run_)(), cache_state cache_, uint8_t n) {
  uint8_t diff = 0;
  _cache_run(_scamv_run_, cache_);
  for (uint8_t i = n; i > 0; i--) {
    _cache_run(_scamv_run_, cache_temp);
    if (compare_cache(cache_, cache_temp, SETS) != 0)
      diff++;
  }
  return diff;
}


#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment() {
  uint16_t diff = 0;
  // setup and enable mmu
  basic_mmu();

  // prime TLB
  volatile uint64_t v __UNUSED = 0;
  v = *((uint64_t *)(0x80000000));

#ifdef RUN_2EXPS
  // run 2 cache experiments
  diff += cache_run_mult_compare(_scamv_run1, cache1, NUM_MUL_RUNS);
  //print_cache_valid(cache1);
  diff += cache_run_mult_compare(_scamv_run2, cache2, NUM_MUL_RUNS);
  //print_cache_valid(cache2);
  //debug_set(cache1[0], 0);
  //debug_set(cache2[0], 0);

#ifdef RUN_CACHE_MULTIW
  #define CACHE_SET_NUM (SETS)
#elif defined RUN_CACHE_MULTIW_SUBSET
  #define CACHE_SET_NUM (SETS/2)
#else
  #error "no cache experiment parameters selected"
#endif
  if (diff == 0) {
    // compare and print result of comparison
    if (compare_cache(cache1, cache2, CACHE_SET_NUM) == 0)
      printf("RESULT: EQUAL\n");
    else
      printf("RESULT: UNEQUAL\n");
  } else {
    printf("INCONCLUSIVE: %d\n", diff);
  }
#elif defined RUN_1EXPS
  diff += cache_run_mult_compare(_scamv_run1, cache, NUM_MUL_RUNS);
  print_cache_valid(cache);
  if (diff != 0)
    printf("INCONCLUSIVE: %d\n", diff);
#else
  #error "no experiment type selected"
#endif
}
#endif



#include "lib/printf.h"
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
static cache_state cache1;
static cache_state cache2;

// memory space allocated for experiments
uint64_t __attribute__((section (".experiment_memory"))) experiment_memory[32 * 1024 * 8 / 8];
uint32_t __attribute__((section (".experiment_code"))) experiment_code[256];

extern uint8_t _scamv_begin;
extern uint8_t _scamv_end;


#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment() {
  int length;
  // !!! clean experiment memory first !!!
  length = sizeof(experiment_memory)/sizeof(uint64_t);
  for (int i = 0; i < length; i++) {
    experiment_memory[i] = 0;
  }
  // !!! and copy code to experiment section !!!
  length = (&_scamv_end - &_scamv_begin);
  if (length > sizeof(experiment_code)/sizeof(uint32_t)) return;
  for (int i = 0; i < length; i++) {
    ((uint8_t*)experiment_code)[i] = (&_scamv_begin)[i];
  }

  // setup and enable mmu
  basic_mmu();

  // prime TLB
  volatile uint64_t v __UNUSED = 0;
  v = *((uint64_t *)(0x80000000));

  // run 2 cache experiments
  _cache_run(cache1, cache2);
  //debug_set(cache1[SET(0)]);
  //debug_set(cache2[SET(0)]);

  // compare and print result of comparison
  if (compare_cache(cache1, cache2) == 0)
    printf("RESULT: EQUAL\n");
  else
    printf("RESULT: UNEQUAL\n");
}
#endif



#include "lib/printf.h"
#include "lib/mmu.h"
#include "lib/cache.h"

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

static cache_state cache1;
static cache_state cache2;

static uint64_t memory[32 * 1024 * 8 / 8] __ALIGN(0x00010000);

static void entropy_code(uint64_t x1, uint64_t x2, uint64_t x3) {
/*
  if (x2 > x3) {
    x1 = x2 + x3;
  }
*/
  volatile uint64_t v __UNUSED = 0;
  v = *((uint64_t *)x1);
}

typedef struct state_input_t {
  uint64_t x1;
  uint64_t x2;
  uint64_t x3;
} state_input;

#include "entropy_input.h"

void run_cache_experiment() {
  basic_mmu();

  // save_cache_state(cache1);
  // debug_set(cache1[SET(state1.x1)]);

  entropy_code(state1.x1, state1.x2, state1.x3);
  /*  volatile uint64_t v __UNUSED = 0;
      v = *((uint64_t *)(1000+0x80000000)); */

  flush_d_cache(0);
  flush_d_cache(1);

  // save_cache_state(cache1);
  // debug_set(cache1[SET(state1.x1)]);
  
  entropy_code(state1.x1, state1.x2, state1.x3);
  save_cache_state(cache1);
  debug_set(cache1[SET(state1.x1)]);
 
  flush_d_cache(0);
  flush_d_cache(1);
  entropy_code(state2.x1, state2.x2, state2.x3);
  save_cache_state(cache2);
  // debug_set(cache1[SET(state1.x2)]);
  debug_set(cache2[SET(state2.x1)]);

  if (compare_cache(cache1, cache2) == 0)
    printf("SUCCESS");
  else
    printf("FAILED");
}

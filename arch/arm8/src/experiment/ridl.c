#include "config.h"

#ifdef RUN_CACHE

#include "lib/printf.h"
#include "mmu.h"
#include "cache.h"

#define BARRIER_DSB_ISB() __asm__ __volatile__("DSB SY \t\n ISB \t\n")
static cache_state cache;

#define ERR_MMU_L1_BASE_IS_NOT_16KB_ALIGNED (20)

#define __UNUSED __attribute__((unused))
#define __ALIGN(x) __attribute__ ((aligned (x)))
#define PAGE_SIZE (4096)
/* page table memory */
uint64_t page_table1_l1[4] __ALIGN(PAGE_SIZE);
uint64_t page_table2_l1[4] __ALIGN(PAGE_SIZE);

#define CACHEABLE(x) ((void *)(((uint64_t)(&x)) + 0x80000000))
#define ALIAS(x)     ((void *)(((uint64_t)(&x)) + 0x40000000))

void reset_cache_experiment() {
  disable_mmu();
}

static void basic_mmu_() {
  init_mmu();
  // Set up translation table entries in memory with looped store
  // instructions.
  // Set the level 1 translation table.
  l1_set_translation(page_table1_l1, 0, 0, 0);
  l1_set_translation(page_table1_l1, 0x40000000, 0, 0);
  // Executable Inner and Outer Shareable.
  // R/W at all ELs secure memory
  // AttrIdx=000 Device-nGnRnE.
  // The third entry is 1GB block from 0x80000000 to 0xBFFFFFFF.
  l1_set_translation(page_table2_l1, 0x80000000, 0, 1);
  //l1_set_translation(page_table1_l1, 0xC0000000, 0, 1);

  // TODO: dirty quick fix for rpi4, overwrites the last mapping, second cacheable alias
  l1_set_translation(page_table2_l1, 0xC0000000, 0xC0000000, 0);

  set_l1(page_table1_l1);
  enable_mmu();
}

int switch_l1(uint64_t l1_base_pa_add)
{
  printf("Switching page table from %x to %x \n", get_l1(), l1_base_pa_add);
  /* 16KB aligned ? */
  if (l1_base_pa_add != (l1_base_pa_add & 0xFFFFC000))
    return ERR_MMU_L1_BASE_IS_NOT_16KB_ALIGNED;

  
  BARRIER_DSB_ISB();
  // Switch the TTB 
  set_l1(l1_base_pa_add);
  BARRIER_DSB_ISB();
  return 0;
}

void find_cache_valid(cache_state c) {
  printf("----\n");
  printf("print_cache_valid\n");
  printf("----\n");
  for (uint64_t set=0; set<SETS; set++) {
    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * l1 = &c[set][way];
      if (l1->valid) {
        //printf("%i\t::%i\t:: tag: %x\n", set, way, l1->tag);
	debug_line(l1,TRUE);
      }
    }
  }
  printf("----\n");
}

void test_mmu_alias_() {

  flush_d_cache(0);
  flush_d_cache(1);
  // check memory alias
  volatile uint64_t x = 0;
  x = 0x87;
  printf("x is in %x\n", &x);
  uint64_t * new_ptr = (uint64_t*)(ALIAS(x));

  assert((x == (*new_ptr)), " uncacheable alias has the same value");

  save_cache_state(cache);
  find_cache_valid(cache);
  flush_d_cache(0);
  flush_d_cache(1);
  
  switch_l1(page_table2_l1);
  printf("Current page table is %x \n", get_l1());

  // access a cacheable value
  volatile uint64_t y = 0;
  y = *((uint64_t * )CACHEABLE(x));
  assert((x == y), " cacheable alias has the same value");
  save_cache_state(cache);
  find_cache_valid(cache);
}

#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment()
{
  printf("page tabels are %x and %x and activated is %x\n", page_table1_l1, page_table2_l1, get_l1());
  basic_mmu_();
  test_mmu_alias_();
}

#endif // !SINGLE_EXPERIMENTS

#endif // RUN_CACHE

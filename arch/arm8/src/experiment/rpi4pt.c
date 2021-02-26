#include "config.h"

#ifdef RUN_CACHE

#include "lib/printf.h"
#include "mmu.h"
#include "cache.h"

#define BARRIER_DSB_ISB() __asm__ __volatile__("DSB SY \t\n ISB \t\n")
#define BARRIER_ISB() __asm__ __volatile__("ISB \t\n")
static cache_state cache;

#define CACHEABLE(x, offset) ((void *)(((uint64_t)(&x)) + offset))


#define __UNUSED __attribute__((unused))
#define __ALIGN(x) __attribute__ ((aligned (x)))
#define PAGE_SIZE (4096)
/* page table memory */
uint64_t page_table1_l1[4] __ALIGN(PAGE_SIZE);
uint64_t dummy[4] __ALIGN(PAGE_SIZE);
uint64_t page_table2_l1[4] __ALIGN(PAGE_SIZE);

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


void reset_cache_experiment() {
  disable_mmu();
}

static void __basic_mmu__(void) {
  init_mmu();
  for(int i = 0; i < 4096; i++){
    page_table1_l1[i] = 0;
    page_table2_l1[i] = 0;
  }
  // Set up translation table entries in memory with looped store
  // instructions.
  // Set the level 1 translation table.
  l1_set_translation(page_table1_l1, 0, 0, 0);
  /* l1_set_translation(page_table2_l1, 0, 0, 0); */

  l1_set_translation(page_table1_l1, 0x40000000, 0, 1);
  /* l1_set_translation(page_table2_l1, 0x40000000, 0, 0); */

  // Executable Inner and Outer Shareable.
  // R/W at all ELs secure memory
  // AttrIdx=000 Device-nGnRnE.
  // The third entry is 1GB block from 0x80000000 to 0xBFFFFFFF.
  l1_set_translation(page_table1_l1, 0x80000000, 0, 1);
  /* l1_set_translation(page_table2_l1, 0x80000000, 0, 1); */
  //l1_set_translation(page_table1_l1, 0xC0000000, 0, 1);

  // TODO: dirty quick fix for rpi4, overwrites the last mapping, second cacheable alias
  l1_set_translation(page_table1_l1, 0xC0000000, 0xC0000000, 0);
  l1_set_translation(page_table2_l1, 0xC0000000, 0xC0000000, 0);

  tlbiall_el3();
  set_l1(page_table1_l1);
  enable_mmu();
}


volatile uint64_t y = 0;
uint64_t * cbl1_ptr = (uint64_t*)(CACHEABLE(y, 0x40000000));
uint64_t * cbl2_ptr = (uint64_t*)(CACHEABLE(y, 0x80000000));


#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment()
{
  __basic_mmu__();
  flush_d_cache(0);
  flush_d_cache(1);
  printf("page tabels are %x and %x and activated is %x\n", page_table1_l1, page_table2_l1, get_l1());

  cbl1_ptr[1] = 0x77;
  flush_d_cache(0);
  flush_d_cache(1);


  switch_l1(page_table2_l1);
  // Here  I check which page table is activated it should the second page table 
  printf("page tabels are %x and %x and activated is %x\n", page_table1_l1, page_table2_l1, get_l1());

  // AT THIS POINT I should get error "do_sync" but I do not
  printf("Read value is %x\n", cbl1_ptr[1]);
   
  save_cache_state(cache);
  find_cache_valid(cache);
}

#endif // !SINGLE_EXPERIMENTS

#endif // RUN_CACHE

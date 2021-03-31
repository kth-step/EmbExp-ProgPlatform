#include "config.h"

#ifdef RUN_CACHE

#include "lib/printf.h"
//#include "mmu.h"
#include "cache.h"
#include <stdint.h>



//#include "experiment/exp_cache_runner.h"


#define __UNUSED __attribute__((unused))
#define __ALIGN(x) __attribute__ ((aligned (x)))
#define PAGE_SIZE (4096)
/* page table memory */
//uint64_t page_table_l1[4] __ALIGN(PAGE_SIZE);

// Move to util later
// uint64_t get_cycles(){
//   uint64_t cycles;
//   asm volatile("csrr %0, mcycle" : "=r"(cycles));
//   return cycles;
// }


//End move to util


void reset_cache_experiment() {
  printf("Performing: Reseting cache\n");
}

static void basic_mmu() {
  printf("Performing: basic mmu\n");
}

#define CACHEABLE(x) ((void *)(((uint64_t)(&x)) + 0x80000000))
#define ALIAS(x)     ((void *)(((uint64_t)(&x)) + 0x40000000))

// allocated data for cache state data structures
#ifdef RUN_2EXPS
static cache_state cache1;
static cache_state cache2;
#elif defined RUN_1EXPS
//static cache_state cache;
#else
  #error "no experiment type selected"
#endif

unsigned int array1_size = 16;
	uint8_t unused1[64];
	uint8_t array1[160] = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16
	};
	uint8_t unused2[64];
  uint8_t array2[128*100];


#ifndef SINGLE_EXPERIMENTS
void run_cache_experiment() {
  printf("Performing: run cache experiment\n");
  //uint16_t diff = 0;
  int diff = 0;
// setup and enable mmu
  basic_mmu();

  // prime TLB
  //volatile uint64_t v __UNUSED = 0;
  //v = *((uint64_t *)(0x80000000));

  uint64_t cycles;
  int tmpr;
  int tmp1;
  //asm volatile("rdcycle %0" : "=r"(cycles));
  //cycles = get_cycles();

  //probe_cache3(array2, 256, 512);

  //evict_cache();

  //cache_size_test();

  volatile uint8_t * addr = & array2[50 * 128];
  tmpr = * addr;
  probe_cache3(array2, 100, 128);
  tmp1 = tmpr;
  //probe_cache3(array2, 100, 128);
  // probe_cache3_misses(array2, 100, 128);

  // cycles = get_cycles();
  //
  // volatile uint8_t * addr = & array2[1 * 512];
  //
  // int integerarray[100];
  // int tmpr;
  // uint64_t cycle0 = get_cycles();
  // tmpr = * addr;
  // //tmpr = &integerarray[0];
  // uint64_t cycle1 = get_cycles();
  // uint64_t cycle_used = cycle1 - cycle0;
  // printf("Cycles (0th): %d\n", cycle_used);
  //
  // addr = & array2[1 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles (0th): %d\n", cycle_used);
  //
  // addr = & array2[70 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles (70'th): %d\n", cycle_used);
  //
  //
  // evict_cache();
  //
  // addr = & array2[1 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles (0''th, after evict): %d\n", cycle_used);
  //
  // printf("Before first probe.\n");
  // probe_cache2();
  // printf("End first probe.\n");
  // addr = & array2[50 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles for 50*512: %d\n", cycle_used);
  // printf("Before second probe.\n");
  // probe_cache2();
  // printf("After second probe.\n");
  // addr = & array2[50 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles for 50*512: %d\n", cycle_used);
  // addr = & array2[50 * 512];
  // cycle0 = get_cycles();
  // tmpr = * addr;
  // cycle1 = get_cycles();
  // cycle_used = cycle1 - cycle0;
  // printf("Cycles for 50*512: %d\n", cycle_used);
  //
  //
  // probe_cache3(array2);


#ifdef RUN_2EXPS
  // run 2 cache experiments
  diff += cache_run_mult_compare(1, cache1, NUM_MUL_RUNS);
  //  print_cache_valid(cache1);
  diff += cache_run_mult_compare(2, cache2, NUM_MUL_RUNS);
  //  print_cache_valid(cache2);
  //debug_set(cache1[0], 0);
  //debug_set(cache2[0], 0);

#ifdef RUN_CACHE_MULTIW
  #define CACHE_EQ_FUN compare_cache_bounds
  #define CACHE_SET_LOWER 0
  #define CACHE_SET_UPPER (SETS)
#elif defined RUN_CACHE_MULTIW_NUMINSET
  #define CACHE_EQ_FUN compare_cache_num_bounds
  #define CACHE_SET_LOWER 0
  #define CACHE_SET_UPPER (SETS)
#elif defined RUN_CACHE_MULTIW_SUBSET
  #define CACHE_EQ_FUN compare_cache_bounds
  #define CACHE_SET_LOWER (((SETS)/2)-3)
  #define CACHE_SET_UPPER (SETS)
#elif defined RUN_CACHE_MULTIW_SUBSET_PAGE_BOUNDARY
  #define CACHE_EQ_FUN compare_cache_bounds
  #define CACHE_SET_LOWER ((SETS)/2)
  #define CACHE_SET_UPPER (SETS)
#else
  #error "no cache experiment parameters selected"
#endif
  if (diff == 0) {
    // compare and print result of comparison
    if (CACHE_EQ_FUN(cache1, cache2, CACHE_SET_LOWER, CACHE_SET_UPPER) == 0)
      printf("RESULT: EQUAL\n");
    else
      printf("RESULT: UNEQUAL\n");
  } else {
    printf("INCONCLUSIVE: %d\n", diff);
  }
#elif defined RUN_1EXPS
  printf("Performing: before comparing caches\n");
  //diff += cache_run_mult_compare(1, cache, NUM_MUL_RUNS);
  //print_cache_valid(cache);
  if (diff != 0)
    printf("INCONCLUSIVE: %d\n", diff);
#else
  #error "no experiment type selected"
#endif
}
#endif // !SINGLE_EXPERIMENTS

#endif // RUN_CACHE

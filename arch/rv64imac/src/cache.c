#include "cache.h"
#include "lib/printf.h"


// reserved memory used for prime and probe
// ------------------------------------------------------------------------
extern volatile uint8_t _probing_memory[CACHE_SIZE];
// stipulated access mapping of _probing_memory (i.e., each way is mapped out in subsequent (SETS * LINE_LEN) blocks)
#define _probing_memory_ADDR(set, way) (_probing_memory + (way * SETS * LINE_LEN) + (set * LINE_LEN))


// priming and probing of a way in a set
// ------------------------------------------------------------------------
void prime_set_way(int set, int way) {
  // access set set & way by index
  volatile uint8_t* addr = _probing_memory_ADDR(set, way);
  //printf("priming (%d, %d) @0x%x\n", set, way, addr);
  *addr; // read
}

uint8_t probe_set_way_miss(int set, int way) {
  // access for set & way, and measure misses
  // - return 1 if miss, otherwise 0

  uint64_t dcache_misses0 = get_number_dcache_read_misses();

  // the actual access
  volatile uint8_t* addr = _probing_memory_ADDR(set, way);
  //printf("probing (%d, %d) @0x%x\n", set, way, addr);
  *addr; // read

  dcache_misses0 = get_number_dcache_read_misses() - dcache_misses0;

  //printf("probing (%d, %d) @0x%x  ==>> %d\n", set, way, addr, dcache_misses0);

  // evaluation if it was a miss (then it is in not in cache)
  return dcache_misses0 > 0;
}


// main interface functions
// ------------------------------------------------------------------------
void validate_cache_aligned_memory(char* name, uint64_t addr) {
  //printf("Memory '%s' is @0x%x.\n", name, addr);
  if (addr % CACHE_SIZE) {
    printf("Memory '%s' is not cache aligned (@0x%x).\n", name, addr);
    while(1);
  }
}

void flush_cache() {
  //Use Wistoff et al.'s implemented flush hw-instruction.
  //Needs correct bitstream on fpga, https://github.com/niwis/ariane/tree/fence-t
  asm volatile("fence iorw, iorw");
  asm volatile(".word 0x1111100b");
  asm volatile("fence iorw, iorw");
}

void cache_func_prime() {
  asm volatile("fence iorw, iorw");
  for (int way = 0; way < WAYS; way++) {
    for (int set = 0; set < SETS; set++) {
      if (set >= 0)
        prime_set_way(set, way);
    }
  }
  asm volatile("fence iorw, iorw");
}

void cache_func_probe(cache_state* cache_state) {
  asm volatile("fence iorw, iorw");
  for (int way = 0; way < WAYS; way++) {
    for (int set = 0; set < SETS; set++) {
      if (set >= 0)
        cache_state->evicted[set][way] = probe_set_way_miss(set, way);
      else
        cache_state->evicted[set][way] = 0;
    }
  }
  asm volatile("fence iorw, iorw");
}

uint8_t compare_cache(cache_state* c1, cache_state* c2) {
  for (int way = 0; way < WAYS; way++) {
    for (int set = 0; set < SETS; set++) {
      if (c1->evicted[set][way] != c2->evicted[set][way]) {
        return 1;
      }
    }
  }
  return 0; // no difference
}

void print_cache_state(cache_state* c) {
  //printf("Printing evicted cache sets \n");
  //printf("_probing_memory is @0x%x\n", _probing_memory);
  for (int set = 0; set < SETS; set++) {
    uint64_t flags = 0;
    for (int way = 0; way < WAYS; way++) {
      flags |= (c->evicted[set][way] ? 1 : 0) << way;
    }
    if (flags) {
      printf("set %d\n", set);
      for (int way = 0; way < WAYS; way++) {
        if (flags & (0x1 << way)) {
          printf("- way %d\n", way);
        }
      }
    }
  }
}


// utility cache functions
// ------------------------------------------------------------------------
uint64_t get_cycles() {
  uint64_t cycles;
  asm volatile("csrr %0, mcycle" : "=r"(cycles));
  return cycles;
}

uint64_t get_number_dcache_read_misses() {
  //might return an unsigned long, check this
  uint64_t dcache_misses;
  asm volatile("csrr %0, 0xb04" : "=r"(dcache_misses));
  //asm volatile("csrr %0, 0xB04" : "=r"(dcache_misses));
  return dcache_misses;
}

uint64_t get_number_icache_misses() {
  uint64_t icache_misses;
  asm volatile("csrr %0, 0xB03" : "=r"(icache_misses));
  return icache_misses;
}

uint64_t get_number_mispredictions() {
  uint64_t cycles;
  asm volatile("csrr %0, 0xB0E" : "=r"(cycles));
  return cycles;
}

void print_perf() {
  uint64_t temp;
  temp = get_number_dcache_read_misses();
  printf("get_number_dcache_read_misses: %d\n", temp);
  temp = get_number_icache_misses();
  printf("get_number_icache_misses: %d\n", temp);
  temp = get_number_mispredictions();
  printf("get_number_mispredictions: %d\n", temp);
}

// uint64_t addi_instruction() {
//   uint64_t cycle0 = get_cycles();
//   asm volatile("addi a0, a0, 1");
//   uint64_t cycle1 = get_cycles();
//   uint64_t cycle_used = cycle1 - cycle0;
//   return cycle_used;
// }




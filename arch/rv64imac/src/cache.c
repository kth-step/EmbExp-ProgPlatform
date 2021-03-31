#include "cache.h"
#include "lib/printf.h"



// Move to util later
void asm_fench(){
  asm volatile("fence iorw, iorw"); // i/o, read, write // everything
}

// Move to util later
uint64_t get_cycles(){
  uint64_t cycles;
  asm volatile("csrr %0, mcycle" : "=r"(cycles));
  return cycles;
}

// Move to util later
uint64_t get_number_mispredictions(){
  uint64_t cycles;
  asm volatile("csrr %0, 0xB0E" : "=r"(cycles));
  return cycles;
}

void cache_print_misses(){
  uint64_t temp;
  temp = get_number_dcache_read_misses();
  printf("get_number_dcache_read_misses: %d\n", temp);
  temp = get_number_icache_misses();
  printf("get_number_icache_misses: %d\n", temp);
  temp = get_number_mispredictions();
  printf("get_number_mispredictions: %d\n", temp);
}

uint64_t get_number_icache_misses(){
  uint64_t icache_misses;
  asm volatile("csrr %0, 0xB03" : "=r"(icache_misses));
  return icache_misses;
}

uint64_t get_number_dcache_read_misses(){
  //might return an unsigned long, check this
  uint64_t dcache_misses;
  asm volatile("csrr %0, 0xb04" : "=r"(dcache_misses));
  //asm volatile("csrr %0, 0xB04" : "=r"(dcache_misses));
  return dcache_misses;
}


uint64_t addi_instruction(){
  uint64_t cycle0 = get_cycles();
  asm volatile("addi a0, a0, 1");
  uint64_t cycle1 = get_cycles();
  uint64_t cycle_used = cycle1 - cycle0;
  return cycle_used;
}

void evict_cache(){
  //Read 16KiB to fill up the cache.
  uint8_t * addr;
  int tmpr;
  int tmp1;
  // uint64_t cycle1;
  // //clock_t start, end;
  // //double clock_cycle_used;
  // uint64_t cycle_used;
  // int size_of_array = 50;
  // int size_fourkb = 4096;
  // uint64_t array_with_ints[size_of_array*size_fourkb];
  // uint64_t array_with_accesstime[size_of_array];
  //for(int i = 0; i < size_of_array*2; i++){
  uint8_t array2[16000*128];

  for(int i = 0; i < 16000; i++){
    addr = & array2[i*128];
    tmpr = * addr;
    tmp1 = tmpr;
  }
  tmpr = tmp1;
  //does this work?
}



void flush_cache(){
  //Use Wistoff et al.'s implemented flush hw-instruction.
  //Needs correct bitstream on fpga, https://github.com/niwis/ariane/tree/fence-t
}

void probe_cache3(uint8_t* array, uint64_t arrayx, uint64_t arrayy){
  uint8_t * addr;
  int tmpr;
  int tmp1;

  for(int i = 0; i < arrayx; i++){
    addr = & array[i * arrayy]; // No need to watch prefetch stuff? (((i*167)+13)&255)
    uint64_t misses = get_number_dcache_read_misses();
    tmpr = * addr;
    misses = get_number_dcache_read_misses() - misses;
    if(misses == 0){
      printf("Index:(%d'th), Cache Hit!(%d).\n",i, misses);
    }
  }
  tmp1 = tmpr; // Do not compile away.
  tmpr = tmp1;
}

void probe_cache3_misses(uint8_t* array, uint64_t arrayx, uint64_t arrayy){
  uint8_t * addr;
  int tmpr;
  int tmp1;

  for(int i = 0; i < arrayx; i++){
    addr = & array[i * arrayy]; // No need to watch prefetch stuff?
    uint64_t misses = get_number_dcache_read_misses();
    tmpr = * addr;
    misses = get_number_dcache_read_misses() - misses;
    if(misses > 0){
      printf("Cache Miss (%d'th)(%d).\n",i, misses);
    }
  }
  tmp1 = tmpr; // Do not compile away.
  tmpr = tmp1;
}

// void probe_cache2_test(){
//   uint8_t array2[256*512]; // 130 000, 32 lines, 4096 lines to fetch.
//   uint8_t * addr;
//   uint64_t cycle0;
//   uint64_t cycle1;
//   uint64_t cycle_used;
//   int tmpr;
//   int tmp1;
// }

void cache_size_test(){ //Fails at index i == 38, 53, 61. After full reset, i == 1???? then 224
  uint8_t array[32000*128];
  uint8_t * addr;
  int tmpr;
  int tmp1;

  for(int i = 0; i < 32000; i++){
    asm_fench();
    addr = & array[i * 128]; // No need to watch prefetch stuff? (((i*167)+13)&255)
    tmpr = * addr;
    for(int j = 0; j < i; j++){
      asm_fench();
      addr = & array[j * 128]; // No need to watch prefetch stuff? (((i*167)+13)&255)
      uint64_t misses = get_number_dcache_read_misses();
      tmpr = * addr;
      misses = get_number_dcache_read_misses() - misses;
      if(misses > 0){
        printf("Index:(%d'th), Cache Miss!(%d), j = %d.\n",i, misses, j);
        return;
      }
    }
  }
  tmp1 = tmpr; // Do not compile away.
  tmpr = tmp1;
}

void probe_cache2(){
  //prefetch
  uint8_t array2[256*512]; // 130 000, 32 lines, 4096 lines to fetch.
  uint8_t * addr;
  uint64_t cycle0;
  uint64_t cycle1;
  uint64_t cycle_used;
  int tmpr;
  int tmp1;

  //uint32_t misses = get_number_dcache_read_misses32();
  uint64_t beforemisses = get_number_dcache_read_misses();
  for(int i = 0; i < 256; i++){
    //random Number
    //fetch number from array
    //if used, take next one index
    // modular serach
    uint64_t misses = get_number_dcache_read_misses();
    addr = & array2[(((i*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("Cache Miss (%d'th) cycles: %d\n",(((i*167)+13)&255)*512, cycle_used);
    }
    //misses = get_number_dcache_read_misses32() - misses;
    misses = get_number_dcache_read_misses() - misses;
    printf("Miss: %d.",misses); //MAX 4092
  }
  tmp1 = tmpr;
  tmpr = tmp1;
  //misses = get_number_dcache_read_misses32() - misses;
  beforemisses = get_number_dcache_read_misses() - beforemisses;
  printf("Total Misses: %d\n",beforemisses); //MAX 4092
}


void probe_cache(){
  uint8_t array2[256*512];
  uint8_t * addr;
  uint64_t cycle0;
  uint64_t cycle1;
  uint64_t cycle_used;
  int tmpr;

    addr = & array2[(((1*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("Cache Miss (%d'th) cycles: %d\n",(((1*167)+13)&255)*512, cycle_used);
    }

    addr = & array2[(((2*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("Cache Miss (%d'th) cycles: %d\n",(((2*167)+13)&255)*512, cycle_used);
    }

    addr = & array2[(((3*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("Cache Miss (%d'th) cycles: %d\n",(((3*167)+13)&255)*512, cycle_used);
    }


  for(int i = 0; i < 256; i++){
    addr = & array2[(((i*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("Cache Miss (%d'th) cycles: %d\n",(((i*167)+13)&255)*512, cycle_used);
    }
  }

  printf("After whole loop\n");

  for(int i = 0; i < 256; i++){
    addr = & array2[(((i*167)+13)&255)*512];
    cycle0 = get_cycles();
    tmpr = * addr;
    cycle1 = get_cycles();
    cycle_used = cycle1 - cycle0;
    if(cycle_used > 90){
      printf("2secLoop Cache Miss (%d'th) cycles: %d\n",(((i*167)+13)&255)*512, cycle_used);
    }
  }

  printf("After same loop\n");

  addr = & array2[(((1*167)+13)&255)*512];
  cycle0 = get_cycles();
  tmpr = * addr;
  cycle1 = get_cycles();
  cycle_used = cycle1 - cycle0;
  if(cycle_used > 90){
    printf("Cache Miss (%d'th) cycles: %d\n",(((1*167)+13)&255)*512, cycle_used);
  }

  addr = & array2[(((2*167)+13)&255)*512];
  cycle0 = get_cycles();
  tmpr = * addr;
  cycle1 = get_cycles();
  cycle_used = cycle1 - cycle0;
  if(cycle_used > 90){
    printf("Cache Miss (%d'th) cycles: %d\n",(((2*167)+13)&255)*512, cycle_used);
  }

  addr = & array2[(((3*167)+13)&255)*512];
  cycle0 = get_cycles();
  tmpr = * addr;
  cycle1 = get_cycles();
  cycle_used = cycle1 - cycle0;
  if(cycle_used > 90){
    printf("Cache Miss (%d'th) cycles: %d\n",(((3*167)+13)&255)*512, cycle_used);
  }
}

//Could add normal flush instructions as experiment?
//fence_i_o,          // flush I$ and pipeline
//fence_o,            // flush D$ and pipeline

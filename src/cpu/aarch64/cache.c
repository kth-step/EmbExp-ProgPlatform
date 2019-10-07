#include "cpu/aarch64/cache.h"
#include "lib/printf.h"

#define BARRIER_DSB_ISB() __asm__ __volatile__("DSB SY \t\n ISB \t\n")

void flush_d_cache(uint64_t level) {
  uint64_t nways = (level == 0)?WAYS:WAYS_L2;
  uint64_t nsets = (level == 0)?SETS:SETS_L2;
  
  // add	x2, x2, #4		/* x2 <- log2(cache line size) */
  uint64_t x2 = 6;
  // clz	w5, w3			/* bit position of #ways */
  uint64_t x5;
  asm (
       "clz %x[result], %x[input_i]"
       : [result] "=r" (x5)
       : [input_i] "r" (nways-1)
       );
  x5 -= 32;
  // uint64_t x5 = 29;
  //and	x4, x4, x6, lsr #13	/* x4 <- max number of #sets */
  /* x12 <- cache level << 1 */
  uint64_t x12 = (level << 1);
  /* x2 <- line length offset */
  /* x3 <- number of cache ways - 1 */
  /* x4 <- number of cache sets - 1 */
  /* x5 <- bit position of #ways */

  for (uint64_t set=0; set < nsets; set++) {
    //loop_set:
    //	mov	x6, x3			/* x6 <- working copy of #ways */
    //loop_way:
    for (uint64_t x6=0; x6<nways; x6 ++ ) {
      //	lsl	x7, x6, x5
      uint64_t x7 = x6 << x5;
      // orr	x9, x12, x7		/* map way and level to cisw value */
      volatile uint64_t x9 = x12 | x7;
      // lsl	x7, x4, x2
      x7 = set << x2;
      // orr	x9, x9, x7		/* map set number to cisw value */
      x9 = x9 | x7;
      asm (
           "dc	cisw, %x[input_i]"
           :
           : [input_i] "r" (x9)
           );
    }
  }

  BARRIER_DSB_ISB();
}


void get_cache_line(cache_line *line, uint64_t set, uint64_t way) {
  volatile uint64_t value;
  BARRIER_DSB_ISB();

  for (uint64_t  offset=0; offset<8; offset++) {
    value = 0;
    value |= (0b11 & way) << 30;
    value |= (0b111111111111111111111111 & set) << 6;
    value |= (0b111 & offset) << 3;

    asm (
         "MSR S3_3_C15_C4_0, %x[input_i]"
         :
         : [input_i] "r" (value)
         );
    asm (
         "MRS %x[result], S3_3_C15_C0_0"
         : [result] "=r" (value)
         : 
         );
    line->data[offset] = value;
    asm (
         "MRS %x[result], S3_3_C15_C0_1"
         : [result] "=r" (value)
         : 
         );
    line->data[offset] |= (value << 32);
  }
  // getting info
  value = 0;
  value |= (0b11 & way) << 30;
  value |= (0b111111111111111111111111 & set) << 6;

  asm (
       "MSR S3_3_C15_C2_0, %x[input_i]"
       :
       : [input_i] "r" (value)
       );
  
  asm (
       "MRS %x[result], S3_3_C15_C0_0"
       : [result] "=r" (value)
       : 
       );

  line->r0 = value;

  line->tag = 0;
  line->tag = ((0x80000000 & value) >> 31) << 11;
  asm (
       "MRS %x[result], S3_3_C15_C0_1"
       : [result] "=r" (value)
       : 
       );
  line->r1 = value;
  line->tag |= ((0xfffffff&value) << 12);
  line->tag += set * 64;

  line->valid = (((0x60000000 & value) >> 29) != 0);

  BARRIER_DSB_ISB();
}


uint64_t get_prefetching_conf() {
  uint64_t volatile value;
  asm (
       "MRS %x[result], S3_1_C15_C2_0"
       : [result] "=r" (value)
       : 
       );
  return value;
}


prefetch_conf parse_prefetch_conf(uint64_t conf) {
  prefetch_conf res;
  res.NPFSTRM = (conf >> 19) & 0b11;
  res.STRIDE  = (conf >> 17) & 0b1;
  res.L1PCTL  = (conf >> 13) & 0b111;
  return res;
}

uint64_t set_prefetching_conf(uint64_t conf, prefetch_conf new_conf) {
  uint64_t mask = ~((0b11<<19) | (0b1<<17) | (0b111<<13));
  //printf("mask %b \n", mask);
  conf &= mask;
  conf |= (((uint64_t)new_conf.NPFSTRM) & 0b11) << 19;
  conf |= (((uint64_t)new_conf.STRIDE) & 0b1) << 17;
  uint64_t new_L1PCTL = (((uint64_t)new_conf.L1PCTL) & 0b111) << 13;
  printf("new_L1PCTL %b \n", new_L1PCTL);
  conf = conf | new_L1PCTL;
  printf("new_conf %b \n", conf);
  
  uint64_t volatile value = conf;
  asm (
       "MSR S3_1_C15_C2_0, %x[input_i]"
       :
       : [input_i] "r" (value)
       );
  return conf;
}



void save_cache_state(cache_state cache) {
  BARRIER_DSB_ISB();

  for (int set=0; set<SETS; set++) {
    for (int way=0; way<WAYS; way++) {
      get_cache_line(&(cache[set][way]), set, way);
    }
  }

  BARRIER_DSB_ISB();
}



void debug_line(cache_line * line, _Bool values) {
  uint64_t i;
  printf(" tag %x\r\n", line->tag);
  printf(" valid %d\r\n", (line->valid));
  if (values) {
    for (i=0; i<8; i++) {
      printf(" %x-%x ", (line->data[i] >> 32), line->data[i]);
    }
    printf("\n");
  }
  printf(" regs: %x-%x %x-%x\n", (line->r0 >> 32), line->r0, (line->r1 >> 32), line->r1);

}

void debug_line_info(cache_line * line) {
  if (!line->valid)
    return;

  printf(" tag %x\r\n", line->tag);
  printf(" regs: %x-%x %x-%x\n", (line->r0 >> 32), line->r0, (line->r1 >> 32), line->r1);

}

void debug_set(set_t set, _Bool values) {
  uint64_t i;
  printf("Debugging set\r\n");
  for (i=0; i<WAYS; i++) {
    debug_line(&(set[i]), values);
  }
}

void debug_set_info(set_t set) {
  uint64_t i;
  printf("Info set\r\n");
  for (i=0; i<WAYS; i++) {
    debug_line_info(&(set[i]));
  }
}

void print_cache_valid(cache_state c) {
  printf("----\n");
  printf("print_cache_valid\n");
  for (uint64_t set=0; set<SETS; set++) {
    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * l1 = &c[set][way];
      if (l1->valid) {
        printf(" %i\t::%i\t:: tag %x\n", set, way, l1->tag);
      }
    }
  }
  printf("----\n");
}

cache_line * get_line_for_pa(cache_state cache, uint64_t pa) {
  uint64_t set = SET(pa);
  for (int way=0; way<WAYS; way++) {
    if (!cache[set][way].valid)
      continue;
    if ((cache[set][way].tag / 64) == (pa / 64))
      return &(cache[set][way]);
  }
  return 0;
}

int hit_for_pa(cache_state cache, uint64_t pa) {
  cache_line * line = get_line_for_pa(cache, pa);
  return (line != 0);
}


uint64_t compare_cache(cache_state c1, cache_state c2, uint64_t setnum) {
  for (uint64_t set=0; set<setnum; set++) {
    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * l1 = &c1[set][way];
      if (l1->valid) {
        // search a way in the second cache that has the same tag
        uint64_t found = 0;
        for (uint64_t way1=0; way1<WAYS; way1++) {
          cache_line * l2 = &c2[set][way1];
          if (l2->valid && (l1->tag == l2->tag))
            found = 1;
        }
        if (!found) {
          return l1->tag;
        }
      }
    }

    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * l2 = &c2[set][way];
      if (l2->valid) {
        // search a way in the first cache that has the same tag
        uint64_t found = 0;
        for (uint64_t way1=0; way1<WAYS; way1++) {
          cache_line * l1 = &c1[set][way1];
          if (l1->valid && (l1->tag == l2->tag))
            found = 1;
        }
        if (!found)
          return l2->tag;
      }
    }
  }
  return 0;
}

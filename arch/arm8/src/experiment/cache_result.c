#include "config.h"

#ifdef RUN_CACHE

#include "lib/printf.h"
#include "mmu.h"
#include "cache.h"

#include "experiment/exp_cache_runner.h"


#define NUM_CACHE_LINES 20

typedef struct counter_cache_line_ {
  uint64_t tag;
  uint64_t count;
  _Bool scamv_run1;
  _Bool scamv_run2;
} counter_cache_line;

#ifdef RUN_2EXPS
//static uint64_t counts[NUM_CACHE_LINES][2];
static counter_cache_line counts[NUM_CACHE_LINES];
#elif defined RUN_1EXPS
//static uint64_t counts[NUM_CACHE_LINES][2];
static counter_cache_line counts[NUM_CACHE_LINES];
#else
  #error "no experiment type selected"
#endif

void reset_count_valid_cache_lines() {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    counts[i].tag = 0;
    counts[i].count = 0;
    counts[i].scamv_run1 = 0;
    counts[i].scamv_run2 = 0;
  }
}

_Bool search(uint64_t t) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (t == counts[i].tag) {
      return 1;
    }
  }
  return 0;
}

void update(uint64_t t, uint8_t scamv_run) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (counts[i].tag == t) {
      ++counts[i].count;
      if (scamv_run == 1)
        counts[i].scamv_run1 = 1;
      if (scamv_run == 2)
        counts[i].scamv_run2 = 1;
    }
  }
}

void insert(uint64_t t, uint8_t scamv_run) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (counts[i].count == 0) {
      counts[i].tag = t;
      ++counts[i].count;
      if (scamv_run == 1)
        counts[i].scamv_run1 = 1;
      if (scamv_run == 2)
        counts[i].scamv_run2 = 1;
      break;
    }
  }
}

void count_valid_cache_lines(cache_state c, uint8_t scamv_run) {
  for (uint64_t set=0; set<SETS; set++) {
    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * cl = &c[set][way];
      if (cl->valid) {
        if (search(cl->tag)) {
          update(cl->tag, scamv_run);
        }
        else {
          insert(cl->tag, scamv_run);
        }
      }
    }
  }
}

void print_cache_lines_occurrences(counter_cache_line *counter) {
  for (uint64_t n=0; n<NUM_CACHE_LINES; n++) {
    if (counter[n].count > 0) {
      printf("%x: %d\n", counter[n].tag, counter[n].count);
    }
  }
}

_Bool eval_result() {
  _Bool condition1 = 0;
  _Bool condition2 = 0;
  _Bool condition3 = 0;
  _Bool condition4 = 0;
  for (uint64_t n=0; n<NUM_CACHE_LINES; n++) {
    if (counts[n].count > 0) {
      if (counts[n].scamv_run1 && !counts[n].scamv_run2) {
        //printf("%x: %d %d %d ->  LEAK\n", counts[n].tag, counts[n].count, counts[n].scamv_run1, counts[n].scamv_run2);
        if (counts[n].count > (NUM_CACHE_EXP*(NUM_MUL_RUNS+1))/2)
          condition1 = 1;
      }
      if (!counts[n].scamv_run1 && counts[n].scamv_run2) {
        //printf("%x: %d %d %d ->  LEAK\n", counts[n].tag, counts[n].count, counts[n].scamv_run1, counts[n].scamv_run2);
        if (counts[n].count > (NUM_CACHE_EXP*(NUM_MUL_RUNS+1))/2)
          condition2 = 1;
      }
      if (counts[n].scamv_run1 && counts[n].scamv_run2) {
        if (counts[n].count == NUM_CACHE_EXP*2) {
          //printf("%x: %d    OK\n", counts[n].tag, counts[n].count);
          condition4 = 1;
        }
        else {
          //printf("%x: %d %d %d\n", counts[n].tag, counts[n].count, counts[n].scamv_run1, counts[n].scamv_run2);
          condition3 = 1;
        }
      }
    }
  }
  if (condition1 & condition2) {
    return 1;  // counterexample
  }
  else {
    return 0;  // inconclusive
  }
}

#endif // RUN_CACHE

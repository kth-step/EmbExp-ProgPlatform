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

// 0 -> cache state second execution; 1 -> cache state first execution (flushing cache)
static counter_cache_line counts[2][NUM_CACHE_LINES];


void reset_count_valid_cache_lines(uint8_t exec_type) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    counts[exec_type][i].tag = 0;
    counts[exec_type][i].count = 0;
    counts[exec_type][i].scamv_run1 = 0;
    counts[exec_type][i].scamv_run2 = 0;
  }
}

_Bool search(uint64_t t, uint8_t exec_type) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (t == counts[exec_type][i].tag) {
      return 1;
    }
  }
  return 0;
}

void update(uint64_t t, uint8_t scamv_run, uint8_t exec_type) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (counts[exec_type][i].tag == t) {
      ++counts[exec_type][i].count;
      if (scamv_run == 1)
        counts[exec_type][i].scamv_run1 = 1;
      if (scamv_run == 2)
        counts[exec_type][i].scamv_run2 = 1;
    }
  }
}

void insert(uint64_t t, uint8_t scamv_run, uint8_t exec_type) {
  for (uint64_t i=0; i<NUM_CACHE_LINES; i++) {
    if (counts[exec_type][i].count == 0) {
      counts[exec_type][i].tag = t;
      ++counts[exec_type][i].count;
      if (scamv_run == 1)
        counts[exec_type][i].scamv_run1 = 1;
      if (scamv_run == 2)
        counts[exec_type][i].scamv_run2 = 1;
      break;
    }
  }
}

void count_valid_cache_lines(cache_state c, uint8_t scamv_run, uint8_t exec_type) {
  for (uint64_t set=0; set<SETS; set++) {
    for (uint64_t way=0; way<WAYS; way++) {
      cache_line * cl = &c[set][way];
      if (cl->valid) {
        if (search(cl->tag, exec_type)) {
          update(cl->tag, scamv_run, exec_type);
        }
        else {
          insert(cl->tag, scamv_run, exec_type);
        }
      }
    }
  }
}

void print_cache_lines_occurrences(uint8_t exec_type) {
  if (exec_type == 1) {
    printf("cache lines of the first execution\n");
  }
  if (exec_type == 0) {
    printf("cache lines of the second execution\n");
  }
  for (uint64_t n=0; n<NUM_CACHE_LINES; n++) {
    if (counts[exec_type][n].count > 0) {
      printf("%x: %d %d %d\n", counts[exec_type][n].tag, 
                               counts[exec_type][n].count, counts[exec_type][n].scamv_run1, counts[exec_type][n].scamv_run2);
    }
  }
}

int eval_result(uint8_t exec_type) {
  _Bool condition1 = 0;
  _Bool condition2 = 0;
  _Bool condition3 = 0;
  uint64_t tot_count_cl = 0;
  uint64_t tot_count_shared_cl = 0;

  for (uint64_t n=0; n<NUM_CACHE_LINES; n++) {
    if (counts[exec_type][n].count > 0) {
      if (counts[exec_type][n].scamv_run1 && !counts[exec_type][n].scamv_run2) {
        if (counts[exec_type][n].count > ((NUM_MUL_RUNS+1)*75/100))
          condition1 = 1;
        else {
          condition3 = 1;
        }
        continue;
      }
      if (!counts[exec_type][n].scamv_run1 && counts[exec_type][n].scamv_run2) {
        if (counts[exec_type][n].count > ((NUM_MUL_RUNS+1)*75/100))
          condition2 = 1;
        else {
          condition3 = 1;
        }
        continue;
      }
      if (counts[exec_type][n].scamv_run1 && counts[exec_type][n].scamv_run2) {
        tot_count_shared_cl += counts[exec_type][n].count;
      }
      tot_count_cl += (2*(NUM_MUL_RUNS+1)); //2 runs times 11 executions
    }
  }

  print_cache_lines_occurrences(exec_type);
  if (condition1 || condition2) {
    return 1;  // counterexample
  }
  else {
    if (condition3)
      return 0;
    if (((tot_count_shared_cl * 100)/tot_count_cl) < 80)
      return 0;  // inconclusive
    else
      return -1; // valid
  }
}

#endif // RUN_CACHE

#ifndef _CACHE_H
#define _CACHE_H

#include <stdint.h>

#define WAYS (4)
#define SETS (32 * 1024 / 64 / WAYS)
#define SET(x) ((((uint64_t)(x))/64)%SETS)
#define TAG_SET_TO_ADDR(tag, set) (tag * 64 * SETS + set*64)

#define WAYS_L2 (16)
#define SETS_L2 (512 * 1024 / 64 / WAYS_L2)


typedef struct cache_line_ {
  uint64_t data[8];
  uint64_t tag;
  _Bool valid;
  uint64_t r0;
  uint64_t r1;
} cache_line;

typedef cache_line set_t[WAYS];
typedef set_t cache_state[SETS];


void flush_d_cache(uint64_t level);
void get_cache_line(cache_line *line, uint64_t set, uint64_t way);
void save_cache_state(cache_state cache);
void debug_line(cache_line * line);
void debug_set(set_t set);
cache_line * get_line_for_pa(cache_state cache, uint64_t pa);
int hit_for_pa(cache_state cache, uint64_t pa);
uint64_t compare_cache(cache_state c1, cache_state c2);

#endif

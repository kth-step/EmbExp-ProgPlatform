#ifndef _CACHE_H
#define _CACHE_H

#include <stdint.h>

#define WAYS (8)
#define SETS (256)

#define TRUE (1)
#define FALSE (0)

typedef struct cache_sets {
  uint64_t number_of_sets;
  _Bool evicted[SETS];
} cache_sets;

typedef struct uint128 {
  uint64_t upperpart;
  uint64_t lowerpart;
} uint128;

void print_cache_sets(cache_sets *c);

void asm_fench();
//remove many of these.
// void evict_cache();
void flush_cache();
uint64_t get_cycles();
//uint64_t addi_instruction();

uint64_t get_number_mispredictions();
uint64_t get_number_dcache_read_misses();
uint64_t get_number_icache_misses();

void cache_exp_branch_specload_part1();
void cache_exp_branch_specload_part2(uint64_t x);
void cache_exp_miss_and_hit();
void cache_exp_cachesets();
void cache_exp_branch_specload();
void cache_exp_straight_spec();

void test_value_in_cache();
void test_two_ways();
_Bool check_address_is_in_cache(uint64_t x);
_Bool access_set_miss(int i);
void access_set(int i);

void cache_exp_all();

_Bool compare_cache(cache_sets *c1, cache_sets *c2);

#endif

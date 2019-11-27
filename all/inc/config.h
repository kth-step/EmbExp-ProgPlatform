#ifndef CONFIG_H
#define CONFIG_H

#include "config_input.h"

#if   defined(__PROGPLAT_BOARD__RPI3) || defined(__PROGPLAT_BOARD__RPI4)
  #ifndef __PROGPLAT_ARCH__ARM8
    #error "wrong architecture for selected board type"
  #endif
#elif defined __PROGPLAT_BOARD__LPC11C24
  #ifndef __PROGPLAT_ARCH__M0
    #error "wrong architecture for selected board type"
  #endif
#else
  #error "no known board type selected"
#endif

#ifdef __PROGPLAT_TYPE__EXPS2
  #define RUN_2EXPS
#elif defined __PROGPLAT_TYPE__EXPS1
  #define RUN_1EXPS
#else
  #error "no experiment type selected"
#endif

#ifdef __PROGPLAT_PARAMS__CACHE_MULTIW
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW
#elif defined __PROGPLAT_PARAMS__CACHE_MULTIW_NUMINSET
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW_NUMINSET
#elif defined __PROGPLAT_PARAMS__CACHE_MULTIW_SUBSET
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW_SUBSET
#elif defined __PROGPLAT_PARAMS__CACHE_MULTIW_SUBSET_PAGE_BOUNDARY
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW_SUBSET_PAGE_BOUNDARY
#elif defined __PROGPLAT_PARAMS__NOTHING
#else
  #error "no experiment parameters selected"
#endif

#ifdef __PROGPLAT_MUL_RUNS__
  #define NUM_MUL_RUNS __PROGPLAT_MUL_RUNS__
#else
  #define NUM_MUL_RUNS 10
#endif

#endif // CONFIG_H


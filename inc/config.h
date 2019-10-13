#ifndef CONFIG_H
#define CONFIG_H

#include "config_input.h"

#ifdef __PROGPLAT_BOARD__RPI3
  #ifndef __PROGPLAT_ARCH__ARMV8
    #error "wrong architecture for selected board type"
  #endif
#else
  #error "no known board type selected"
#endif

#ifdef __PROGPLAT_TYPE__EXPS2
  #define RUN_2EXPS
#else
  #error "no experiment type selected"
#endif

#ifdef __PROGPLAT_PARAMS__EXP_CACHE_MULTIW
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW
#elif defined __PROGPLAT_PARAMS__EXP_CACHE_MULTIW_SUBSET
  #define RUN_CACHE
  #define RUN_CACHE_MULTIW_SUBSET
#else
  #error "no experiment parameters selected"
#endif


#endif // CONFIG_H


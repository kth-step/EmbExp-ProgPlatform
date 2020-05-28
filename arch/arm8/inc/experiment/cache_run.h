#ifndef _CACHE_RUN_H
#define _CACHE_RUN_H

#include "cache.h"
#include <stdint.h>

void _scamv_run1();
void _scamv_run2();
void _scamv_train_bp();

void _cache_run(void (*_scamv_run)(), cache_state cache);

#endif


#ifndef BINPATCH_H
#define BINPATCH_H

#include "binarypatcher.h"

void patch_binary() {
  patch_arm8_br(0x400064, 0x2004);
}

#endif // BINPATCH_H


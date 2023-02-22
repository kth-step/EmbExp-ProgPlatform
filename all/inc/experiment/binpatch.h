#ifndef BINPATCH_H
#define BINPATCH_H

#include "binarypatcher.h"

void patch_binary() {
  patch_arm8_br(0x400064, 0x201c);
}

#endif // BINPATCH_H


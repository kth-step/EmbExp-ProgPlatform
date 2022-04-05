#include <stdint.h>

void patch_the_binary() {
  uint64_t instr_addr = 0x200038;
  uint64_t jump_target = 0x2004;
  uint64_t jump_diff = jump_target - instr_addr;
  // we better check that jump_diff fits in 3 bytes (such an unconditional jump could actually use 2 more bits, but we ignore this because we won't need it)
  // we better check that jump_diff is evenly divisible by 4

  uint32_t instr_opc = (0x14 << 24);
  uint32_t instr_imm = ((jump_diff / 4) & 0x03FFFFFF);

  *((uint32_t*)(instr_addr)) = instr_opc | instr_imm;
}

/*

in "testing/binaryloader":
> make clean all

debugging with gdb:
> make clean debug

x 0x200018
b *0x200000
continue
x 0x200018
x/i 0x200018

detach
quit

*/

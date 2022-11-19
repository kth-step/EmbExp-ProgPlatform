
# select mem_mode as sram, doesn't work, maybe need to turn on this peripheral first
set {unsigned int}0x40010000 = 3

# write sp and pc
set $sp = {unsigned int}0x0
set $pc = {unsigned int}0x20000004


# EmbExp program platform

This repository is the program platform for EmbExp embedded experiments. It can be used to build programs to run on EmbExp.

## 1. Compile

* compiler options:
  * ARM compiler: PATH=$PATH:/home/andreas/Downloads/lifter/binary_blobs_for_analysis/compilers/arm/gcc-arm-8.2-2018.08-x86_64-aarch64-elf/bin
  * Arch package aarch64-linux-gnu
* run `make`


## 2. Connect to experiment platform (embexp-remote)

* run `./interactive.py RPi3` in `embexp-remote`
* wait until openocd is started and the local ports are connected (20000-UART 20013-gdb and 20004-oocd_telnet)
* leave the terminal running until you're done
* don't forget to disconnect afterwards by pressing return in this terminal (so that the board is free for others again)
* if one of the applications crashes by some operation (like openocd), just stop the script by pressing return and start everything again


## 3. Connecting to the UART

* run telnet localhost 20000
* press the key combination `^]` (`Ctrl+]`)
* type `mode character` and hit return


## 4. Starting GDB with gdb-dashboard

* install gdb-dashboard by `wget -P ~ git.io/.gdbinit` (from `https://github.com/cyrus-and/gdb-dashboard`)
* run gdb by `aarch64-elf-gdb rpi3-jtag.elf` (or `aarch64-linux-gnu-gdb rpi3-jtag.elf`)
* start another terminal and run `tty` to determine this shell's identifier
* in the `gdb` shell, type `dashboard source -output /dev/pts/3` where `/dev/pts/3` is the shell identifier determined before


## 5. Connecting with GDB

* run `aarch64-elf-gdb rpi3-jtag.elf` (or as above)
* in gdb, type `target remote localhost:20013`
* in gdb, type `load` (do this again when you recompile to reload everything)
* in gdb, type `b main`
* in gdb, type `j main`


## 6. Debugging with GDB

* `j main` jumps to the symbol main and executes
* when gdb is running and no prompt shows, press the key combination `^c` (`Ctrl+c`) to interrupt the execution
* `j main.c:198` jumps to the beginning of code line 198 and executes
* `continue` to continue execution
* `step` to step to the next code line
* `stepi` to step to the next assembly instruction
* `set $pc = 0x1000` and `continue` to execute from address `0x1000`

* `b main` sets a breakpoint at the symbol main
* `clear main` clears the breakpoint at the symbol main

* `monitor poll` to show the underlying processor state rendered by OpenOCD (notice that it boots in EL3H)

* some documentation
  * `https://sourceware.org/gdb/onlinedocs/gdb/Continuing-and-Stepping.html`
  * `https://stackoverflow.com/questions/42800801/how-to-use-gdb-to-debug-qemu-with-smp-symmetric-multiple-processors`






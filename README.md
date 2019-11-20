# EmbExp program platform

This repository is the program platform for EmbExp embedded experiments. It can be used to build programs to run on EmbExp-Box for example.

## 1. Configure

See file `Makefile.config` and `all/inc/config.h`.

## 2. Compile

* Compilation and linking depends on `Makefile.config`. The directory `all/` is always considered and otherwise the configured `PROGPLAT_BOARD` and `PROGPLAT_ARCH` selects the respective subdirectories in `board/` and `arch/`. The linker script is taken from `board/${PROGPLAT_BOARD}/`.
* Compiler options:
  * ARM compiler: "gcc_arm" and "gcc_arm8" from HolBA (preferred)
  * Arch package aarch64-linux-gnu
* Run `make`.


## 3. Connect to experiment platform (using EmbExp-Box)

1. Run `make connect`. This runs `{EmbExp-Box}/interface/remote.py ${PROGPLAT_BOARD}`.
1. Wait until openocd is started and the local ports are connected (20000-UART 20013-gdb and 20004-oocd_telnet).
1. Leave the terminal running until you're done.
1. Don't forget to disconnect afterwards by pressing return in this terminal (so that the board is free for others again).
1. Just in case: If one of the applications crashes by some operation (like openocd), just stop the script by pressing return and start everything again.


## 4. Running an experiment

* Run `make runlog` and observe the output.


## 5. More advanced debugging

### 1. Connecting to the UART

* If it suffices, just run `make log`,
* otherwise:
  1. Run `make uart`.
  1. Press the key combination `^]` (`Ctrl+]`).
  1. Type `mode character` and hit return.

### 2. Running/debugging the program.

* Run with `make run`, or
* debug with `make debug`.

### 2. Starting GDB with gdb-dashboard

1. Install gdb-dashboard by `wget -P ~ git.io/.gdbinit` (from `https://github.com/cyrus-and/gdb-dashboard`).
1. Run gdb by `make debug`.
1. Start another terminal and run `tty` to determine this shell's identifier.
1. In the `gdb` shell, type `dashboard source -output /dev/pts/3` where `/dev/pts/3` is the shell identifier determined before.

### 3. Debugging examples with GDB

* `j main` jumps to the symbol main and executes
* when gdb is running and no prompt shows, press the key combination `^c` (`Ctrl+c`) to interrupt the execution
* `j main.c:198` jumps to the beginning of code line 198 and executes
* `continue` to continue execution
* `step` to step to the next code line
* `stepi` to step to the next assembly instruction
* `set $pc = 0x1000` and `continue` to execute from address `0x1000`

* `b main` sets a breakpoint at the symbol main
* `clear main` clears the breakpoint at the symbol main

* `monitor poll` to show the underlying processor state rendered by OpenOCD

* some documentation
  * `https://sourceware.org/gdb/onlinedocs/gdb/Continuing-and-Stepping.html`
  * `https://stackoverflow.com/questions/42800801/how-to-use-gdb-to-debug-qemu-with-smp-symmetric-multiple-processors`
  * `https://quequero.org/2014/04/introduction-to-arm-architecture/`






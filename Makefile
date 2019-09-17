# cross compiler
# ---------------------------------
-include Makefile.local
ifndef EMBEXP_CROSS
  EMBEXP_CROSS	= aarch64-linux-gnu-
endif
ifndef EMBEXP_GDB
  EMBEXP_GDB    = ${EMBEXP_CROSS}gdb
endif

CROSS = ${EMBEXP_CROSS}
GDB   = ${EMBEXP_GDB}


# settings
# ---------------------------------
NAME	= output/example-program.elf
KERNEL	= output/kernel.img
SFLAGS  = -Iinc
CFLAGS	= -ggdb3 -std=gnu99 -Wall -fno-builtin -Iinc
LDFLAGS = -Bstatic --gc-sections -nostartfiles -nostdlib

rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))



# source definition
# ---------------------------------
SOURCES_C     = $(call rwildcard, src/, *.c)
SOURCES_S     = $(call rwildcard, src/, *.S)
INCLUDE_FILES = $(call rwildcard, inc/, *.h)

OBJECTS     = $(SOURCES_C:.c=.o) $(SOURCES_S:.S=.o)




# compilation and linking
# ---------------------------------
all: $(KERNEL)

%.o: %.S ${INCLUDE_FILES}
	${CROSS}as ${SFLAGS} -o $@ $<

%.o: %.c ${INCLUDE_FILES}
	${CROSS}gcc ${CFLAGS} -c -o $@ -fno-stack-protector $<

$(NAME): ${OBJECTS}
	mkdir -p ./output
	${CROSS}ld $(LDFLAGS) -o $@ -T linkerscripts/rpi3.ld $^

$(KERNEL): $(NAME)
	mkdir -p ./output
	${CROSS}objcopy --gap-fill=0xff -j .text -j .rodata -j .data -O binary $< $@

clean:
	rm -rf output
	rm -f $(call rwildcard, src/, *.o)




# targets for running and debugging
# ---------------------------------
connect:
	../EmbExp-Box/interface/remote.py RPi3

checkready:
	./scripts/check_ready.sh

# Ctrl+] mode character
uart:
	telnet localhost 20000

run: $(NAME)
	${GDB} -x scripts/run.gdb $(NAME)

log:
	@nc localhost 20000

runlog: $(NAME)
	./scripts/run_only.py

runlog_reset: $(NAME)
	./scripts/connect_and_run.py


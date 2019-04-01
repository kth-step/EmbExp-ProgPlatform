# cross compiler
# ---------------------------------
-include Makefile.local
ifndef CROSS
  CROSS	= aarch64-linux-gnu-
endif
ifndef GDB
  GDB   = {CROSS}gdb
endif


# settings
# ---------------------------------
NAME	= output/example-program.elf
KERNEL	= output/kernel.img
CFLAGS	= -ggdb3 -std=gnu99 -Wall -fno-builtin -Iinc
LDFLAGS = -Bstatic --gc-sections -nostartfiles -nostdlib

rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))



# source definition
# ---------------------------------
SOURCES_C     = $(call rwildcard, src/, *.c)
SOURCES_ASM   = $(call rwildcard, src/, *.asm)
INCLUDE_FILES = $(call rwildcard, inc/, *.h)

OBJECTS     = $(SOURCES_C:.c=.o) $(SOURCES_ASM:.asm=.o)




# compilation and linking
# ---------------------------------
all: $(KERNEL)

%.o: %.asm ${INCLUDE_FILES}
	${CROSS}as -o $@ $<

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
	cd ../EmbExp-Remote/; python2 interactive.py RPi3

# Ctrl+] mode character
uart:
	telnet localhost 20088

run: $(NAME)
	${GDB} -x scripts/run.gdb $(NAME)

log:
	nc localhost 20088

runlog: $(NAME)
	./scripts/run_only.sh "make log" "make run"

runlog_reset: $(NAME)
	./scripts/connect_and_run.sh "make log" "make run"


# cross compiler
# ---------------------------------
-include Makefile.local
ifndef CROSS
  CROSS	= aarch64-linux-gnu-
endif
ifndef GDB
  GDB   = gdb-multiarch
endif


# settings
# ---------------------------------
NAME	= example-program.elf
KERNEL	= kernel.img
CFLAGS	= -ggdb3 -std=gnu99 -Wall -fno-builtin -Iinc
LDFLAGS = -Bstatic --gc-sections -nostartfiles -nostdlib


rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))



# source definition
# ---------------------------------
SOURCES_C   = $(wildcard src/*.c) \
              $(wildcard src/*/*.c)

SOURCES_ASM = $(wildcard src/*.asm) \
              $(wildcard src/*/*.asm)

INCLUDE_FILES = $(call rwildcard, inc/, *.h)


OBJECTS     = $(SOURCES_C:.c=.o) $(SOURCES_ASM:.asm=.o)




# compilation and linking
# ---------------------------------
all: $(KERNEL)

%.o: %.asm ${INCLUDE_FILES}
	${CROSS}as -o $@ $<

%.o: %.c ${INCLUDE_FILES}
	${CROSS}gcc ${CFLAGS} -c -o $@ -fno-stack-protector $<

$(NAME): ${OBJECTS} entry/entry.o
	${CROSS}ld $(LDFLAGS) -o $@ -T linkerscript.ld $^

$(KERNEL): $(NAME)
	${CROSS}objcopy --gap-fill=0xff -j .text -j .rodata -j .data -O binary $< $@

clean:
	rm -f $(KERNEL) $(NAME) ${OBJECTS} entry/entry.o




# targets for running and debugging
# ---------------------------------
connect:
	cd ../EmbExp-Remote/; python2 interactive.py RPi3

# Ctrl+] mode character
uart:
	telnet localhost 20088

run: $(NAME)
	${GDB} -x run.gdb $(NAME)

log:
	nc localhost 20088

runlog: $(NAME)
	./run_only.sh "make log" "make run"

runlog_reset: $(NAME)
	./connect_and_run.sh "make log" "make run"


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
NAME_DA	= output/example-program.da
SFLAGS  = -Iinc
CFLAGS	= -ggdb3 -std=gnu99 -Wall -fno-builtin -Iinc
LDFLAGS = -Bstatic -nostartfiles -nostdlib

rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))



# source definition
# ---------------------------------
SOURCES_C     = $(call rwildcard, src/, *.c)
SOURCES_S     = $(call rwildcard, src/, *.S)
INCLUDE_FILES = $(call rwildcard, inc/, *.h)

OBJECTS     = $(SOURCES_C:.c=.o) $(SOURCES_S:.S=.o)




# compilation and linking
# ---------------------------------
all: $(NAME_DA)

%.o: %.S ${INCLUDE_FILES}
	${CROSS}as ${SFLAGS} -o $@ $<

%.o: %.c ${INCLUDE_FILES}
	${CROSS}gcc ${CFLAGS} -c -o $@ -fno-stack-protector $<

$(NAME): ${OBJECTS}
	mkdir -p ./output
	${CROSS}ld $(LDFLAGS) -o $@ -T linkerscripts/rpi3.ld $^

$(NAME_DA): $(NAME)
	${CROSS}objdump -t -d $< > $@

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


.PHONY: all clean
.PHONY: connect checkready uart run log runlog runlog_reset


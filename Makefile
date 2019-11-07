# config
include Makefile.config

# local settings
-include Makefile.local

# toolchain
include Makefile.toolchain

# common definitions
# ---------------------------------
OUTDIR  = output
NAME	= ${OUTDIR}/program.elf

rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))

# file definitions
# ---------------------------------
SOURCES_C     = $(call rwildcard, src/, *.c)
SOURCES_S     = $(call rwildcard, src/, *.S)
INCLUDE_FILES = $(call rwildcard, inc/, *.h) inc/config_input.h

OBJECTS       = $(SOURCES_C:.c=.o) $(SOURCES_S:.S=.o)

LINKERFILE    = linkerscripts/$(PROGPLAT_BOARD).ld


# compilation and linking
# ---------------------------------
all: $(NAME)

inc/config_input.h: Makefile.config
	./scripts/gen_config_input.py

%.o: %.S ${INCLUDE_FILES}
	${CROSS}as ${SFLAGS} -o $@ $<

%.o: %.c ${INCLUDE_FILES}
	${CROSS}gcc ${CFLAGS} -c -o $@ $<

$(NAME): ${OBJECTS} ${SOURCES_C} ${SOURCES_S} ${INCLUDE_FILES}
	mkdir -p ${OUTDIR}
	${CROSS}ld $(LDFLAGS) -o $@ -T $(LINKERFILE) ${OBJECTS}
	${CROSS}objdump -t -h -D $@ > "$@_da"

clean:
	rm -rf ${OUTDIR}
	rm -f $(call rwildcard, src/, *.o) inc/config_input.h


.PHONY: all clean

# running and debugging
include Makefile.run


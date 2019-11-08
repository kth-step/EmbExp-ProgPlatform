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
ifeq ("$(PROGPLAT_BOARD)", "lpc11c24")
  CODE_DIRS_EXTRA = libs/CMSIS_CORE_LPC11xx
endif

CODE_DIRS     = all arch/$(PROGPLAT_ARCH) board/$(PROGPLAT_BOARD) ${CODE_DIRS_EXTRA}

SOURCES_C     = $(foreach d,$(CODE_DIRS),$(call rwildcard, $d/src/, *.c))
SOURCES_S     = $(foreach d,$(CODE_DIRS),$(call rwildcard, $d/src/, *.S))
INCLUDE_FILES = $(foreach d,$(CODE_DIRS),$(call rwildcard, $d/inc/, *.h)) all/inc/config_input.h

OBJECTS       = $(SOURCES_C:.c=.o) $(SOURCES_S:.S=.o)

BOARDCONFIG   = $(PROGPLAT_BOARD)
LINKERFILE    = board/ld/$(BOARDCONFIG).ld


# compiler flags
# ---------------------------------
ifeq ("$(PROGPLAT_ARCH)", "arm8")
  CFLAGS_EXTRA  = -ggdb3
else ifeq ("$(PROGPLAT_ARCH)", "m0")
  CFLAGS_EXTRA = -g3 -specs=nosys.specs -DUSE_OLD_STYLE_DATA_BSS_INIT -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -fno-common -D__USE_CMSIS=CMSIS_CORE_LPC11xx
  LDFLAGS_POST = -L$(ARMSYS) -L$(ARMLIB) -lgcc
endif

INCFLAGS     = $(foreach d,$(CODE_DIRS),-I$d/inc)
SFLAGS       = ${INCFLAGS}
CFLAGS	     = -std=gnu99 -Wall -fno-builtin -fno-stack-protector ${INCFLAGS} ${CFLAGS_EXTRA}
LDFLAGS_PRE  = -Bstatic -nostartfiles -nostdlib


# compilation and linking
# ---------------------------------
all: $(NAME)

all/inc/config_input.h: Makefile.config
	./scripts/gen_config_input.py

%.o: %.S ${INCLUDE_FILES}
	${CROSS}as ${SFLAGS} -o $@ $<

%.o: %.c ${INCLUDE_FILES}
	${CROSS}gcc ${CFLAGS} -c -o $@ $<

$(NAME): ${OBJECTS} ${SOURCES_C} ${SOURCES_S} ${INCLUDE_FILES}
	mkdir -p ${OUTDIR}
	${CROSS}ld $(LDFLAGS_PRE) -o $@ -T $(LINKERFILE) ${OBJECTS} $(LDFLAGS_POST)
	${CROSS}objdump -t -h -D $@ > "$@_da"

clean:
	rm -rf ${OUTDIR}
	rm -f $(call rwildcard, , *.o) all/inc/config_input.h


.PHONY: all clean


# running and debugging
include Makefile.run


ENTRY(_embexp_entry)

SECTIONS
{
    ROM_BASE = 0x80000000; /* DRAM_BASE */

    /*__experiment_code_loc   =   0x2000;*/
  	__experiment_memory_loc = 0xa0000000;
  	__experiment_memory_len =  0x40000;/* 32 * 1024 * 8 bytes */

    . = ROM_BASE;

    .text.init : { *(.text.init) }

    .text : ALIGN(0x100) {
    _TEXT_START_ = .;
        *(.text*)
    _TEXT_END_ = .;
    }

    .data : ALIGN(0x100) {
    _DATA_START_ = .;
        *(.data*)
        *(.sdata*)
    _DATA_END_ = .;
    }

    PROVIDE(_data = ADDR(.data));
    PROVIDE(_data_lma = LOADADDR(.data));
    PROVIDE(_edata = .);

    .bss : ALIGN(0x100) {
    _BSS_START_ = .;
        *(.bss)
        *(.sbss*)
    _BSS_END_ = .;
    }

    .rodata : ALIGN(0x100) {
    _RODATA_START_ = .;
        *(.rodata)
        *(.rodata*)
    _RODATA_END_ = .;
    }



    .experiment_memory __experiment_memory_loc :
    {
      _experiment_memory = . ;
      . += __experiment_memory_len ;/* 32 * 1024 * 8 bytes */
    }
}

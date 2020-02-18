
MEMORY
{
    ram   (xrw) : org = 0x80000000, len = 16k
}
  
SECTIONS
{
    . = ORIGIN(ram);

    .text : 
    {
        board/arty_a7_100t__fe310/src/entry.o (.text*)
        KEEP (*(.experiment_code));
        *(.text*);
    } >ram        
    _etext = .;

    .data : 
    {
        _data = .;
        *(.data);
        _edata = .;
    } >ram AT>ram

    .bss : 
    {
        __bss_start__ = .;
        _bss = .;
        *(.bss);
        __bss_end__ = .;
        _ebss = .;	  
    } > ram

    _vStackTop = 0x80000000 + 0x2000 -16;
}



.globl _embexp_entry
_embexp_entry:
    lui x2,0x80004
    jal main_entry
    ebreak
    j .


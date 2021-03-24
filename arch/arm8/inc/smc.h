#ifndef _SMC_H
#define _SMC_H

#define ESR_EL3_A64_SMC0	0x5e000000

void smc_handler(void);

#endif

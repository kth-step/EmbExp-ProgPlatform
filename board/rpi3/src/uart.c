#include "rpi3hw.h"
#include "uart.h"

void bcm283x_mu_serial_putc(const char data)
{
	struct bcm283x_mu_regs *regs = (struct bcm283x_mu_regs *) MU_BASE;

	/* Wait until there is space in the FIFO */
	while (!(readl((uint64_t) &regs->lsr) & MU_LSR_TX_NOT_FULL));

	/* Send the character */
	writel((uint64_t) &regs->io, data);
}

uint32_t bcm283x_mu_serial_getc()
{
	struct bcm283x_mu_regs *regs = (struct bcm283x_mu_regs *) MU_BASE;

	uint32_t data;

	/* Wait until there is data in the FIFO */
	while (!(readl((uint64_t) &regs->lsr) & MU_LSR_RX_READY));

	/* Read the character */
	data = readl((uint64_t) &regs->io);

	return data;
}

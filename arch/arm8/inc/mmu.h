#ifndef _MMU_H
#define _MMU_H


#include <stdint.h>

#define L1_PAGE_SIZE (1024*1024*1024)


#define PMD_ATTRINDX(t)		((t) << 2)
/*
 * Section
 */
#define PMD_TYPE_SECT		(1 << 0)
#define PMD_SECT_NON_SHARE	(0 << 8)
#define PMD_SECT_OUTER_SHARE	(2 << 8)
#define PMD_SECT_INNER_SHARE	(3 << 8)
#define PMD_SECT_AF		(1 << 10)
#define PMD_SECT_NG		(1 << 11)
#define PMD_SECT_PXN		(UL(1) << 53)
#define PMD_SECT_UXN		(UL(1) << 54)

/*
 * Memory types
 */
#define MT_DEVICE_NGNRNE	0
#define MT_DEVICE_NGNRE		1
#define MT_DEVICE_GRE		2
#define MT_NORMAL_NC		3
#define MT_NORMAL		4

#define MEMORY_ATTR     (PMD_SECT_AF | PMD_SECT_INNER_SHARE /* | PMD_ATTRINDX(MT_NORMAL) */ | PMD_TYPE_SECT)



/* TCR attributes */
#define BITS_PER_VA                32
#define TCR_TOSZ                   (64 - BITS_PER_VA)

#define TCR_IRGN0_SHIFT            8
#define TCR_IRGN0_NM_NC            (0x00 << TCR_IRGN0_SHIFT)
#define TCR_IRGN0_NM_WBWAC         (0x01 << TCR_IRGN0_SHIFT)
#define TCR_IRGN0_NM_WTC           (0x02 << TCR_IRGN0_SHIFT)
#define TCR_IRGN0_NM_WBNWAC        (0x03 << TCR_IRGN0_SHIFT)

#define TCR_ORGN0_SHIFT            10
#define TCR_ORGN0_NM_NC            (0x00 << TCR_ORGN0_SHIFT)
#define TCR_ORGN0_NM_WBWAC         (0x01 << TCR_ORGN0_SHIFT)
#define TCR_ORGN0_NM_WTC           (0x02 << TCR_ORGN0_SHIFT)
#define TCR_ORGN0_NM_WBNWAC        (0x03 << TCR_ORGN0_SHIFT)

#define TCR_SH0_SHIFT              12
#define TCR_SH0_NC                 (0x0 << TCR_SH0_SHIFT)
#define TCR_SH0_OS                 (0x2 << TCR_SH0_SHIFT)
#define TCR_SH0_IS                 (0x3 << TCR_SH0_SHIFT)

#define TCR_TG0_SHIFT              14
#define TCR_TG0_4KB                (0x0 << TCR_TG0_SHIFT)
#define TCR_TG0_64KB               (0x1 << TCR_TG0_SHIFT)
#define TCR_TG0_16KB               (0x2 << TCR_TG0_SHIFT)

#define TCR_PS_SHIFT               16
#define TCR_PS_4GB                 (0x0 << TCR_PS_SHIFT)
#define TCR_PS_64GB                (0x1 << TCR_PS_SHIFT)
#define TCR_PS_1TB                 (0x2 << TCR_PS_SHIFT)
#define TCR_PS_4TB                 (0x3 << TCR_PS_SHIFT)
#define TCR_PS_16TB                (0x4 << TCR_PS_SHIFT)
#define TCR_PS_256TB               (0x5 << TCR_PS_SHIFT)

#define TCR_TBI_SHIFT              20
#define TCR_TBI_USED               (0x0 << TCR_TBI_SHIFT)
#define TCR_TBI_IGNORED            (0x1 << TCR_TBI_SHIFT)

#define  TCR_ATTR (TCR_TOSZ | TCR_IRGN0_NM_WBWAC | TCR_ORGN0_NM_WBWAC | TCR_SH0_IS | TCR_TG0_4KB | TCR_PS_256TB | TCR_TBI_USED)

void init_mmu();
uint64_t set_l1(void * l1);
void switch_l1(void * table); 
void l1_set_translation(uint64_t * l1, uint64_t va, uint64_t pa, uint64_t cacheable);
void enable_mmu(void);
void disable_mmu(void);

/* CPU */
extern void __drop_el2(void);

#endif

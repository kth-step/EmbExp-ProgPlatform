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


#define BITS_PER_VA                33
/*
 *TCR flags.
 */
#define TCR_T0SZ(x)		((64 - (x)) << 0)
#define TCR_IRGN_WBWA		(1 << 8)
#define TCR_IRGN_WBNWA		(3 << 8)
#define TCR_IRGN_MASK		(3 << 8)
#define TCR_ORGN_NC		(0 << 10)
#define TCR_ORGN_WBWA		(1 << 10)
#define TCR_ORGN_WT		(2 << 10)
#define TCR_ORGN_WBNWA		(3 << 10)
#define TCR_ORGN_MASK		(3 << 10)
#define TCR_SHARED_NON		(0 << 12)
#define TCR_SHARED_OUTER	(2 << 12)
#define TCR_SHARED_INNER	(3 << 12)
#define TCR_TG0_4K		(0 << 14)
#define TCR_EL3_IPS_BITS	(3 << 16)	/* 42 bits physical address */
#define TCR_EL3_RSVD		(1 << 31 | 1 << 23)

#define TCR_FLAGS	(TCR_TG0_4K | \
		TCR_SHARED_OUTER | \
		TCR_SHARED_INNER | \
		TCR_IRGN_WBWA | \
		TCR_ORGN_WBWA | \
		TCR_T0SZ(BITS_PER_VA))

void init_mmu();
uint64_t set_l1(void * l1);
void switch_l1(void * table); 
void l1_set_translation(uint64_t * l1, uint64_t va, uint64_t pa, uint64_t cacheable);
void enable_mmu(void);
void disable_mmu(void);

#endif

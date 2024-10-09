#include <stdint.h>
#include <stdio.h>
#include <cbm.h>

struct hyppo_version
{
    uint16_t minor;
    uint16_t major;
};

uint16_t hyppo_getversion(void);

int main(void)
{
    cbm_k_chrout(0x8e);
    // struct hyppo_version hver = hyppo_getversion();
    // uint32_t hv = 0x1234abcd;
    uint8_t v = hyppo_getversion();
    //  *(uint8_t *)0xd018 = 0x15;
    printf("hyppo version: %04x", 0x112f);
    return 0;
}
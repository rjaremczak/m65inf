#include <stdint.h>
#include <stdio.h>
#include <cbm.h>

#include "hyppo.h"

int main(void)
{
    cbm_k_chrout(0x8e);
    printf("mega65 info\n");
    struct hyppo_version hv;
    uint8_t err = hyppo_getversion(&hv);
    if (err)
    {
        printf("\x05hyppo error: \x96%02x", err);
    }
    else
    {
        printf("\x05hyppo:\x9e%02x.%02x\x05 hdos:\x9e%02x.%02x\x05", hv.hyppo_major, hv.hyppo_minor, hv.hdos_major, hv.hdos_minor);
    }
    return 0;
}
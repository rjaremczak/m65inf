#pragma once

#include <stdint.h>

struct hyppo_version
{
    uint8_t hyppo_major;
    uint8_t hyppo_minor;
    uint8_t hdos_major;
    uint8_t hdos_minor;
};

uint8_t hyppo_errorcode(void) __attribute__((leaf));
uint8_t hyppo_getversion(struct hyppo_version *hv) __attribute__((leaf));

#include <stdint.h>
#include <stdio.h>
#include <cbm.h>

int main(void)
{
    cbm_k_chrout(0x8e);
    // *(uint8_t *)0xd018 = 0x15;
    puts("hello to ja!");
    return 0;
}
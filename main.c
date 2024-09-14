#include <stdint.h>
#include <stdio.h>

int main(void)
{
    *(uint8_t *)0xd018 = 0x15;
    puts("hello!");
    return 0;
}
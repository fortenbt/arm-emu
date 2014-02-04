#include <stdio.h>
#include "darm.h"

/* Need a way to set initial register conditions
 *
 * Disassemble the code file
 *
 * Emulate using initial conditions. Error out if we encounter 
 * a register that is undefined.
 *
 * Display what memory addresses were updated and with
 * which values.
 *
 */

int main()
{
    darm_t d;
    darm_str_t str;

    if(darm_armv7_disasm(&d, 0x42424242) == 0 &&
            darm_str2(&d, &str, 1) == 0) {

        printf("-> %s\n", str.total);
    }
}


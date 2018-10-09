#include "AJIOB_random.h"

#include <stdint.h>

double generate_random()
{
    static uint64_t r = RANDOM_R0;

    r = (RANDOM_A * r) % (RANDOM_M);

    return (((double)r) / RANDOM_M);
}

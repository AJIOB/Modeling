#include "AJIOB_random.h"

#include <stdint.h>
#include <math.h>

double generate_random()
{
    static uint64_t r = RANDOM_R0;

    r = (RANDOM_A * r) % (RANDOM_M);

    return (((double)r) / RANDOM_M);
}

double generate_exp_random()
{
    return (- log(generate_random()) / RANDOM_EXP_LAMBDA);
}

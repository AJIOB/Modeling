#include <stdio.h>

#include "config.h"
#include "AJIOB_random.h"

int main()
{
    for (int i = 0; i < MAX_ITERATIONS; i++)
    {
        printf("%lf\n", generate_random());
    }

    return 0;
}

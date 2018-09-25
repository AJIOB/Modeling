#include <stdio.h>

#include "AJIOB_random.h"

int main()
{
    for (int i = 0; i < 10; i++)
    {
        printf("%lf\n", generate_random());
    }

    return 0;
}

#include <stdio.h>

#include "config.h"
#include "model.h"

int check_config()
{
    if ((MODEL_SOURCE_RO) < 0)
    {
        fprintf(stderr, "MODEL_SOURCE_RO < 0: %lf\n", (MODEL_SOURCE_RO));
        return 1;
    }

    if ((MODEL_SOURCE_RO) > 1)
    {
        fprintf(stderr, "MODEL_SOURCE_RO > 1: %lf\n", (MODEL_SOURCE_RO));
        return 1;
    }
    
    if ((MODEL_PI_1) < 0)
    {
        fprintf(stderr, "MODEL_PI_1 < 0: %lf\n", (MODEL_PI_1));
        return 1;
    }
    
    if ((MODEL_PI_1) > 1)
    {
        fprintf(stderr, "MODEL_PI_1 > 1: %lf\n", (MODEL_PI_1));
        return 1;
    }

    return 0;
}

int main()
{
    if (check_config())
    {
        return 1;
    }

    Model_t::static_model_info.reset();

    for (int i = 0; i < MAX_ITERATIONS; i++)
    {
        Model_t::static_model_info.execute();
    }

    Model_t::static_model_info.print_info();

    return 0;
}

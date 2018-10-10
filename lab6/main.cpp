#include <stdio.h>
#include <stdbool.h>

#include "config.h"
#include "model.h"

bool is_fifo = false;

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

void print_config()
{
    printf("Lambda = %04lf (rho = %04lf)\n", MODEL_SOURCE_LAMBDA, MODEL_SOURCE_RO);
    printf("Mu = %04lf (pi = %04lf)\n", MODEL_CHANNEL_MU, MODEL_PI_1);
    printf("Delta t = %04lf ticks\n", MODEL_DELTA_T);
}

int main()
{
    if (check_config())
    {
        return 1;
    }

    print_config();

    for (int j = 0; j < 2; j++)
    {
        if (is_fifo)
        {
            printf("----   Queue as fifo   ----\n");
        }
        else
        {
            printf("----Queue with priority----\n");
        }

        Model_t::static_model_info.reset();

        for (int i = 0; i < MAX_ITERATIONS; i++)
        {
            Model_t::static_model_info.execute();
        }

        Model_t::static_model_info.print_info();

        is_fifo = true;
    }

    return 0;
}

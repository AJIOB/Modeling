#include <stdio.h>

#include "config.h"
#include "model.h"

int main()
{
    Model_t::static_model_info.reset();

    for (int i = 0; i < MAX_ITERATIONS; i++)
    {
        Model_t::static_model_info.execute();
    }

    Model_t::static_model_info.print_info();

    return 0;
}

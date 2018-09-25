#include "source.h"

#include "config.h"

const uint8_t Source_t::max_timeout = MODEL_MAX_TIMEOUT;

void Source_t::reset()
{
    timeout = max_timeout;
}

Task_t Source_t::generate_new_task()
{
    Task_t res;
    //TODO: implement
    return res;
}

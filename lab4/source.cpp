#include "source.h"

#include <limits.h>

#include "config.h"
#include "model.h"

const uint8_t Source_t::max_timeout = MODEL_MAX_TIMEOUT;

void Source_t::reset()
{
    timeout = max_timeout;
}

Task_t Source_t::generate_new_task()
{
    Task_t res;
    res.start_time = is_can_genetare() ? Model_t::static_model_info.get_time() : ULLONG_MAX;
    return res;
}

bool Source_t::is_can_genetare() const
{
    return (timeout <= 0);
}

void Source_t::execute()
{
    if (timeout > 0)
    {
        timeout--;
    }
}

std::string Source_t::to_string() const
{
    return std::to_string(timeout);
}

Source_t::Source_t()
{
}

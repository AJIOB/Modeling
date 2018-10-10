#include "source.h"

#include <limits>

#include "AJIOB_random.h"
#include "model.h"

void Source_t::reset()
{
    is_generated = false;
}

Task_t Source_t::generate_new_task()
{
    Task_t res;
    if (is_can_genetare())
    {
        res.start_time = Model_t::static_model_info.get_time();
        res.time_to_work = generate_exp_random();
        reset();
    }
    else
    {
        res.start_time = std::numeric_limits<uint64_t>::max();
        res.time_to_work = std::numeric_limits<double>::max();
    }

    return res;
}

bool Source_t::is_can_genetare() const
{
    return is_generated;
}

void Source_t::execute()
{
    double value = generate_random();

    is_generated = (value >= is_cannot_generate_probability);
}

Source_t::Source_t(double is_cannot_generate)
    : is_cannot_generate_probability(is_cannot_generate)
{
    reset();
}

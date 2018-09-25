#include "state.h"

#include "config.h"

const uint8_t State_t::max_queue_len = MODEL_MAX_QUEUE;

State_t::State_t()
{
}

void State_t::reset()
{
    current_source.reset();

    current_queue.clear();

    current_execution.clear();
    current_execution.push_back(Channel_t(MODEL_PI_1));
    current_execution.push_back(Channel_t(MODEL_PI_2));
}

std::string State_t::to_string() const
{
    std::string res;
    //TODO: implement

    return res;
}

void State_t::switch_state()
{
    //TODO: implement
}

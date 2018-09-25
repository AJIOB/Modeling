#include "state.h"

#include <string>

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
    res += current_source.to_string();
    res += std::to_string(current_queue.size());
    for(auto it = current_execution.begin(); it != current_execution.end(); it++)
    {
        res += it->to_string();
    }

    return res;
}

void State_t::switch_state()
{
    //TODO: implement
}

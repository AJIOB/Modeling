#pragma once

#include <string>
#include <deque>
#include <stdint.h>

#include "task.h"
#include "channel.h"
#include "source.h"

class State_t
{
public:
    std::string to_string() const;
    void reset();
    void switch_state();

    State_t();

    uint8_t calc_tasks();

private:
    static const uint8_t max_queue_len;

    Source_t current_source;
    std::deque<Task_t> current_queue;
    std::deque<Channel_t> current_execution;
};

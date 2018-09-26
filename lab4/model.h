#pragma once

#include <stdint.h>
#include <map>
#include <deque>

#include "config.h"
#include "state.h"

class Model_t
{
public:
    static Model_t static_model_info;

    void reset();
    uint64_t get_time() const;
    void execute();
    void print_info();

    void stat_generated_losing();
    void stat_add_task_in_system_time(uint64_t time);

private:
    uint64_t iterations;
    std::map<std::string, uint64_t> state_count;
    uint64_t generated_losing;
    std::deque<uint64_t> task_in_system_time;
    std::deque<uint64_t> task_in_system;

    State_t current_state;
};

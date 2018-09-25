#pragma once

#include <stdint.h>
#include <map>

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

private:
    uint64_t iterations;
    std::map<std::string, uint64_t> state_count;

    State_t current_state;
};

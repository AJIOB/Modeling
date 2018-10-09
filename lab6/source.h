#pragma once

#include <stdint.h>
#include <string>

#include "task.h"

class Source_t
{
public:
    void reset();

    Task_t generate_new_task();
    bool is_can_genetare() const;
    void execute();
    std::string to_string() const;

    Source_t();

private:
    static const uint8_t max_timeout;
    
    uint8_t timeout;
};

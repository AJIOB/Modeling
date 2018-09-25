#pragma once

#include <stdint.h>

#include "Task.h"

class Source_t
{
public:
    void reset();

    Task_t generate_new_task();

private:
    static const uint8_t max_timeout;

    uint8_t timeout;
};

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

    Source_t(double is_cannot_generate);

private:
    const double is_cannot_generate_probability;
    
    bool is_generated;
};

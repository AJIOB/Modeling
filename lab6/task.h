#pragma once

#include <stdint.h>
#include <stdbool.h>

extern bool is_fifo;

typedef struct Task_t
{
    uint64_t start_time;
    double time_to_work;

    bool operator< (const Task_t& t) const
    {
        return (is_fifo 
            ? (this->start_time > t.start_time) 
            : (this->time_to_work > t.time_to_work));
    }
} Task_t;

#pragma once

#include "task.h"

class Channel_t
{
public:
    bool is_empty() const;
    bool add_task(Task_t task);
    void execute();

    Channel_t(double is_cannot_execute);

private:
    double is_cannot_execute_probability;
    bool is_empty_var;
    Task_t current_task;
};

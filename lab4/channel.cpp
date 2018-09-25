#include "channel.h"

bool Channel_t::is_empty() const
{
    return is_empty_var;
}

bool Channel_t::add_task(Task_t task)
{
    if (is_empty())
    {
        is_empty_var = false;
        current_task = task;
        return true;
    }
    return false;
}

void Channel_t::execute()
{
    //TODO:
}

Channel_t::Channel_t(double is_cannot_execute)
{
    is_empty_var = true;
    is_cannot_execute_probability = is_cannot_execute;
}

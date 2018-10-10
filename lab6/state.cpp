#include "state.h"

#include <string>

#include "config.h"
#include "model.h"

const int8_t State_t::max_queue_len = MODEL_MAX_QUEUE;

State_t::State_t()
    : current_source(MODEL_SOURCE_RO)
{
}

void State_t::reset()
{
    current_source.reset();

    while(!current_queue.empty())
    {
        current_queue.pop();
    }

    current_execution.clear();
    current_execution.emplace_back(MODEL_PI_1);
}

std::string State_t::to_string() const
{
    size_t element_num = current_queue.size();
    for(auto& it : current_execution)
    {
        element_num += (size_t) (!it.is_empty());
    }

    return std::to_string(element_num);
}

void State_t::switch_state()
{
    int free_executions = 0;
    for(auto& it : current_execution)
    {
        it.execute();
        if (it.is_empty())
        {
            free_executions++;
        }
    }

    current_source.execute();
	const bool was_generated = current_source.is_can_genetare();
    Task_t generated_task;
    if (was_generated)
    {
        generated_task = current_source.generate_new_task();
    }

    if (was_generated && 
        (free_executions || (((int64_t)current_queue.size()) < max_queue_len) || (max_queue_len < 0)))
    {
        current_queue.push(generated_task);
    }
    else if (was_generated)
    {
        Model_t::static_model_info.stat_generated_losing();
    }

    for(auto& it : current_execution)
    {
        if (!current_queue.empty() && it.add_task(current_queue.top()))
        {
            current_queue.pop();
        }
    }
}

uint8_t State_t::calc_tasks()
{
    uint8_t res = current_queue.size();

    for (auto &it : current_execution)
    {
        res += ((int)(!it.is_empty()));
    }

    return res;
}

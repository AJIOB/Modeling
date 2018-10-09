#include "state.h"

#include <string>

#include "config.h"
#include "model.h"

const uint8_t State_t::max_queue_len = MODEL_MAX_QUEUE;

State_t::State_t()
{
}

void State_t::reset()
{
    current_source.reset();

    current_queue.clear();

    current_execution.clear();
    current_execution.emplace_back(MODEL_PI_1);
    current_execution.emplace_back(MODEL_PI_2);
}

std::string State_t::to_string() const
{
    std::string res;
    res += current_source.to_string();
    res += std::to_string(current_queue.size());
    for(auto& it : current_execution)
    {
        res += it.to_string();
    }

    return res;
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
        (free_executions || (current_queue.size() < max_queue_len)))
    {
        current_queue.push_back(generated_task);
    }
    else if (was_generated)
    {
        Model_t::static_model_info.stat_generated_losing();
    }

    for(auto& it : current_execution)
    {
        if (!current_queue.empty() && it.add_task(current_queue.front()))
        {
            current_queue.pop_front();
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

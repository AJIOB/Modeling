#include "model.h"

Model_t Model_t::static_model_info;

void Model_t::reset()
{
    iterations = 0;
    current_state.reset();
    state_count.clear();
}

uint64_t Model_t::get_time() const
{
    return iterations;
}

void Model_t::execute()
{
    current_state.switch_state();

    std::string new_state_name = current_state.to_string();
    if (state_count.find(new_state_name) == state_count.end())
    {
        state_count.insert(std::pair<std::string, uint64_t>(new_state_name, 0));
    }

    state_count[new_state_name]++;
    iterations++;
}

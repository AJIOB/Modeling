#include "model.h"

Model_t Model_t::static_model_info;

void Model_t::reset()
{
    iterations = 0;
    generated_losing = 0;
    current_state.reset();
    state_count.clear();
    task_in_system_time.clear();
    task_in_system.clear();
}

uint64_t Model_t::get_time() const
{
    return iterations;
}

void Model_t::execute()
{
    current_state.switch_state();

    task_in_system.push_back(current_state.calc_tasks());

    std::string new_state_name = current_state.to_string();
    if (state_count.find(new_state_name) == state_count.end())
    {
        state_count.insert(std::pair<std::string, uint64_t>(new_state_name, 0));
    }

    state_count[new_state_name]++;
    iterations++;
}

void Model_t::print_info()
{
    printf("======= States =======\n");
    for (auto it : state_count)
    {
        double partial = ((double)it.second) / iterations;
        printf("[%s]: %.4lf (%lu entries)\n", it.first.c_str(), partial, it.second);
    }

    double p_loss = ((double) generated_losing) / iterations;
    double q = 1 - p_loss;
    printf("Q = %.4lf (%lu tasks were lost)\n", q, generated_losing);

    uint64_t time_sum = 0;
    for (auto& it : task_in_system_time)
    {
        time_sum += it;
    }
    double wc = ((double) time_sum) / iterations;
    printf("Wc = %.4lf\n", wc);

    uint64_t count_sum = 0;
    for (auto& it : task_in_system)
    {
        count_sum += it;
    }
    double lc = ((double) count_sum) / iterations;
    printf("Lc = %.4lf\n", lc);

    double a = ((double) task_in_system_time.size()) / iterations;
    printf("A = %.4lf\n", a);
}

void Model_t::stat_generated_losing()
{
    generated_losing++;
}

void Model_t::stat_add_task_in_system_time(uint64_t time)
{
    task_in_system_time.push_back(time);
}

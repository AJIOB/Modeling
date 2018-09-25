#pragma once

#include <string>

class State_t
{
public:
    std::string to_string() const;
    void reset();

    inline State_t()
    {
        reset();
    }

private:
    
};

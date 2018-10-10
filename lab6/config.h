#pragma once

#include <stdint.h>

#define MODEL_SOURCE_LAMBDA             (2.5)
#define MODEL_MAX_QUEUE                 (-1)
#define MODEL_CHANNEL_MU                (3.0)
#define MODEL_ADDITIONAL_MU_ORDER       (100)

#define RANDOM_M    313107
#define RANDOM_A    134279
#define RANDOM_R0   1

#define MAX_ITERATION_PERIODS 100000

// auto config
#define MODEL_ADDITIONAL_MU             (((MODEL_SOURCE_LAMBDA) + (MODEL_CHANNEL_MU)) * (MODEL_ADDITIONAL_MU_ORDER))
#define MODEL_DELTA_T                   (1.0 / (MODEL_ADDITIONAL_MU + MODEL_SOURCE_LAMBDA + MODEL_CHANNEL_MU))
#define MODEL_SOURCE_RO                 (1 - ((MODEL_DELTA_T) * (MODEL_SOURCE_LAMBDA)))
#define MODEL_PI_1                      (1 - ((MODEL_DELTA_T) * (MODEL_CHANNEL_MU)))
#define MAX_ITERATIONS                  ((int64_t) ((MAX_ITERATION_PERIODS) / (MODEL_DELTA_T)))

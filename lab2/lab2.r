source("lab1/lab1.r")

# get generated basic [0; 1] values
basic_nums <- res

#distribution prototypes
linear_run <- function()
{
  # distribution parameters
  dist_a <- 5
  dist_b <- 10
  
  inp <- "y"
  inp <- readline("Use default values for linear distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_a <- input_num("a", dist_a)
    dist_b <- input_num("b", dist_b)
  }
  
  linear_res <- dist_a + (dist_b - dist_a) * basic_nums
  
  stat_info_print(linear_res, "Linear distribution")
}

gaussian_run <- function()
{
  # distribution parameters
  dist_m <- 10
  dist_sigma <- 2
  dist_n <- 6
  
  inp <- "y"
  inp <- readline("Use default values for Gaussian distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_m <- input_num("m", dist_m)
    dist_sigma <- input_num("sigma", dist_sigma)
  }
  
  basic_gaussian <- random_run(a, r0, m, dist_n * n)
  gaussian_temp <- seq(1, n)
  for (i in seq(1, n))
  {
    start <- dist_n * (i - 1) + 1
    stop <- dist_n * i
    gaussian_temp[i] <- sum(basic_gaussian[start:stop])
  }
  
  gaussian_res <- dist_m + dist_sigma * sqrt(12 / dist_n) * (gaussian_temp - dist_n / 2)
  stat_info_print(gaussian_res, "Gaussian distribution")
}

#execution
linear_run()
gaussian_run()

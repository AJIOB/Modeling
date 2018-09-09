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

exponential_run <- function()
{
  # distribution parameters
  dist_lambda <- 5
  
  inp <- "y"
  inp <- readline("Use default values for exponential distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_lambda <- input_num("lambda", dist_lambda)
  }
  
  exp_res <- (-log(basic_nums) / dist_lambda)
  
  stat_info_print(exp_res, "Exponential distribution")
}

gamma_run <- function()
{
  # distribution parameters
  dist_lambda <- 5
  dist_nu <- 3
  
  inp <- "y"
  inp <- readline("Use default values for gamma distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_lambda <- input_num("lambda", dist_lambda)
    dist_nu <- input_num("nu", dist_nu)
  }
  
  basic_exp <- random_run(a, r0, m, dist_nu * n)
  exp_temp <- seq(1, n)
  for (i in seq(1, n))
  {
    start <- dist_nu * (i - 1) + 1
    stop <- dist_nu * i
    exp_temp[i] <- sum(log(basic_exp[start:stop]))
  }
  exp_res <- (-exp_temp / dist_lambda)
  
  stat_info_print(exp_res, "Gamma distribution")
}

triangular_run <- function()
{
  # distribution parameters
  dist_a <- 5
  dist_b <- 10
  dist_n <- 2
  
  inp <- "y"
  inp <- readline("Use default values for triangular distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_a <- input_num("a", dist_a)
    dist_b <- input_num("b", dist_b)
  }
  
  basic_triangular <- random_run(a, r0, m, dist_n * n)
  triangular_temp <- seq(1, n)
  for (i in seq(1, n))
  {
    start <- dist_n * (i - 1) + 1
    stop <- dist_n * i
    triangular_temp[i] <- min(basic_triangular[start:stop])
  }
  triangular_res <- dist_a + (dist_b - dist_a) * triangular_temp
  
  stat_info_print(triangular_res, "Triangular distribution")
}

simpson_run <- function()
{
  # distribution parameters
  dist_a <- 5
  dist_b <- 10
  dist_n <- 2
  
  inp <- "y"
  inp <- readline("Use default values for Simpson distribution (enter y if agree)? ")
  if ("y" != inp)
  {
    #input
    dist_a <- input_num("a", dist_a)
    dist_b <- input_num("b", dist_b)
  }
  
  basic_simpson <- random_run(a, r0, m, dist_n * n)
  simpson_temp <- seq(1, n)
  for (i in seq(1, n))
  {
    start <- dist_n * (i - 1) + 1
    stop <- dist_n * i
    simpson_temp[i] <- sum(basic_simpson[start:stop])
  }
  simpson_res <- (dist_a + (dist_b - dist_a) * simpson_temp) / 2
  
  stat_info_print(simpson_res, "Simpson distribution")
}

#execution
linear_run()
gaussian_run()
exponential_run()
gamma_run()
triangular_run()
simpson_run()

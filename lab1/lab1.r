
AJIOB_random <- function(a, ri, m)
{
  s1 <- a * ri
  rn <- s1 %% m
  value <- rn / m
  list("ri" = rn, "value" = value)
}

random_run <- function(a, r0, m, n)
{
  test <- list("ri" = r0)
  for (i in seq(1, n, 1))
  {
    test <- AJIOB_random(3,test$ri,100)
    print(test$value)
  }
}

random_run(3, 1, 5, 10)

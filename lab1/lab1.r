# for numeric parsing
library(varhandle)

AJIOB_random <- function(a, ri, m)
{
  s1 <- a * ri
  rn <- s1 %% m
  value <- rn / m
  list("ri" = rn, "value" = value)
}

random_run <- function(a, r0, m, n)
{
  values <- c(r0 / m)
  test <- list("ri" = r0)
  for (i in seq(1, n, 1))
  {
    test <- AJIOB_random(a,test$ri,m)
    values <- c(values, test$value)
  }
  
  #remove first element (based on r0)
  values[-1]
}

input <- function(varname, default_value)
{
  out <- paste(c("Enter", paste(c(varname,": "), collapse = "")), collapse = " ")
  inp <- readline(prompt=out)
  if (check.numeric(inp)) 
  {
    as.numeric(inp)
  }
  else 
  {
    out <- paste(c("Input was not a number. Using default value", default_value), collapse = " ")
    message(out)
    default_value
  }
}

# default settings
a <- 3
r0 <- 1
m <- 5
n <- 10

#input
a <- input("a", a)
r0 <- input("R0", r0)
m <- input("m", m)

message("Generating ", n, " numbers")

res <- random_run(a, r0, m, n)
print(res)

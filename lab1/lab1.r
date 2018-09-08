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
  values <- seq(1, n)
  test <- list("ri" = r0)
  for (i in seq(1, n, 1))
  {
    test <- AJIOB_random(a,test$ri,m)
    values[i] <- test$value
  }
  
  values
}

pos_find_in_random <- function(a, r0, m, req)
{
  i <- 1
  test <- AJIOB_random(a,r0,m)
  while(test$value != req)
  {
    test <- AJIOB_random(a,test$ri,m)
    i <- i + 1
  }
  
  i
}

i1_i2_find <- function(a, r0, m, xv)
{
  i1 <- pos_find_in_random(a, r0, m, xv)
  P <- pos_find_in_random(a, xv * m, m, xv)
  list("i1" = i1, "i2" = P + i1, "P" = P)
}

input_num <- function(varname, default_value)
{
  out <- paste(c("Enter", paste(c(varname,": "), collapse = "")), collapse = " ")
  inp <- readline(prompt=out)
  if (check.numeric(inp)) 
  {
    as.numeric(inp)
  }
  else 
  {
    message("Input was not a number. Using default value ", default_value)
    default_value
  }
}

sqr <- function(a)
{
  a*a
}

# default settings
a <- 3
r0 <- 1
m <- 313107
n <- 1000000
histn <- 20

inp <- "y"
inp <- readline("Use default values (enter y if agree)? ")
if ("y" != inp)
{
  #input
  a <- input_num("a", a)
  r0 <- input_num("R0", r0)
  m <- input_num("m", m)
}

message("Generating ", n, " numbers")

res <- random_run(a, r0, m, n)
#print(res)

hist(res, xlab = "Random values", breaks = histn, main = "Random histogram")

# 2
message("Mean = ", mean(res))
pop_var <- n / (n - 1) * var(res)
message("Population variance (derivation) = ", pop_var)
message("Square derivation = ", sqrt(pop_var))

# 3: indirect signs
res_pair_count <- seq(1, (length(res) / 2))
for (i in 1:(length(res) / 2))
{
  val <- sqr(res[2 * i]) + sqr(res[2 * i - 1])
  res_pair_count[i] <- (val < 1)
}
k <- sum(res_pair_count)
pair_count_delta <- abs(2 * k / n - pi / 4)
message("Indirect signs delta = ", pair_count_delta, " (", pair_count_delta / (pi / 4) * 100, "%)")

# 4: period length
V <- 3*10^6
message("Generate 4.1 sequence. V = ", V)
rand_seq_4_1 <- random_run(a, r0, m, V)
xV <- rand_seq_4_1[V]
message("xV = ", xV)
message("Finding i1 & i2...")
i1_i2_P_info <- i1_i2_find(a, r0, m, xV)
i1 <- i1_i2_P_info$i1
i2 <- i1_i2_P_info$i2
P <- i1_i2_P_info$P
message("i1 = ", i1)
message("i2 = ", i2)
message("P (sequence period length) = ", P)

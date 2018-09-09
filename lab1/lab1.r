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

random_last_only <- function(a, r0, m, n)
{
  test <- list("ri" = r0)
  for (i in seq(1, n, 1))
  {
    test <- AJIOB_random(a,test$ri,m)
  }
  
  test$value
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

i3_find <- function(a, r0, m, p)
{
  rp <- random_last_only(a, r0, m ,p) * m
  i3 <- 0
  while(r0 != rp)
  {
    r0 <- AJIOB_random(a, r0, m)$ri
    rp <- AJIOB_random(a, rp, m)$ri
    i3 <- i3 + 1
  }
  
  list("i3" = i3, "L" = i3 + p)
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

stat_info_print <- function(values, header)
{
  n <- length(values)
  hist(values, xlab = "Random values", breaks = histn, main = header)
  message()
  message("=== ", header, " ===")
  message("Mean = ", mean(values))
  pop_var <- n / (n - 1) * var(values)
  message("Population variance (derivation) = ", pop_var)
  message("Square derivation = ", sqrt(pop_var))
}

# default settings
a <- 134279
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

# 2
stat_info_print(res, "Random histogram")

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
xV <- random_last_only(a, r0, m, V)
message("xV = ", xV)
message("Finding i1 & i2...")
i1_i2_P_info <- i1_i2_find(a, r0, m, xV)
i1 <- i1_i2_P_info$i1
i2 <- i1_i2_P_info$i2
P <- i1_i2_P_info$P
message("i1 = ", i1)
message("i2 = ", i2)
message("P (sequence period length) = ", P)

i3_L_info <- i3_find(a, r0, m, P)
i3 <- i3_L_info$i3
L <- i3_L_info$L
message("i3 = ", i3)
message("L (aperiodic segment length) = ", L)

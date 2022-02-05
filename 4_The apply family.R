# lapply(X, FUN, ...)
# lapply() takes a vector or list X, and applies the function FUN to each of its members.
# The output of lapply() is a list, the same length as X, where each element is the result of applying FUN on the corresponding element of X.

# The vector pioneers
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
pioneers

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")
split_math

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)
split_low

# Take a look at the structure of split_low
str(split_low)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)
names

# Write function select_second()
select_second <- function(x) {
  x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)
years

# Defining functions to use them only once is kind of overkill; that's why you can use so-called anonymous functions

# Transform: use anonymous function inside lapply
function(x) {
  x[1]
}

names <- lapply(split_low, function(x) {
  x[1]
})
names

# Transform: use anonymous function inside lapply
function(x) {
  x[2]
}

years <- lapply(split_low, function(x) {
  x[2]
})
years

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)
names
years


# sapply(X, FUN, ...)
# The first argument of sapply() is the list or vector X over which you want to apply a function, FUN.
# sapply() is a user-friendly version and wrapper of lapply() by default returning a vector, matrix or, if simplify = "array", an array if appropriate, by applying simplify2array(). 
# sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f).


# temp ISN'T DEFINED HERE SO THE CODE WON'T WORK
# temp:
# [[1]]
# [1]  3  7  9  6 -1
# [[2]]
# [1]  6  9 12 13  5
# [[3]]
# [1]  4  8  3 -1 -3
# [[4]]
# [1]  1  4  7  2 -2
# [[5]]
# [1] 5 7 9 4 2
# [[6]]
# [1] -3  5  8  9  4
# [[7]]
# [1] 3 6 9 4 1

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) +max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s, freezing_l)

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Apply print_info() over temp using sapply()
sapply(temp, print_info)

# Apply print_info() over temp using lapply()
lapply(temp, print_info)


# vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
# Over the elements inside X, the function FUN is applied. The FUN.VALUE argument expects a template for the return argument of this function FUN. USE.NAMES is TRUE by default; in this case vapply() tries to generate a named array, if possible.
# vapply() is similar to sapply(), but has a pre-specified type of return value, so it can be safer (and sometimes faster) to use.

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()
vapply(temp, basics, numeric(3))

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))

# Convert to vapply() expression
vapply(temp, max, numeric(1))

# Convert to vapply() expression
vapply(temp, function(x, y) { mean(x) > y }, y = 5, logical(1))
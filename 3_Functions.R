# Consult the documentation on the mean() function
?mean  # or help(mean)

# Inspect the arguments of the mean() function
args(mean)

# Number of profile views in the last seven days:
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb <- mean(facebook)

# Inspect avg_li and avg_fb
avg_li  # prints 10.85714
avg_fb  # prints 11.42857

# Calculate the mean of the sum
avg_sum <- mean(linkedin+facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin+facebook, trim=0.2)
# without writing in the trim parameter, it is automatically there as 0)

# Inspect both new variables
avg_sum  # prints 22.28571
avg_sum_trimmed  # prints 22.6

# Replace a couple values with NA
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)  # prints NA

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)  # prints 12.33333
# without writing in the na.rm parameter, it is automatically there as FALSE)

# Calculate the mean absolute deviation
mean(abs(linkedin-facebook),na.rm=TRUE)  # prints 4.8


# WRITING FUNCTIONS

# Create a function pow_two()
pow_two <- function(a){
  a*a
}

# Use the function
pow_two(12)  # prints 144

# Create a function sum_abs()
sum_abs <- function(a,b){
  abs(a) + abs(b)
}

# Use the function
sum_abs(-2,3)  # prints 5

# Define the function hello()
hello<-function(){
  print("Hi there!")
  return (TRUE)
}

# Call the function hello()
hello()  # prints "Hi there!" and TRUE

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  
  return(y)
}

pow_two(12)  # prints "12 to the power two equals 144" and 144

# Number of profile views in the last seven days:
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {  
    # warning message in console: the condition has length > 1 and only the first element will be used
    print("You're popular!")
    return(num_views)  
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Call the interpret function twice
interpret(linkedin)  # prints warning message above, and "You're popular!", and 16  9 13  5  2 17 14
interpret(facebook[2])  # prints "Try to be more visible!" and 0

# The interpret() can be used inside interpret_all()
# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum=TRUE) {
  count <- 0
  for (v in views) {
    count <- count + interpret(v)
  }
  if (return_sum) {
    return(count)
  } else {
    return(NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)  # prints the corresponding string for each element and 33
interpret_all(facebook)  # prints the corresponding string for each element and 33


# R PACKAGES

# install.packages() -  installs a given package; requires administrator privileges
# library() - loads packages, i.e. attaches them to the search list on your R workspace - use search()

# Load the ggplot2 package
library("ggplot2")  # or require("ggplot2")

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)  # displays visual plot

# Check out the currently attached packages again
search()


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
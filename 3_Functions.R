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
# Comparison of logicals
TRUE == FALSE  # prints FALSE

# Comparison of numerics
(-6 * 14) != (17-101)  # prints FALSE

# Comparison of character strings
"useR" == "user"  # prints FALSE

# Compare a logical with a numeric
TRUE == 1  # prints TRUE

# Comparison of numerics
(-6 * 5 + 2) >= -10 + 1  # prints FALSE

# Comparison of character strings
"raining" <= "raining dogs"  # prints TRUE; based on alphabetical order

# Comparison of logicals
TRUE > FALSE  # prints TRUE

# Number of profile views in the last seven days:
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15  # prints vector of TRUEs and FALSEs

# Quiet days
linkedin <=5  # prints vector of TRUEs and FALSEs

# LinkedIn more popular than Facebook
linkedin > facebook  # prints vector of TRUEs and FALSEs

# Creating a matrix with the vectors:
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)
views

# When does views equal 13?
views == 13  # prints matrix of TRUEs and FALSEs

# When is views less than or equal to 14?
views <= 14  # prints matrix of TRUEs and FALSEs

last <- tail(linkedin, 1)
last

# Watch out: 3 < x < 7 to check if x is between 3 and 7 will not work; 
# you'll need 3 < x & x < 7 for that.

# Is last under 5 or above 10?
last < 5 | last > 10  # prints TRUE

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <=20  # prints FALSE

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10  # prints vector of TRUEs and FALSEs

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12  # prints vector of TRUEs and FALSEs

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <=14  # prints matrix of TRUEs and FALSEs

!TRUE  # prints FALSE
!(5 > 3)  # prints FALSE
!!FALSE  # prints FALSE


# li_df ISN'T BUILT HERE SO THE FOLLOWING CODE WON'T RUN

# Select the second column, named day2, from li_df: second
second <- li_df$day2

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- (second  > 25) | (second < 5)

# Count the number of TRUEs in extremes
sum(extremes)


#IF STATEMENT

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")  # prints this
}

# Write the if statement for num_views
if(num_views>15){
  print("You are popular!")  # doesn't print anything
}

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")  # prints this
} else{
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else{
  print("Try to be more visible!")  # prints this
}

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")  # prints this
} else if (medium == "Facebook") {
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  print("Your number of views is average")  # prints this
} else {
  print("Try to be more visible!")
}

# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li>=15 & fb>=15) {
  sms <- 2 * (li + fb)
} else if (li<10 & fb<10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li+fb  # this happens
}

# Print the resulting sms to the console
sms  # prints 24
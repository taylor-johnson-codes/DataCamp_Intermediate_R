# WHILE LOOP

# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")  # prints five times
  speed <- speed -7
}

# Print out the speed variable
speed

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed >48 ) {
    print("Slow down big time!")
    speed <-speed-11
  } else {
    print("Slow down!")
    speed <-speed-6
  }
}
# Prints this:
# [1] "Your speed is 64"
# [1] "Slow down big time!"
# [1] "Your speed is 53"
# [1] "Slow down big time!"
# [1] "Your speed is 42"
# [1] "Slow down!"
# [1] "Your speed is 36"
# [1] "Slow down!"

# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))  # prints this once
  if (speed>80 ) {  # Break the while loop when speed exceeds 80
    break
  }
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3*i)
  if (i%%8==0) {
    break
  }
  i <- i + 1
}
# Prints this:
# [1] 3
# [1] 6
# [1] 9
# [1] 12
# [1] 15
# [1] 18
# [1] 21
# [1] 24


# FOR LOOP

# Number of profile views in the last seven days:
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
linkedin

# Loop version 1
for(i in linkedin){
  print(i)
}

# Loop version 2
for(i in 1:length(linkedin)){
  print(linkedin[i])
}

# Code the for loop with conditionals
for (li in linkedin) {
  if (li>10 ) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  print(li)
}

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  # Add if statement with break
  if(li>16)  {
    print("This is ridiculous, I'm outta here!")
    break
  }
  # Add if statement with next
  if(li<5){
    print("This is too embarrassing!")
    next
  }
  print(li)
}

nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)
nyc

# Loop version 1
for (i in nyc){
  print(i)
}

# Loop version 2
for(i in 1:length(nyc)){
  print(nyc[[i]])
}

# The tic-tac-toe matrix ttt ISN'T DEFINED HERE SO THE CODE WON'T WORK
# ttt:
#      [,1] [,2] [,3]
# [1,] "O"  NA   "X" 
# [2,] NA   "O"  "O" 
# [3,] "X"  NA   "X" 

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains ",ttt[i,j]))
  }
}

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]
chars  # prints this:
# [1] "r" "'" "s" " " "i" "n" "t" "e" "r" "n" "a" "l" "s" " " "a" "r" "e"
# [18] " " "i" "r" "r" "e" "f" "u" "t" "a" "b" "l" "y" " " "i" "n" "t" "r"
# [35] "i" "g" "u" "i" "n" "g"

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if(char=="r"){
    rcount = rcount+1
  } else if(char=="u"){
    break
  }
}

# Print out rcount
rcount  # prints 5
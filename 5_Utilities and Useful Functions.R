# MATH FUNCTIONS

# abs(): Calculate the absolute value.
# sum(): Calculate the sum of all the values in a data structure.
# mean(): Calculate the arithmetic mean.
# round(): Round the values to 0 decimal places by default. 
#          Try out ?round in the console for variations of round() and ways to change the number of digits to round to.

# Errors vector
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)
errors

# Sum of absolute rounded values of errors
sum(round(abs(errors)))  # prints 29

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)  # reverses the order of the elements in the vector
vec2

# Fix the error
mean(abs(vec1))  # prints 4.48

# seq(): Generate sequences, by specifying the from, to, and by arguments.
# rep(): Replicate elements of vectors and lists.
# sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
# rev(): Reverse the elements in a data structures for which reversal is defined.
# str(): Display the structure of any R object.
# append(): Merge vectors or lists.
# is.*(): Check for the class of an R object.
# as.*(): Convert an R object from one class to another.
# unlist(): Flatten (possibly embedded) lists to produce a vector.

# Number of profile views in the last seven days:
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)
social_vec  # prints 16  9 13  5  2 17 14 17  7  5 16  8 13 14

# Sort social_vec
sort(social_vec, decreasing = TRUE)  # prints 17 17 16 16 14 14 13 13  9  8  7  5  5  2

# Replicate elements
rep(seq(1, 7, by = 2), times = 7)  
# prints 1 3 5 7 1 3 5 7 1 3 5 7 1 3 5 7 1 3 5 7 1 3 5 7 1 3 5 7

# Create first sequence: seq1
seq1 <- seq(1, 500, by=3)

# Create second sequence: seq2
seq2 <- seq(1200,900,by=-7)

# Calculate total sum of the sequences
sum(seq1, seq2)  # prints 87029


# REGULAR EXPRESSIONS

# Regular expressions can be used to see whether a pattern exists inside a character string or a vector of character strings. 
# ?regex for documentation
# grepl(pattern = <regex>, x = <string>)
# grepl(), which returns TRUE when a pattern is found in the corresponding character string.
# grep(), which returns a vector of indices of the character strings that contains the pattern.
# sub(pattern = <regex>, replacement = <str>, x = <str>)

# Animals vector
animals <- c("cat", "moose", "impala", "ant", "kiwi")

grepl(pattern = "a", x = animals)  # to find elememts that contain "a"
# prints TRUE FALSE  TRUE  TRUE FALSE

grepl(pattern = "^a", x = animals)  # to find elements that start with "a"
# prints FALSE FALSE FALSE  TRUE FALSE

grepl(pattern = "a$", x = animals)  # to find elements that end with "a"
#prints FALSE FALSE  TRUE FALSE FALSE

grep(pattern = "a", x = animals)  # prints 1 3 4

# to get the same result with gregl():
which(grepl(pattern = "a", x = animals))  # prints 1 3 4

sub(pattern = "a", replacement = "o", x = animals)  # only replaces first "a" in element  
# prints "cot"    "moose"  "impola" "ont"    "kiwi"

gsub(pattern = "a", replacement = "o", x = animals)  # replaces all "a"s in element
# prints "cot"    "moose"  "impolo" "ont"    "kiwi"

gsub(pattern = "a|i|o", replacement = "_", x = animals)  # replace more than one different character in the element
# prints "c_t"    "m__se"  "_mp_l_" "_nt"    "k_w_"


# Emails vector
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl("edu", emails)  # prints vector of TRUEs and FALSEs

# Use grep() to match for "edu", save result to hits
hits <- grep("edu", emails)
hits  # prints 1 2 4 5 (element position/index); Note: element 2 has "edu" but not ".edu", and 4 is invalid

# Subset emails using hits
emails[hits]  # prints the values (email addresses)

# Use grepl() to match for .edu addresses more robustly
grepl("@.*\\.edu$", emails)  # prints vector of TRUEs and FALSEs

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep("@.*\\.edu$", emails)
hits  # prints 1 5

# Subset emails using hits
emails[hits]  # prints the values (email addresses)

# sub() and gsub(): you can specify a replacement argument. If inside the character vector x, the regular expression pattern is found, 
# the matching element(s) will be replaced with replacement.sub() only replaces the first match, whereas gsub() replaces all matches.

# Use sub() to convert the email domains to datacamp.edu
sub("@.*\\.edu$", "@datacamp.edu", emails)  # the valid .edu addresses were replaced with @datacamp.edu


# .*: A usual suspect! It can be read as "any character that is matched zero or more times".
# \\s: Match a space. The "s" is normally a character, escaping it (\\) makes it a metacharacter.
# [0-9]+: Match the numbers 0 to 9, at least once (+).
# ([0-9]+): The parentheses are used to make parts of the matching string available to define the replacement. 
#           The \\1 in the replacement argument of sub() gets set to the string that is captured by the regular expression [0-9]+.


# TIMES & DATES

# Dates are represented by Date objects. Date objects store the number of days since the 1st of January in 1970. 
# Times are represented by POSIXct objects. POSIXct objects store the number of seconds since the 1st of January in 1970.
# Under the hood, dates and times are simple numerical values. 
# The 1st of January in 1970 is the common origin for representing times and dates in a wide range of programming languages. There is no particular reason for this; it is a simple convention. 
# Of course, it's also possible to create dates and times before 1970; the corresponding numerical values are simply negative in this case.

# Get the current date: today
today <- Sys.Date()
today  # prints "2022-02-04" (YYYY-MM-DD)
class(today)  # prints "Date"

# See what today looks like under the hood
unclass(today)  # prints 19027

# Get the current time: now
now <- Sys.time()
now  # prints "2022-02-04 21:40:50 PST"

# See what now looks like under the hood
unclass(now)  # prints 1644039650


# To create a Date object from a simple character string in R, you can use the as.Date() function.

# The following R commands will all create the same Date object for the 13th day in January of 1982:
# as.Date("1982-01-13")  # by default R matches your character string to the formats "%Y-%m-%d" or "%Y/%m/%d"
# as.Date("Jan-13-82", format = "%b-%d-%y")
# as.Date("13 January, 1982", format = "%d %B, %Y")

# Use format() to convert dates to character strings that use a different date notation. 
# today <- Sys.Date()
# format(Sys.Date(), format = "%d %B, %Y")
# format(Sys.Date(), format = "Today is a %A!")

# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")  # prints "Thursday"
format(date2, "%d")  # prints "15"
format(date3, "%b %Y")  # prints "Jan 2006"

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time1  # prints "1996-05-23 23:01:45 PDT"
time2 <- as.POSIXct(str2)
time2  # prints "2012-03-12 14:23:08 PDT"

# Convert times to formatted strings
format(time1, "%M")  # prints "01"
format(time2, "%I:%M %p")  # prints # "02:23 PM"

as.Date("2015-03-12") - as.Date("2015-02-27")
# prints: Time difference of 13 days

as.Date("2015-03-12") - 1
# prints "2015-03-11"


# day1, day2, day3, day4 and day5 NOT DEFINED HERE, CODE WON'T WORK

# Difference between last and first pizza day
day5-day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff<-diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)


now <- Sys.time()
now + 3600          # add an hour
now - 3600 * 24     # subtract a day

birth <- as.POSIXct("1879-03-14 14:37:23")
death <- as.POSIXct("1955-04-18 03:47:12")
einstein <- death - birth
einstein   # prints: Time difference of 27792.55 days


# login and logout NOT DEFINED HERE, CODE WON'T WORK

# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)
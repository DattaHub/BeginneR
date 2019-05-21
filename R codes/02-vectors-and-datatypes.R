
## Description 

# This R file has the same codes as in the slides 
# You can run them line by line by pressing Ctrl/Cmd + Enter 
# The slides and the pdf document explain the context and details.

##-----------------------------------------------------------------------

# You can get output from R simply by typing in math in the console
3 + 5
12/7
2*4
2^4

## Comment 

# I am adding 3 and 5. R is fun!
3 + 5

# Careful about comments

I am adding 3 and 5. R is fun!

3 + 5

## ----- Assignment Operator -------------------------------------------------------------------

# To create objects, we need to give it a name followed by the
# assignment operator `<-` and the value we want to give it.

# assign 3 to a
a <- 3
# assign 5 to b
b <- 5

# what now is a
a
# what now is b
b
# Add a and b
a + b

# The arrow can be read as 3 **goes into** `x`.  
# You can also use `=` for assignments but not in all contexts 
# so it is good practice to use `<-` for assignments.

## RStudio, typing `Alt + -` will write ` <- ` in a single keystroke.

# Ojects we have stored in memory

ls()

# To remove objects we can use the `rm()` command

rm(a)

## See notes on objects on the pdf file (maybe later)

## Functions (see pdf for intro)
# 1. Functions are "canned scripts"
# 2. Either predefined or made available using library 
# 3. A function usually gets one or more inputs called *arguments*. 
# 4. Functions often (but not always) return a *value*.

sqrt(2)


## ---- multiple arguments-----------------------------------------------------
# Can take several arguments, but many have so-called *defaults*.
# If you don't specify such an argument when calling the function, 
# the function will fall back on using the *default*.

## An example 

round(3.14159)

# If we want more digits we need information about the `round` function.
args(round)

?round

round(3.14159, digits = 2)


# If you provide the arguments in the exact same order as they are defined 
# you don't have to name them:

round(3.14159, 2)

# BUT DON'T DO THIS ! 


## -----vectors-------------------------------------------------------------------
# Special lists that you can do math with.
# can assign this list of values to a variable, 
# Add elements to your vector by using the `c()` function, (combine):

one_to_five <- c(1, 2, 3, 4, 5)
one_to_five <- 1:5
one_to_five


## -----charcter vectors-------------------------------------------------------------------
primary_colors <- c("red", "yellow", "blue")
primary_colors


## ------length ------------------------------------------------------------------
length(one_to_five)
length(primary_colors)


## -------vector operations-----------------------------------------------------------------

5 * one_to_five


## --------adding whole vectors ----------------------------------------------------------------
two_to_ten <- one_to_five + one_to_five
two_to_ten

#####  Danger!!!!!!!!!!!

(1:2) + (1:3)                # c(1,2) recycled until same length

(1:2) + (1:4)                # c(1,2) recycled, but NO WARNING


## -------- class ----------------------------------------------------------------
class(one_to_five)
class(primary_colors)


## ----------appending -------------------------------------------------------------
new_digits <- c(one_to_five, 90) # adding at the end
new_digits <- c(30, new_digits) # adding at the beginning
new_digits


## ---------dividing---------------------------------------------------------------
divided_integers <- one_to_five/2
divided_integers

class(divided_integers)


## ----------indexing--------------------------------------------------------------
one_to_five[3]
one_to_five[1:3]
one_to_five[c(1, 3, 5)]
one_to_five[-2]


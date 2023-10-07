
## From `R` package 

# Reading data that is already in an `R` package. 
# Sometimes you need to install a package, and sometimes it is already pre-installed in R. 
# If you type `data()` into your console, you'll see a list of datasets. 

data()

# 1. Loading 
data("mtcars")
# 2. Print
head(mtcars)

## From an URL 
# You can also read a CSV file directly from an URL where it is hosted. 

arbuthnot <- read.csv("https://www.openintro.org/data/csv/arbuthnot.csv")
head(arbuthnot)

## Reading an external CSV file 
## ---- Current working directory ---------------------------------------------
# To view your current working directory use the `getwd()` command
getwd()

## ---- Setting working Directory ------------------------------------------------------
# To set you working directory, use the `setwd()` command. 
# We want to set the working directory to the location of our project.

## Or wherever you're saving your codes 

setwd("~/GitHub/BeginneR/R codes")

## ----- Reading a CSV file ------------------------------------------------------------------
# R function  `read.csv()` to load the data file into memory 
# 'data' is the subfolder 

oscars <- read.csv(file = 'data/herding-oscars-small.csv', 
                 stringsAsFactors = TRUE)


## -- Check data ----------------------------------------------------------------------
# If we want to check that our data has been loaded, we can print the
# variable's value
oscars


## ---- What's inside? ---------------------------------------------------------
# if our dataset was larger, we probably wouldn't want to print the whole
# thing - instead use the `head` command to view the first six lines or
# the `View` command to open the dataset

head(oscars)

head(oscars, n = 2)
View(oscars)


### Now, we will read a dataset and look at its properties. 

oscars <- read.csv("https://www.openintro.org/data/csv/oscars.csv", 
                   stringsAsFactors = TRUE)


## ------Structure of the data ------------------------------------------------------------------
# `data.frame` is actually a `list` of column vectors of identical lengths
# The `str()` function is useful to inspect the data types of the columns.

str(oscars)

# *Remark* By default, `data.frame` converts (= coerces) columns 
# that contain characters (i.e., text) into the `factor` data type.
# Can control by setting  `stringsAsFactors` to `FALSE`

## Excs: Look at the pdf here for a list of functions and use them

## ----Indexing the data.frame ----------------------------------------------------------
# If we want to extract some specific data from it,
# we need to specify the "coordinates" (i.e. [row, column]).

oscars[1, 2]   # first element in the 2nd column of the data frame
oscars[1, 6]   # first element in the 6th column
oscars[1:3, 7] # first three elements in the 7th column
oscars[10, ]    # the 3rd element for all columns
oscars[, 7]    # the entire 7th column

head_meta <- oscars[1:6, ] # Row 1-6 which is the same as head


## ------operations on a particular column------------------------------------------------------------------
## For larger data-sets, difficult to remember the column number 
## for a particular variable - better to call them by name 

colnames(oscars)
oscars$age

oscars$birth_y


## ----Multiple columns--------------------------------------------------------------------
# Select more than one columns use the square brackets

oscars[ , c("age", "birth_pl", "age")]


## ------------------------------------------------------------------------
# column name _and_ select specific rows of interest
# use logical statements to select and filter items from a `data.frame`

oscars[4:7, c("age", "birth_pl")]


## ------------------------------------------------------------------------
oscars$birth_pl == "Virginia"

oscars[oscars$birth_pl == "Virginia", ]

oscars[oscars$age == 22, ]

## ------------------------------------------------------------------------
# The logical statement returns a vector of `TRUE` and `FALSE` values. 
which(oscars$birth_pl == "Virginia")


## ----use 'which'--------------------------------------------------------------------
# `which()` finds the indexes of records meeting a logical statement

va_oscars_idx = which(oscars$birth_pl == "Virginia")

which(oscars$birth_pl == "Virginia")

## ------------------------------------------------------------------------
## We could also write this ugly statement 

oscars[which(oscars$birth_pl == "Virginia"), ]

oscars[va_oscars_idx,]

## ------------------------------------------------------------------------
# We can combine logical statements and index statements

oscars[oscars$birth_pl == "Virginia", c("name", "birth_pl", "age")]



## ------Logical operators------------------------------------------------------------------
# Use `&`, the symbol for "and", and `|`, the symbol for "or".

oscars$birth_pl == "Virginia" & oscars$award == "Best actor"
oscars[oscars$birth_pl == "Virginia" & oscars$award == "Best actor", ]


## Factors

# Factors are used to represent categorical data. 
# Factors can be ordered or unordered and important for statistical analysis 

# Factors are stored as integers, and have labels associated with these unique
# integers. Look (and often behave) like character vectors, they are
# actually integers under the hood.

## ------------------------------------------------------------------------
str(oscars)


## ------------------------------------------------------------------------
levels(oscars$birth_pl)
nlevels(oscars$birth_pl)

## 

oscars$birth_pl <- as.factor(oscars$birth_pl)

levels(oscars$birth_pl)

nlevels(oscars$birth_pl)
## ---- Ordered vs Unorderd ---------------------------------------------------------
# Sometimes, the order of the factors does not matter, other times you might want
# to specify the order.

satisfaction <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(satisfaction)
satisfaction <- factor(satisfaction, levels = c("low", "medium", "high"))
levels(satisfaction)
min(satisfaction) ## doesn't work
satisfaction <- factor(satisfaction, levels = c("low", "medium", "high"), ordered = TRUE)
levels(satisfaction)
min(satisfaction) ## works!


## ------Converting Factors------------------------------------------------------------------
# If you need to convert a factor to a character vector, simply use
# `as.character(x)`.

# Converting a factor to a numeric vector is however a little trickier, and you
# have to go via a character vector

f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]    ## The recommended way.


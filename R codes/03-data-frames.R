
## ---- Current working directory ---------------------------------------------
# To view your current working directory use the `getwd()` command
getwd()


## ---- Setting working Directory ------------------------------------------------------
# To set you working directory, use the `setwd()` command. 
# We want to set the working directory to the location of our project.

# setwd("C:/Users/jd033/Box/R Users Group- UA/BeginneR/R codes")

## Or wherever you're saving your codes 

## setwd("~/Documents/R") 

setwd("~/GitHub/BeginneR/R codes")

## ----- Reading a CSV file ------------------------------------------------------------------
# R function  `read.csv()` to load the data file into memory 
# 'data' is the subfolder 

cats <- read.csv(file = 'data/herding-cats-small.csv')


## -- Check data ----------------------------------------------------------------------
# If we want to check that our data has been loaded, we can print the
# variable's value

cats


## ---- What's inside? ---------------------------------------------------------
# if our dataset was larger, we probably wouldn't want to print the whole
# thing - instead use the `head` command to view the first six lines or
# the `View` command to open the dataset

head(cats, n = 2)
View(cats)


## ------Structure of the data ------------------------------------------------------------------
# `data.frame` is actually a `list` of column vectors of identical lengths
# The `str()` function is useful to inspect the data types of the columns.

str(cats)

# *Remark* By default, `data.frame` converts (= coerces) columns 
# that contain characters (i.e., text) into the `factor` data type.
# Can control by setting  `stringsAsFactors` to `FALSE`

## Excs: Look at the pdf here for a list of functions and use them

## ----Indexing the data.frame ----------------------------------------------------------
# If we want to extract some specific data from it,
# we need to specify the "coordinates" (i.e. [row, column]).

cats[1, 2]   # first element in the 2nd column of the data frame
cats[1, 6]   # first element in the 6th column
cats[1:3, 7] # first three elements in the 7th column
cats[3, ]    # the 3rd element for all columns
cats[, 7]    # the entire 7th column

head_meta <- cats[1:6, ] # Row 1-6 which is the same as head


## ------operations on a particular column------------------------------------------------------------------
## For larger data-sets, difficult to remember the column number 
## for a particular variable - better to call them by name 

colnames(cats)
cats$weight

cats$wander_dist


## ----Multiple columns--------------------------------------------------------------------
# Select more than one columns use the square brackets

cats[ , c("weight", "coat", "sex")]


## ------------------------------------------------------------------------
# column name _and_ select specific rows of interest
# use logical statements to select and filter items from a `data.frame`

cats[4:7, c("weight", "coat")]


## ------------------------------------------------------------------------
cats[cats$coat == "black", ]

cats[cats$sex == "female", ]

## ------------------------------------------------------------------------
# The logical statement returns a vector of `TRUE` and `FALSE` values. 
cats$coat == "black"


## ----use 'which'--------------------------------------------------------------------
# `which()` finds the indexes of records meeting a logical statement

black_cat_idx = which(cats$coat == "black")



## ------------------------------------------------------------------------
## We could also write this ugly statement 

cats[which(cats$coat == "black"), ]

cats[black_cat_idx,]

## ------------------------------------------------------------------------
# We can combine logical statements and index statements

cats[cats$coat == "black", c("coat", "weight")]



## ------Logical operators------------------------------------------------------------------
# Use `&`, the symbol for "and", and `|`, the symbol for "or".

cats[cats$coat == "black" & cats$roamer == "no", ]


## Factors

# Factors are used to represent categorical data. 
# Factors can be ordered or unordered and important for statistical analysis 

# Factors are stored as integers, and have labels associated with these unique
# integers. Look (and often behave) like character vectors, they are
# actually integers under the hood.

## ------------------------------------------------------------------------
str(cats)


## ------------------------------------------------------------------------
levels(cats$coat)
nlevels(cats$coat)


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


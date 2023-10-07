## ---- eval = TRUE--------------------------------------------------------
install.packages("rmarkdown", repos="http://cran.rstudio.com/")


## ---- eval = TRUE--------------------------------------------------------
as.vector(installed.packages()[,"Package"])


## ---- eval = TRUE--------------------------------------------------------
library(rmarkdown)  # notice the lack of quotes


## ---- eval = TRUE--------------------------------------------------------
(.packages())


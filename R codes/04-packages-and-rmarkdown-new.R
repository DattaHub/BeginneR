## ---- how to install packages --------------------------------------------------------
install.packages("rmarkdown", repos="http://cran.rstudio.com/")


## ---- list of all packages that are already installed --------------------------------------------------------
as.vector(installed.packages()[,"Package"])


## ---- load the package--------------------------------------------------------
library(rmarkdown)  # notice the lack of quotes

# This will come up again later in the lesson on dplyr, an external package that does need to be
# loaded.

## ---- view the packages that you have loaded into your workspace--------------------------------------------------------
(.packages())


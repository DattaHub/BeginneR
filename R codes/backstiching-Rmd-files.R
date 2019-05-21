
library(knitr)
knitr::purl("01-what-is-R.Rmd")
knitr::purl("02-vectors-and-datatypes.Rmd")
knitr::purl("03-data-frames.Rmd")
knitr::purl("04-packages-and-rmarkdown.Rmd")
knitr::purl("05-dplyr.Rmd")
knitr::purl("06-data-visualization.Rmd")
knitr::purl("07-statistics.Rmd")


knitr::spin("intro_R_0.R", format = 'Rmd')

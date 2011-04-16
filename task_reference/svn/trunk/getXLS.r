## this will be a method of reading in excel files into data frame
## with the gdata package
## $apt-get install r-cran-gdata was done in addition
## to install.packages("gdata")

require(gdata)




petro <- read.xls("~/Dropbox/DATA/SAMPLE/petro.xls", sheet = 2)

str (petro)
tail (petro)



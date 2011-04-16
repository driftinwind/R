require(quantmod)

EGGS <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$EGGS.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))

head(EGGS)

chartSeries(EGGS)
require(quantmod)

CORN <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$CORN.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))
FIVE <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$TY5YR.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))

# head(CORN)
# head(FIVE)

CORN <- CORN["1970::2009"]
FIVE <- FIVE["1970::2009"]

# length(CORN)
# length(FIVE)

# corn <- as.ts(CORN)
# five <- as.ts(FIVE)
# 
# ccf(corn, five, lag.max=300, main="Corn and 5-Year Treasury")

CORN.d <- Delt(CORN)
FIVE.d <- Delt(FIVE)

CORN.D <- na.locf(CORN.d, na.rm=TRUE)
FIVE.D <- na.locf(FIVE.d, na.rm=TRUE)

# head(CORN.D)
# head(FIVE.D)

cor(CORN.D, FIVE.D)
cor(CORN, FIVE)
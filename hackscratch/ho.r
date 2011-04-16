require("quantmod")

HO <- read.csv("~/Dropbox/DATA/IDXDATA/$HO.CSV")

head(HO)

# names(HO) <- c("Date", "Price")

# head(HO)

as.zoo("HO")

head (HO)

plot(HO, type="b")

# chartSeries(HO)
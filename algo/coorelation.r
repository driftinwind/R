require(quantmod)

DX <- as.xts(read.zoo("USDX.CSV"    , sep=",", format ="%m/%d/%Y", header=TRUE))
TY <- as.xts(read.zoo("TY10YR.CSV"  , sep=",", format ="%m/%d/%Y", header=TRUE))

x <- merge(DX, TY)


cor(x, use="complete.obs")

# z <- rollapply(x, 30, cor, by.column=F, align = "right")
# 
# chartSeries(z)

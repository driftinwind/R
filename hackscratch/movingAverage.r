require("quantmod")

getSymbols("GLD")


GLD_SMA_200 <- SMA(GLD[,4], 200)
GLD_SMA_50  <- SMA(GLD[,4], 50)

GLD_SMA     <- merge(GLD[,4], GLD_SMA_50, GLD_SMA_200)

ll <- tail (GLD_SMA_200, n=1)

tail (GLD_SMA, n=1)

ll
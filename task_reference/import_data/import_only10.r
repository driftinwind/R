
require("quantmod")

getSymbols("MMM;AA")

# limit data to OHLC only

MMM <- MMM[,c(1:4)]
AA  <-  AA[,c(1:4)]

# limit data to yesterday only

MMM <- tail(MMM, n=1)
AA  <- tail(AA, n=1)

# coerce to vectors

MMM <- as.vector(MMM)
AA  <- as.vector(AA)

dow <- rbind(MMM, AA)


tail(dow)
require("quantmod")

getSymbols("AA;MMM")

AA  <- AA[,4]
MMM <- MMM[,4]

AA  <- AA[1,]
MMM <- MMM[1,]

AA  <- as.vector(AA)
MMM <- as.vector(MMM)

class(AA)

AM <- rbind(AA, MMM)

AM


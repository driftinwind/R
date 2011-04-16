require(quantmod)

getSymbols("WRESCRT;PPIACO", src="FRED") 

head(PPIACO)
head(WRESCRT)

W <- to.monthly(WRESCRT)
P <- to.monthly(PPIACO)

W.c <- W[,4]
P.c <- P[,4]

PP <- P.c['1991::2010']
WW <- W.c['1991::2010']

head(PP)
head(WW)

length(PP)
length(WW)

WWW <- as.ts(WW)
PPP <- as.ts(PP)

ccf(WWW, PPP, lag.max=300, main="WRESCRT & PPIACO")
## getXts:getSection:getManyplots

require(quantmod)

silver <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SILVER.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


## segment a series of months

silverOCT1990 <- silver ["199010"]
silverOCT1991 <- silver ["199110"]
silverOCT1992 <- silver ["199210"]
silverOCT1993 <- silver ["199310"]
silverOCT1994 <- silver ["199410"]
silverOCT1995 <- silver ["199510"]
silverOCT1996 <- silver ["199610"]
silverOCT1997 <- silver ["199710"]
silverOCT1998 <- silver ["199810"]
silverOCT1999 <- silver ["199910"]
silverOCT2000 <- silver ["200010"]
silverOCT2001 <- silver ["200110"]
silverOCT2002 <- silver ["200210"]
silverOCT2003 <- silver ["200310"]
silverOCT2004 <- silver ["200410"]
silverOCT2005 <- silver ["200510"]
silverOCT2006 <- silver ["200610"]
silverOCT2007 <- silver ["200710"]
silverOCT2008 <- silver ["200810"]
silverOCT2009 <- silver ["200910"]
silverOCT2010 <- silver ["201010"]

## turn on png output device

png("octSilver.png")

## create multipane plot

par(mfrow=c(4,5))

plot (silverOCT1990)
plot (silverOCT1991)
plot (silverOCT1992)
plot (silverOCT1993)
plot (silverOCT1994)
plot (silverOCT1995)
plot (silverOCT1996)
plot (silverOCT1997)
plot (silverOCT1998)
plot (silverOCT1999)
plot (silverOCT2000)
plot (silverOCT2001)
plot (silverOCT2002)
plot (silverOCT2003)
plot (silverOCT2004)
plot (silverOCT2005)
plot (silverOCT2006)
plot (silverOCT2007)
plot (silverOCT2008)
plot (silverOCT2009)
                 


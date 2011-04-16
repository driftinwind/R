## getXts:getSection:getManyplots

require(quantmod)

gold <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$GOLD.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


## segment a series of months

goldOCT1990 <- gold ["199010"]
goldOCT1991 <- gold ["199110"]
goldOCT1992 <- gold ["199210"]
goldOCT1993 <- gold ["199310"]
goldOCT1994 <- gold ["199410"]
goldOCT1995 <- gold ["199510"]
goldOCT1996 <- gold ["199610"]
goldOCT1997 <- gold ["199710"]
goldOCT1998 <- gold ["199810"]
goldOCT1999 <- gold ["199910"]
goldOCT2000 <- gold ["200010"]
goldOCT2001 <- gold ["200110"]
goldOCT2002 <- gold ["200210"]
goldOCT2003 <- gold ["200310"]
goldOCT2004 <- gold ["200410"]
goldOCT2005 <- gold ["200510"]
goldOCT2006 <- gold ["200610"]
goldOCT2007 <- gold ["200710"]
goldOCT2008 <- gold ["200810"]
goldOCT2009 <- gold ["200910"]
goldOCT2010 <- gold ["201010"]

## turn on png output device

png("octGold.png")

## create multipane plot

par(mfrow=c(4,5))

plot (goldOCT1990)
plot (goldOCT1991)
plot (goldOCT1992)
plot (goldOCT1993)
plot (goldOCT1994)
plot (goldOCT1995)
plot (goldOCT1996)
plot (goldOCT1997)
plot (goldOCT1998)
plot (goldOCT1999)
plot (goldOCT2000)
plot (goldOCT2001)
plot (goldOCT2002)
plot (goldOCT2003)
plot (goldOCT2004)
plot (goldOCT2005)
plot (goldOCT2006)
plot (goldOCT2007)
plot (goldOCT2008)
plot (goldOCT2009)
                 


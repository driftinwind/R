## getXts:getSection:getManyplots

require(quantmod)

sugar <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SUGAR.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))

## segment a series of months


sugarOCT1990 <- sugar ["199010"]
sugarOCT1991 <- sugar ["199110"]
sugarOCT1992 <- sugar ["199210"]
sugarOCT1993 <- sugar ["199310"]
sugarOCT1994 <- sugar ["199410"]
sugarOCT1995 <- sugar ["199510"]
sugarOCT1996 <- sugar ["199610"]
sugarOCT1997 <- sugar ["199710"]
sugarOCT1998 <- sugar ["199810"]
sugarOCT1999 <- sugar ["199910"]
sugarOCT2000 <- sugar ["200010"]
sugarOCT2001 <- sugar ["200110"]
sugarOCT2002 <- sugar ["200210"]
sugarOCT2003 <- sugar ["200310"]
sugarOCT2004 <- sugar ["200410"]
sugarOCT2005 <- sugar ["200510"]
sugarOCT2006 <- sugar ["200610"]
sugarOCT2007 <- sugar ["200710"]
sugarOCT2008 <- sugar ["200810"]
sugarOCT2009 <- sugar ["200910"]
sugarOCT2010 <- sugar ["201010"]

## turn on png output device

png("octSugar.png")

## create multipane plot

par(mfrow=c(4,5))

plot (sugarOCT1990)
plot (sugarOCT1991)
plot (sugarOCT1992)
plot (sugarOCT1993)
plot (sugarOCT1994)
plot (sugarOCT1995)
plot (sugarOCT1996)
plot (sugarOCT1997)
plot (sugarOCT1998)
plot (sugarOCT1999)
plot (sugarOCT2000)
plot (sugarOCT2001)
plot (sugarOCT2002)
plot (sugarOCT2003)
plot (sugarOCT2004)
plot (sugarOCT2005)
plot (sugarOCT2006)
plot (sugarOCT2007)
plot (sugarOCT2008)
plot (sugarOCT2009)
                 


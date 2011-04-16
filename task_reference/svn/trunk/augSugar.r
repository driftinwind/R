## getXts:getSection:getManyplots

require(quantmod)

sugar  <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SUGAR.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


## segment a series of months

sugarAUG1990 <- sugar ["199008"]
sugarAUG1991 <- sugar ["199108"]
sugarAUG1992 <- sugar ["199208"]
sugarAUG1993 <- sugar ["199308"]
sugarAUG1994 <- sugar ["199408"]
sugarAUG1995 <- sugar ["199508"]
sugarAUG1996 <- sugar ["199608"]
sugarAUG1997 <- sugar ["199708"]
sugarAUG1998 <- sugar ["199808"]
sugarAUG1999 <- sugar ["199908"]
sugarAUG2000 <- sugar ["200008"]
sugarAUG2001 <- sugar ["200108"]
sugarAUG2002 <- sugar ["200208"]
sugarAUG2003 <- sugar ["200308"]
sugarAUG2004 <- sugar ["200408"]
sugarAUG2005 <- sugar ["200508"]
sugarAUG2006 <- sugar ["200608"]
sugarAUG2007 <- sugar ["200708"]
sugarAUG2008 <- sugar ["200808"]
sugarAUG2009 <- sugar ["200908"]
sugarAUG2010 <- sugar ["201008"]


## turn on png output device

png("augSugar.png")

## create multipane plot

par(mfrow=c(4,5))

plot (sugarAUG1990)
plot (sugarAUG1991)
plot (sugarAUG1992)
plot (sugarAUG1993)
plot (sugarAUG1994)
plot (sugarAUG1995)
plot (sugarAUG1996)
plot (sugarAUG1997)
plot (sugarAUG1998)
plot (sugarAUG1999)
plot (sugarAUG2000)
plot (sugarAUG2001)
plot (sugarAUG2002)
plot (sugarAUG2003)
plot (sugarAUG2004)
plot (sugarAUG2005)
plot (sugarAUG2006)
plot (sugarAUG2007)
plot (sugarAUG2008)
plot (sugarAUG2009)
                 


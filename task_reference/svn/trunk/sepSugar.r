## getXts:getSection:getManyplots

require(quantmod)

sugar  <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SUGAR.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


## segment a series of months

sugarSEP1990 <- sugar ["199009"]
sugarSEP1991 <- sugar ["199109"]
sugarSEP1992 <- sugar ["199209"]
sugarSEP1993 <- sugar ["199309"]
sugarSEP1994 <- sugar ["199409"]
sugarSEP1995 <- sugar ["199509"]
sugarSEP1996 <- sugar ["199609"]
sugarSEP1997 <- sugar ["199709"]
sugarSEP1998 <- sugar ["199809"]
sugarSEP1999 <- sugar ["199909"]
sugarSEP2000 <- sugar ["200009"]
sugarSEP2001 <- sugar ["200109"]
sugarSEP2002 <- sugar ["200209"]
sugarSEP2003 <- sugar ["200309"]
sugarSEP2004 <- sugar ["200409"]
sugarSEP2005 <- sugar ["200509"]
sugarSEP2006 <- sugar ["200609"]
sugarSEP2007 <- sugar ["200709"]
sugarSEP2008 <- sugar ["200809"]
sugarSEP2009 <- sugar ["200909"]
sugarSEP2010 <- sugar ["201009"]


## turn on png output device

png("sepSugar.png")

## create multipane plot

par(mfrow=c(4,5))

plot (sugarSEP1990)
plot (sugarSEP1991)
plot (sugarSEP1992)
plot (sugarSEP1993)
plot (sugarSEP1994)
plot (sugarSEP1995)
plot (sugarSEP1996)
plot (sugarSEP1997)
plot (sugarSEP1998)
plot (sugarSEP1999)
plot (sugarSEP2000)
plot (sugarSEP2001)
plot (sugarSEP2002)
plot (sugarSEP2003)
plot (sugarSEP2004)
plot (sugarSEP2005)
plot (sugarSEP2006)
plot (sugarSEP2007)
plot (sugarSEP2008)
plot (sugarSEP2009)
                 


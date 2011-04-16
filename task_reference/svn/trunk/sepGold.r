## getXts:getSection:getManyplots

require(quantmod)

gold <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$GOLD.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))


## segment a series of months

goldSEP1990 <- gold ["199009"]
goldSEP1991 <- gold ["199109"]
goldSEP1992 <- gold ["199209"]
goldSEP1993 <- gold ["199309"]
goldSEP1994 <- gold ["199409"]
goldSEP1995 <- gold ["199509"]
goldSEP1996 <- gold ["199609"]
goldSEP1997 <- gold ["199709"]
goldSEP1998 <- gold ["199809"]
goldSEP1999 <- gold ["199909"]
goldSEP2000 <- gold ["200009"]
goldSEP2001 <- gold ["200109"]
goldSEP2002 <- gold ["200209"]
goldSEP2003 <- gold ["200309"]
goldSEP2004 <- gold ["200409"]
goldSEP2005 <- gold ["200509"]
goldSEP2006 <- gold ["200609"]
goldSEP2007 <- gold ["200709"]
goldSEP2008 <- gold ["200809"]
goldSEP2009 <- gold ["200909"]
goldSEP2010 <- gold ["201009"]


## turn on png output device

png("sepGold.png")

## create multipane plot

par(mfrow=c(4,5))

plot (goldSEP1990)
plot (goldSEP1991)
plot (goldSEP1992)
plot (goldSEP1993)
plot (goldSEP1994)
plot (goldSEP1995)
plot (goldSEP1996)
plot (goldSEP1997)
plot (goldSEP1998)
plot (goldSEP1999)
plot (goldSEP2000)
plot (goldSEP2001)
plot (goldSEP2002)
plot (goldSEP2003)
plot (goldSEP2004)
plot (goldSEP2005)
plot (goldSEP2006)
plot (goldSEP2007)
plot (goldSEP2008)
plot (goldSEP2009)
                 


## getXts:getSection:getManyplots

require(quantmod)

gold <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$GOLD.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))
silver <- as.xts(read.zoo("~/Dropbox/DATA/IDXDATA/$SILVER.CSV", sep=",", format ="%m/%d/%Y", header=TRUE))

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






## silver indexed


silverSEP1990 <- silver ["199009"]
silverSEP1991 <- silver ["199109"]
silverSEP1992 <- silver ["199209"]
silverSEP1993 <- silver ["199309"]
silverSEP1994 <- silver ["199409"]
silverSEP1995 <- silver ["199509"]
silverSEP1996 <- silver ["199609"]
silverSEP1997 <- silver ["199709"]
silverSEP1998 <- silver ["199809"]
silverSEP1999 <- silver ["199909"]
silverSEP2000 <- silver ["200009"]
silverSEP2001 <- silver ["200109"]
silverSEP2002 <- silver ["200209"]
silverSEP2003 <- silver ["200309"]
silverSEP2004 <- silver ["200409"]
silverSEP2005 <- silver ["200509"]
silverSEP2006 <- silver ["200609"]
silverSEP2007 <- silver ["200709"]
silverSEP2008 <- silver ["200809"]
silverSEP2009 <- silver ["200909"]
silverSEP2010 <- silver ["201009"]

## turn on png output device

png("sepSilver.png")

## create multipane plot

par(mfrow=c(4,5))

plot (silverSEP1990)
plot (silverSEP1991)
plot (silverSEP1992)
plot (silverSEP1993)
plot (silverSEP1994)
plot (silverSEP1995)
plot (silverSEP1996)
plot (silverSEP1997)
plot (silverSEP1998)
plot (silverSEP1999)
plot (silverSEP2000)
plot (silverSEP2001)
plot (silverSEP2002)
plot (silverSEP2003)
plot (silverSEP2004)
plot (silverSEP2005)
plot (silverSEP2006)
plot (silverSEP2007)
plot (silverSEP2008)
plot (silverSEP2009)
                 


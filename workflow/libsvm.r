# this is from memory and may not actually work
#  the error is likely in the timing of when to lag stuff 
#  need to go to bed to bother with figuring it all out







CAC     <- as.xts(read.zoo("~/Downloads/dataset(9).csv", skip=4, header=TRUE, format="%d-%b-%Y", sep=","))
CAC     <- CAC[,1]
CAC$ret <- dailyReturn(CAC)
# CAC$cac.lag <- Lag(CAC$ret)  # this was dumb here
CAC     <- CAC[,2]
names(CAC) <- "ret"

# get SPX returns and then match them up (simple returns)

SPX     <- as.xts(read.zoo("~/Downloads/dataset(15).csv", skip=4, header=TRUE, format="%d-%b-%Y", sep=","))
SPX     <- SPX[,1]
SPX$ret <- dailyReturn(SPX)
SPX     <- SPX[,2]
names(SPX) <- "SPX"

CAC     <- merge(CAC, SPX)

# return to zoo - can't remember why though

CAC     <- as.zoo(CAC)
CAC     <- na.locf(CAC)

#  rollapply the correlation function across the two vectors
#  the [,2] index takes only one of four values being returned, for neatness

CAC$cor <- rollapply(CAC, 30, cor, by.column=FALSE, align="right")[,2]
CAC <- na.locf(CAC)



CAC$cac.lag <- Lag(CAC$cor)
CAC <- na.locf(CAC)

# maybe lag it here ?

CAC <- CAC[,3]
CAC <- Lag(CAC)
cac <- CAC[,4]

mess <- merge(SPX, cac)  # and dax, djx, rut, hang, ftse, etc.

# import the function

grouper <- function(x)

{
		if ( x >= 0.01 )
         return (1)
    else if (x >= 0 && x < 0.01)
         return (2)	
    else if (x < 0 && x > -0.01)
         return (3)
    else
         return (4)          
}



now <- cbind(numbers, apply(numbers,1, function(x)grouper(x[1])))

write.table(now, "~/cor")

$> awk '{print $9 "1:" $2 ....}' cor > corr

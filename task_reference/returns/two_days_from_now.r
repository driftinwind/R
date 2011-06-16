# the head of this data is garbage
# specifically, the first three days because of the issue 
# of looking into the future

require(quantmod)

getSymbols("^GSPC")

SPX <- GSPC[,4]

SPX$ret <- dailyReturn(Cl(SPX), type="log")

SPX$ret.tomorrow       <- lag(SPX$ret, k=-1)
SPX$ret.two_days_later <- lag(SPX$ret, k=-2)

# a quick throw-away function

retsum <- function(x,y){n <- exp(sum(x,y)); return(n)}

# the value in ret.sum is what the return will be from today to two days from today
# you need to take (1 - ret.sum) to get the actual percent return

SPX$ret.sum <- apply(SPX, 1, function(x)retsum(x[3], x[4]))

head(SPX)

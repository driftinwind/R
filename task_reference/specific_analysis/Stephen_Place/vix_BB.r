# if(high > uppperband)
# threshold = high;
# 
# if(close > threshold)
# threshold = 10000;
# return(1);



getSymbols("^GSPC;VIX")

VIX$sig <- diff(VIX$thresh)

na_make <- function(x){ifelse(x < 2, NA, x)}

signal <- function(x,y){ifelse(x>y, 1, 0)}

shrinker <- shrink[!duplicated(shrink[,'Thresh']),]

SPX$ret.4 <- lag(SPX$ret, k=-4, type='log')

quad <- function(x,y,z,a){n <- x+y+z+a; return(exp(n))}

mess$thrice <- apply(mess, 1, function(x)thrice(x[3], x[6], x[4]))
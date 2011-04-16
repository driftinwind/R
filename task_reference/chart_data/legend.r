# Import a time series first to illustrate

require("quantmod")
getSymbols("SLV")
SLV <- merge(SLV[,6], lag(SLV[,6],24))
SLV <- na.locf(SLV, na.rm=TRUE)
lag_diff <- function(x,y){
	pdiff <- (x - y)/y
	return(pdiff)
}
SLV <- cbind(SLV, apply(SLV,1, function(x)lag_diff(x[1],x[2])))
change <- SLV[,3]
dens   <- density(change)

plot(dens)

q75 <- .1
q95 <- .4
q10 <- -0.4
q35 <- -0.1

x1 <- min(which(dens$x >= q75))  
x2 <- max(which(dens$x <  q95))
x3 <- min(which(dens$x >= q10))  
x4 <- max(which(dens$x <  q35))

with(dens, polygon(x=c(x[c(x1,x1:x2,x2)]), y= c(0, y[x1:x2], 0), col="gray"))
with(dens, polygon(x=c(x[c(x3,x3:x4,x4)]), y= c(0, y[x3:x4], 0), col="gray"))


###################################
###################################
###################################


legend("topleft", paste("hello", "\n", 
                        "top value =", q75, "\n"), 

                                                   cex = .7)
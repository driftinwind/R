
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

q75 <- quantile(change, .05)
q95 <- quantile(change, .95)

require("ggplot2")

dd <- with(dens,data.frame(x,y))

qplot(x,y,data=dd,geom="line")
  geom_ribbon(data=subset(dd,x>q75 & x<q95),aes(ymax=y),ymin=0,
              fill="red",colour=NA,alpha=0.5)

#Joshua Ulrich author, but found in PhyWallStreet blog

 # This function gives us some standard summary
# statistics for our trades.

tradeStats <- function(signals, returns) {

# Inputs:
# signals : trading signals
# returns : returns corresponding to signals
# Combine data and convert to data.frame

sysRet <- signals * returns * 100
posRet <- sysRet > 0 # Positive rule returns
negRet <- sysRet < 0 # Negative rule returns
dat <- cbind(signals,posRet*100,sysRet[posRet],sysRet[negRet],1)
dat <- as.data.frame(dat)

# Aggreate data for summary statistics

means <- aggregate(dat[,2:4], by=list(dat[,1]), mean, na.rm=TRUE)
medians <- aggregate(dat[,3:4], by=list(dat[,1]), median, na.rm=TRUE)
sums <- aggregate(dat[,5], by=list(dat[,1]), sum)
colnames(means) <- c("Signal","% Win","Mean Win","Mean Loss")
colnames(medians) <- c("Signal","Median Win","Median Loss")
colnames(sums) <- c("Signal","# Trades")
all <- merge(sums,means)
all <- merge(all,medians)
wl <- cbind( abs(all[,"Mean Win"]/all[,"Mean Loss"]),
abs(all[,"Median Win"]/all[,"Median Loss"]) )
colnames(wl) <- c("Mean W/L","Median W/L")
all <- cbind(all,wl)
return(all)
}
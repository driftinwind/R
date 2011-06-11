require("quantmod")

getSymbols({"SPY;IWM;QQQ;DIA"})

SPY$ret <- dailyReturn(Cl(SPY))
IWM$ret <- dailyReturn(Cl(IWM))
QQQ$ret <- dailyReturn(Cl(QQQ))
DIA$ret <- dailyReturn(Cl(DIA))

spy <- SPY[,7]
iwm <- IWM[,7]
qqq <- QQQ[,7]
dia <- DIA[,7]

s.iwm <- merge(spy, iwm)
s.qqq <- merge(spy, qqq)
s.dia <- merge(spy, dia)

# a little trouble with xts, so we gotta do this

s.iwm <- as.zoo(s.iwm)
s.qqq <- as.zoo(s.qqq)
s.dia <- as.zoo(s.dia)

head(s.iwm)

s.iwm$cor <- rollapply(s.iwm, 30, cor, by.column=FALSE, align="right")[,2]
s.qqq$cor <- rollapply(s.qqq, 30, cor, by.column=FALSE, align="right")[,2]
s.dia$cor <- rollapply(s.dia, 30, cor, by.column=FALSE, align="right")[,2]

s.iwm <- s.iwm[,3]
s.qqq <- s.qqq[,3]
s.dia <- s.dia[,3]

s <- merge(s.iwm, s.qqq, s.dia)

s <- cbind(s, rowSums(s))


tail(s)

sumz <-na.omit(s$rowSums.s.)

# names(sumz) <- "Close"

tail(sumz)

# sumz$z <- SMA(sumz, n=20)
# 
# sums <- sumz[,2]
# 
# tail(sums)



plot.zoo(Cl(SPY), col="blue", ylab="SPY")
par(new=TRUE)
plot.zoo(sumz, yaxt='n', ylab="", col="red")
axis(4)
legend(x="topright", lty=c(1,1), col=c("red","blue"), legend=c("Corr", "SPX"))
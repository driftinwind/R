# require("quantmod")
# 
# getSymbols("^GSPC;^VIX")

# plot(Cl(GSPC), las=1)
# par(new=TRUE)
# plot(Cl(VIX), axes=F)
# axis(4, las=1)

# plot(Cl(GSPC), yaxt="n")
# axis(2)
# par(new=TRUE)
# plot(Cl(VIX), yaxt="n")
# axis(4)



require("quantmod")
getSymbols("^GSPC;^VIX")
plot.zoo(Cl(GSPC), col="blue", ylab="SPX")
par(new=TRUE)
plot.zoo(Cl(VIX), yaxt='n', ylab="", col="red")
axis(4)
legend(x="topright", lty=c(1,1), col=c("red","blue"), legend=c("VIX", "SPX"))


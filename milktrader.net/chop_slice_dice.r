require("quantmod")
require("TTR")
require("PerformanceAnalytics")

# getSymbols("SLV")
quantmod::getSymbols("SLV")

SLV <- SLV[,4]
SLV <- SLV["2010"]

SLV$Delt              <- Delt(Cl(SLV))   # or SLV$Delt <- Delt(SLV[,1]) -- can't resist
SLV$dailyReturn       <- dailyReturn(Cl(SLV))
SLV$ROC               <- ROC(Cl(SLV))
SLV$CalculateReturns  <- CalculateReturns(Cl(SLV))

head(SLV)

# Delt(x1,type = c("arithmetic", "log"))
# periodReturn(x, type='arithmetic') # log would be "log"
# ROC(x, type=c("continuous", "discrete"))
# CalculateReturns(prices, method=c("compound","simple"))
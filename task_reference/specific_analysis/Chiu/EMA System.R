################################################################
#MASTER SCRIPT
################################################################

require("zoo")
require("xts")
require("TTR")
require("fUtilities")

#set working directory
setwd("D:\\Documents\\Trading\\R")

#system parameters

prdMVA1 = 20
prdMVA2 = 50
prdMVA3 = 80

sysEquityRisk = 0.02
sysBankRoll = 100000

sDate = "2000-01-01"
eDate = "2011-01-03"
  
sysTrailATR = 7
sysEntryATR = 2

##load universe into data frame
universe <- data.frame(Name = NA,ContractSize = NA,FilePath = NA)

universe$Name[1] <- "Gold eMini"
universe$ContractSize[1] <- 50
universe$FilePath[1] <- ".\\Price Data\\GC_1101P.csv"


##load system
for (instrumentCount in 1:length(universe[,1])) {
  source('.\\EMA System\\getPriceData.R')
  source('.\\EMA System\\EMA Trade Engine.R')
}

	

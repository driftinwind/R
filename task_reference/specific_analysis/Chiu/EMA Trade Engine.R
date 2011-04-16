################################################################
#TRADE ENGINE FUNCTIONS
################################################################
CheckTrade <- function() {
  ifelse (tradeSignal == 'Long', return(TRUE),
  ifelse (tradeSignal == 'Short', return(TRUE), return(FALSE)))
}

fRMultiple <- function(entryPrice, exitPrice) {
if (is.na(exitPrice) == FALSE) {
  if (TradeType[tIndex] == 'Long' & entryPrice != 0) {
    RMultiple <- (exitPrice - entryPrice) / (EntryATR[tIndex] * sysEntryATR)
    return(RMultiple)
  } 

  if (TradeType[tIndex] == 'Short' & is.na(entryPrice) == FALSE) {
    RMultiple <- (entryPrice - exitPrice) / (EntryATR[tIndex] * sysEntryATR)
    return(RMultiple)
  } 
} 
else { return(0) }
}
################################################################
#TRADE ENGINE SCRIPT
################################################################


#INTRODUCE VARIABLES
sig <- NULL
tIndex <- 0
tradeSignal <- 'None'
tradeActive <- FALSE

tradeDays <- 0

  #ENTRY VECTORS
  EntryDate <- NULL
  TradeType <- NULL
  EntryPrice.P1 <- NULL
  EntryPrice.P2 <- NULL
  EntryPrice.P3 <- NULL
  EntryPrice.P4 <- NULL
  EntryATR <- NULL

  #EXIT VECTORS
  ExitDate <- NULL
  ExitPrice.P1 <- NULL
  ExitPrice.P2 <- NULL
  ExitPrice.P3 <- NULL
  ExitPrice.P4 <- NULL
  TradeLength <- NULL

  #PROFIT VECTORS
  R.P1 <- NULL
  R.P2 <- NULL
  R.P3 <- NULL
  R.P4 <- NULL
  R.Total <- NULL


#RUN TRADE MANAGER
for (pIndex in 2:length(pData$Date)) {
  #CHECK ENTRY RULES
  source('.\\EMA System\\EMA Entry.R')
  if (CheckTrade() == TRUE & tradeActive == FALSE) {
    tIndex <- tIndex + 1
    tradeDays <- 1
    tradeActive <- TRUE    

    EntryDate <- c(EntryDate, pData$Date[pIndex])
    TradeType <- c(TradeType, tradeSignal)
    EntryPrice.P1 <- c(EntryPrice.P1, pData$Close[pIndex])
    EntryPrice.P2 <- c(EntryPrice.P2, NA)
    EntryPrice.P3 <- c(EntryPrice.P3, NA)
    EntryPrice.P4 <- c(EntryPrice.P4, NA)
    EntryATR <- c(EntryATR, pData$ATR1[pIndex])

    ExitDate <- c(ExitDate, NA)
    ExitPrice.P1 <- c(ExitPrice.P1, NA)
    ExitPrice.P2 <- c(ExitPrice.P2, NA)
    ExitPrice.P3 <- c(ExitPrice.P3, NA)
    ExitPrice.P4 <- c(ExitPrice.P4, NA)
    
    R.P1 <- c(R.P1, NA)
    R.P2 <- c(R.P2, NA)
    R.P3 <- c(R.P3, NA)
    R.P4 <- c(R.P4, NA)

    TradeLength <- c(TradeLength, NA)
   
  }

  #CHECK TRADE EXITS
  if (tradeActive == TRUE) {
    tradeDays <- tradeDays + 1

    #P2 ADD
    if (fRMultiple(EntryPrice.P1[tIndex], pData$Close[pIndex]) > 2 & is.na(EntryPrice.P2[tIndex]) == TRUE) { 
      EntryPrice.P2[tIndex] <- pData$Close[pIndex] 
    }
    #P3 ADD
    if (fRMultiple(EntryPrice.P1[tIndex], pData$Close[pIndex]) > 3 & is.na(EntryPrice.P3[tIndex]) == TRUE) { 
      EntryPrice.P3[tIndex] <- pData$Close[pIndex] 
    }
    #P4 ADD
    if (fRMultiple(EntryPrice.P1[tIndex], pData$Close[pIndex]) > 4 & is.na(EntryPrice.P4[tIndex]) == TRUE) { 
      EntryPrice.P4[tIndex] <- pData$Close[pIndex] 
    }


    #CHECK FOR EXITS
    source('.\\EMA System\\EMA Exit.R')

    if (tradeExit == TRUE) {
      tradeActive <- FALSE
      tradeExit <- FALSE

      ExitDate[tIndex] <- pData$Date[pIndex]
      ExitPrice.P1[tIndex] <- pData$Close[pIndex]
      ExitPrice.P2[tIndex] <- pData$Close[pIndex]
      ExitPrice.P3[tIndex] <- pData$Close[pIndex]
      ExitPrice.P4[tIndex] <- pData$Close[pIndex]

      R.P1[tIndex] <- fRMultiple(EntryPrice.P1[tIndex], ExitPrice.P1[tIndex])
      if (is.na(EntryPrice.P2[tIndex]) == FALSE) { R.P2[tIndex] <- fRMultiple(EntryPrice.P2[tIndex], ExitPrice.P2[tIndex]) * 1.00 }
      if (is.na(EntryPrice.P3[tIndex]) == FALSE) { R.P3[tIndex] <- fRMultiple(EntryPrice.P3[tIndex], ExitPrice.P3[tIndex]) * 0.60 }
      if (is.na(EntryPrice.P4[tIndex]) == FALSE) { R.P4[tIndex] <- fRMultiple(EntryPrice.P4[tIndex], ExitPrice.P4[tIndex]) * 0.40 }

      TradeLength[tIndex] <- tradeDays
    }
  }
}

#WRITE DATA FRAME
tradeData <- data.frame(EntryDate = as.Date(EntryDate),
                        TradeType = TradeType,
                        EntryPrice.P1 = EntryPrice.P1,
                        EntryPrice.P2 = EntryPrice.P2,
                        EntryPrice.P3 = EntryPrice.P3,
                        EntryPrice.P4 = EntryPrice.P4,
                        EntryATR = EntryATR,           
                        ExitDate = as.Date(ExitDate),
                        ExitPrice.P1 = ExitPrice.P1,
                        ExitPrice.P2 = ExitPrice.P2,
                        ExitPrice.P3 = ExitPrice.P3,
                        ExitPrice.P4 = ExitPrice.P4,
		            TradeLength = TradeLength,
               		R.P1 = R.P1,
               		R.P2 = R.P2,
               		R.P3 = R.P3,
               		R.P4 = R.P4
)

#WRITE OUTPUT
write.csv(tradeData,'output.csv')

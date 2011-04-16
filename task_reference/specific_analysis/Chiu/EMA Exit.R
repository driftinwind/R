################################################################
#EMA EXIT FUNCTIONS
################################################################
fTrailStop <- function() {
  ifelse (TradeType[tIndex] == 'Long',
    return(max(pData$Close[(pIndex-tradeDays):pIndex] - pData$ATR1[(pIndex-tradeDays):pIndex] * sysTrailATR)),
    return(min(pData$Close[(pIndex-tradeDays):pIndex] + pData$ATR1[(pIndex-tradeDays):pIndex] * sysTrailATR)))  
}

fEntryStop <- function() {
  entry <- EntryPrice.P1[tIndex]

  ifelse (TradeType[tIndex] == 'Long',
    return(entry - EntryATR[tIndex] * sysEntryATR),
    return(entry + EntryATR[tIndex] * sysEntryATR))  
}

fChandelierStop <- function() {
  ifelse (TradeType[tIndex] =='Long',
    return(max(fTrailStop(),fEntryStop())),
    return(min(fTrailStop(),fEntryStop())))
}


################################################################
#EMA EXIT SCRIPT
################################################################

#CHANDELIER STOP
if (TradeType[tIndex] == 'Long' & pData$Close[pIndex] < fChandelierStop()) { tradeExit <- TRUE }
if (TradeType[tIndex] == 'Short' & pData$Close[pIndex] > fChandelierStop()) { tradeExit <- TRUE }

#END OF DATA EXIT
if (pIndex == length(pData$Date)) { tradeExit <- TRUE }

################################################################
#EMA ENTRY SCRIPT
################################################################

#LONG ENTRIES

if (pIndex > prdMVA3 &
    EMA1[pIndex] > EMA2[pIndex] &
    EMA2[pIndex] > EMA3[pIndex] &
    pData$HI1[pIndex] > pData$HI1[pIndex-1]) { 

  #CREATE LONG SIGNAL
  tradeSignal <- 'Long' 
}

#SHORT ENTRIES

if (pIndex > prdMVA3 &
    EMA1[pIndex] < EMA2[pIndex] &
    EMA2[pIndex] < EMA3[pIndex] &
    pData$LO1[pIndex] < pData$LO1[pIndex-1]) { 

  #CREATE SHORT SIGNAL
  tradeSignal <- 'Short' 
}
    

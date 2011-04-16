################################################################
#GET PRICE DATA SCRIPT


#importing price data csv
  pData <- read.csv (universe$FilePath[instrumentCount])
  pData$Date <- as.Date(strptime(pData$Date, format='%m/%d/%Y'))

#donchian high-low
  HL1 <- DonchianChannel(cbind(pData$High,pData$Low), n = prdMVA1)
  HI1 <- HL1[,1]
  LO1 <- HL1[,3]

  HL2 <- DonchianChannel(cbind(pData$High,pData$Low), n = prdMVA2)
  HI2 <- HL1[,1]
  LO2 <- HL1[,3]

  HL3 <- DonchianChannel(cbind(pData$High,pData$Low), n = prdMVA3)
  HI3 <- HL1[,1]
  LO3 <- HL1[,3]

#exponential moving average
  EMA1 <- EMA(pData$Close, n = prdMVA1)
  EMA1[is.na(EMA1)] <- 0
  EMA2 <- EMA(pData$Close, n = prdMVA2)
  EMA2[is.na(EMA2)] <- 0
  EMA3 <- EMA(pData$Close, n = prdMVA3)
  EMA3[is.na(EMA3)] <- 0

#ATR
  ATR1 <- ATR(cbind(pData$High,pData$Low,pData$Close), n = prdMVA1)
  ATR1 <- ATR1[,2]
  ATR2 <- ATR(cbind(pData$High,pData$Low,pData$Close), n = prdMVA2)
  ATR2 <- ATR2[,2]
  ATR3 <- ATR(cbind(pData$High,pData$Low,pData$Close), n = prdMVA3)
  ATR3 <- ATR3[,2]

#ADX
  ADX1 <- ADX(cbind(pData$High,pData$Low,pData$Close), n = 20)
  ADX1 <- ADX1[,4]
  ADX1MV <- EMA(ADX1, n = 5)
  ADX1MV[is.na(ADX1MV)] <- 0
  ADX2MV <- EMA(ADX1, n = 10)
  ADX2MV[is.na(ADX2MV)] <- 0
  ADX3MV <- EMA(ADX1, n = 20)
  ADX3MV[is.na(ADX3MV)] <- 0

  ADX2 <- ADX(cbind(pData$High,pData$Low,pData$Close), n = 20)
  ADX2 <- ADX2[,4]

  ADX3 <- ADX(cbind(pData$High,pData$Low,pData$Close), n = 50)
  ADX3 <- ADX3[,4]



#pData require loops
  for (i in 1:length(pData$Date)) {
    if (i > max(prdMVA1,prdMVA2,prdMVA3)) {
    ##rolling slopes/etc...



    }
  }

#reform pData!
  pData <- data.frame(pData,
			    EMA1,
			    EMA2,
			    EMA3,
			    HI1,
			    HI2,
			    HI3,
			    LO1,
			    LO2,
			    LO3,
			    ATR1,
			    ATR2,
			    ATR3,
			    ADX1,
			    ADX2,
			    ADX3,
			    ADX1MV,
			    ADX2MV,
			    ADX3MV
  			   )
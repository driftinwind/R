require(blotter)
require(xts)
require(quantmod)

Sys.setenv(TZ="GMT")
initDate='2000-01-01'
getSymbols('SPY',from=initDate,index.class=c("POSIXt","POSIXct"))
SPY<-adjustOHLC(SPY,use.Adjusted=T)

#yesterday's price
tmp<-lag(SPY,1)

# if today's low is higher than yesterday's close 1, else 0
signal<-ifelse(Lo(SPY)>Cl(tmp),1,0)
signal[1]<-0

#let's plot cumulitative return to make sure, that we are on the right path
tmp<-lag(Delt(Cl(SPY)),-1)
tmp[length(tmp)]<-0
plot(cumprod(signal*tmp+1))

SPY<-Cl(SPY)
symbols<-c('SPY')
rm(list=ls(envir=.blotter),envir=.blotter)
initPortf(ltportfolio,symbols, initDate=initDate)
initAcct(ltaccount,portfolios=c(ltportfolio), initDate=initDate,initEq=initEq)
signal<-signal['2000-02-01::']

for(i in 1:length(signal))
{
	currentDate= time(signal)[i]
	equity = getEndEq(ltaccount, currentDate)
	position = getPosQty(ltportfolio, Symbol=symbols[1], Date=currentDate)
	if(position==0)
	{
		#open a new position if signal is >0
		if(signal[i]>0)
		{
			closePrice<-as.double(Cl(SPY[currentDate]))
			unitSize = as.numeric(trunc((equity/closePrice)))
						# 5$ per transaction
			addTxn(ltportfolio, Symbol=symbols[1],  TxnDate=currentDate, TxnPrice=closePrice, TxnQty = -unitSize , TxnFees=5, verbose=T)
		}
	}
	else
	{
		#position is open. If signal is 0 - close it.
		if(as.double(signal[i])==0 && position<0)
		{
			position = getPosQty(ltportfolio, Symbol=symbols[1], Date=currentDate)
			closePrice<-as.double((Cl(SPY[currentDate])))#as.double(get(symbols[1])[i+100])
						# 5$ per transaction
			addTxn(ltportfolio, Symbol=symbols[1],  TxnDate=currentDate, TxnPrice=closePrice, TxnQty = -position , TxnFees=5, verbose=T)
		}
	}
	updatePortf(ltportfolio, Dates = currentDate)
	updateAcct(ltaccount, Dates = currentDate)
	updateEndEq(ltaccount, Dates = currentDate)
	equity = getEndEq(ltaccount, currentDate)
}
plot(getAccount(ltaccount)[["TOTAL"]]$End.Eq)

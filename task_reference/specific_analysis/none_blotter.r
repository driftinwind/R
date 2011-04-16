require(quantmod)
require(blotter)

rm(list=ls(envir=.blotter),envir=.blotter)
try(rm(“account.longtrend”,”portfolio.longtrend”,pos=.blotter),silent=TRUE)
try(rm(“ltaccount”,”ltportfolio”,”ClosePrice”,”CurrentDate”,”equity”,”GSPC”,”i”,”initDate”,”initEq”,”Posn”,”UnitSize”,”verbose”),silent=TRUE)

Sys.setenv(TZ=”GMT”)

initDate=’2000-01-01′
initEq=100000
ltportfolio=’longtrend’
ltaccount=’longtrend’

currency(“USD”)
symbols = c(“SPY”)
for(symbol in symbols){ # establish tradable instruments
stock(symbol, currency=”USD”,multiplier=1)
}

getSymbols(symbols,from=initDate,index.class=c(“POSIXt”,”POSIXct”))
SPY<-adjustOHLC(SPY,use.Adjusted=T)

#yesterday's price
tmp<-lag(SPY,1)

# if today's low is higher than yesterday's close 1, else 0
signalCl(tmp),1,0)
signal[1]<-0

#let's plot cumulitative return to make sure, that we are on the right path
tmp<-lag(Delt(Cl(SPY)),-1)
tmp[length(tmp)]<-0
X11()
plot(cumprod(signal*tmp+1))

SPY<-Cl(SPY)

initPortf(ltportfolio,symbols, initDate=initDate)
initAcct(ltaccount,portfolios=c(ltportfolio), initDate=initDate,initEq=initEq)

signal0
if(signal[i]>0)
{
closePrice<-as.double(Cl(SPY[currentDate]))
unitSize = as.numeric(trunc((equity/closePrice)))
# 5$ per transaction
addTxn(ltportfolio, Symbol=symbols[1], TxnDate=currentDate, TxnPrice=closePrice, TxnQty = -unitSize , TxnFees=5, verbose=F)

updatePortf(ltportfolio, Dates = currentDate)
updateAcct(ltaccount, Dates = currentDate)
updateEndEq(ltaccount, Dates = currentDate)
equity = getEndEq(ltaccount, currentDate)
}

}
else
{
#position is open. If signal is 0 – close it.
if(as.double(signal[i])==0 & position<0)
{
position = getPosQty(ltportfolio, Symbol=symbols[1], Date=currentDate)
closePrice<-as.double((Cl(SPY[currentDate])))#as.double(get(symbols[1])[i+100])

# 5$ per transaction
addTxn(ltportfolio, Symbol=symbols[1], TxnDate=currentDate, TxnPrice=closePrice, TxnQty = -position , TxnFees=5, verbose=F)

updatePortf(ltportfolio, Dates = currentDate)
updateAcct(ltaccount, Dates = currentDate)
updateEndEq(ltaccount, Dates = currentDate)
equity = getEndEq(ltaccount, currentDate)
}

}
# updatePortf(ltportfolio, Dates = currentDate)
# updateAcct(ltaccount, Dates = currentDate)
# updateEndEq(ltaccount, Dates = currentDate)

# equity = getEndEq(ltaccount, currentDate)
}

X11()
plot(getAccount(ltaccount)$summary$End.Eq)
##################
## SIGNAL LOGIC ## 
##################

tmp       <- lag(SPY,1)
signal    <- ifelse(Lo(SPY)>Cl(tmp),1,0)
signal[1] <- 0
SPY       <- Cl(SPY)
symbols   <- c('SPY')
signal    <- signal['2000-02-01::']



####################################################### 
## APPLY SIGNAL LOGIC ITERATIVELY ACROSS DATA OBJECT ##
#######################################################

for(i in 1:length(signal))

{
	currentDate = time(signal)[i]
	equity      = getEndEq(ltaccount, currentDate)
	position    = getPosQty(ltportfolio, Symbol=symbols[1], Date=currentDate)
	
	if(position==0)
	{		
		if(signal[i]>0)
		{
			closePrice<-as.double(Cl(SPY[currentDate]))
			unitSize = as.numeric(trunc((equity/closePrice)))		
		}
	}
	
	else
	{
		if(as.double(signal[i])==0 && position<0)
		{
			position = getPosQty(ltportfolio, Symbol=symbols[1], Date=currentDate)
			closePrice<-as.double((Cl(SPY[currentDate])))#as.double(get(symbols[1])[i+100])					
		}
	}
	updatePortf(ltportfolio, Dates = currentDate)
	updateAcct(ltaccount,    Dates = currentDate)
	updateEndEq(ltaccount,   Dates = currentDate)
	
	equity = getEndEq(ltaccount, currentDate)
}


                          
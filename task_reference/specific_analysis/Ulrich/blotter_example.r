# This code implements the strategy found in:
# Faber, Mebane T., "A Quantitative Approach to Tactical Asset Allocation."
# Journal of Risk Management (Spring 2007).

# The article implements a simpler version of the 200-day SMA, opting for a
# 10-month SMA because monthly data are more easily available in earlier
# periods and lower granularity should translate to lower transaction costs.

# The rules of the system are relatively simple:
# - Buy when monthly price > 10-month SMA
# - Sell and move to cash when monthly price < 10-month SMA

# 1. All entry and exit prices are on the day of the signal at the close.
# 2. All data series are total return series including dividends, updated monthly.
# NOTE: For the purposes of this demo, we only use price returns.
# 3. Cash returns are estimated with 90-day commercial paper. Margin rates for
# leveraged models are estimated with the broker call rate.
# NOTE: For the purposes of this demo, we ignore interest and leverage.
# 4. Taxes, commissions, and slippage are excluded.

# Data:
# This demo uses monthly data downloaded from Yahoo Finance for two ETFs: SPY and
# IEF. These were chosen to illustrate the classic stock/bond asset portfolio.
# Though longer serires would be preferred, data for IEF begin in mid-2002.

# Load required libraries
library(quantmod)
library(TTR)
library(blotter) # r-forge revision 193
library(PerformanceAnalytics)

# Set initial values
initDate='2002-07-31'
endDate='2009-10-31'
initEq=100000

# Set currency and instruments
currency("USD")
stock("IEF",currency="USD",multiplier=1)
stock("SPY",currency="USD",multiplier=1)

# Load data with quantmod
print("Loading data")
symbols = c("IEF", "SPY")
getSymbols(symbols, from=initDate, to=endDate, index.class=c("POSIXt","POSIXct"))

# Adjust prices for splits/dividends (thanks pg)
#IEF = adjustOHLC(IEF)
#SPY = adjustOHLC(SPY)

# Convert data to monthly frequency (to.weekly() needs drop.time=FALSE)
IEF = to.monthly(IEF, indexAt='endof')
SPY = to.monthly(SPY, indexAt='endof')

# Set up indicators with TTR
print("Setting up indicators")
IEF$SMA = SMA(Cl(IEF), 10)
SPY$SMA = SMA(Cl(SPY), 10)

# Set up a portfolio object and an account object in blotter
initPortf(name='default', symbols=symbols, initDate=initDate)
initAcct(name='default', portfolios='default', initDate=initDate, initEq=initEq)
verbose = TRUE

# Create trades
for( i in 10:NROW(SPY) ) {
  CurrentDate=time(SPY)[i]
  equity = getEndEq(Account='default', CurrentDate)

  for( symbol in symbols ) {
    sym = get(symbol)
    ClosePrice = as.numeric(Cl(sym[i,]))
    Posn = getPosQty(Portfolio='default', Symbol=symbol, Date=CurrentDate)
    UnitSize = as.numeric(trunc((equity/NROW(symbols))/ClosePrice))

    # Position Entry (assume fill at close)
    if( Posn == 0 ) {
    # No position, so test to initiate Long position
      if( Cl(sym[i,]) > sym[i,'SMA'] ) {
        # Store trade with blotter
        addTxn('default', Symbol=symbol, TxnDate=CurrentDate,
          TxnPrice=ClosePrice, TxnQty=UnitSize, TxnFees=0, verbose=verbose)
      }
    } else {
      # Have a position, so check exit
      if( Cl(sym[i,]) < sym[i,'SMA'] ) {
        # Store trade with blotter
        addTxn(Portfolio='default', Symbol=symbol, TxnDate=CurrentDate,
          TxnPrice=ClosePrice, TxnQty=-Posn, TxnFees=0, verbose=verbose)
      }
    }
  } # End symbols loop

  # Calculate P&L and resulting equity with blotter
  updatePortf(Portfolio='default', Dates=CurrentDate)
  updateAcct(name='default', Dates=CurrentDate)
  updateEndEq(Account='default', Dates=CurrentDate)

} # End dates loop
 
# Buy and Hold cumulative equity
buyhold = cumprod( ( 1 + 0.5*ROC(Cl(IEF)) + 0.5*ROC(Cl(SPY)) )[-1] )

# Final values
cat('Tactical Asset Allocation Return: ',(getEndEq(Account='default', Date=CurrentDate)-initEq)/initEq,'\n')
cat('Buy and Hold Return: ',tail(buyhold,1)-1,'\n')

# Plot Strategy Summary
png(filename="20091118_blotter_strategy.png", 720, 720)
charts.PerformanceSummary(ROC(getAccount('default')$TOTAL$End.Eq)[-1],main="Tactical Asset Allocation")
dev.off()

# Plot Buy and Hold Summary
png(filename="20091118_blotter_buyhold.png", 720, 720)
charts.PerformanceSummary(ROC(buyhold)[-1],main="Buy & Hold")
dev.off()
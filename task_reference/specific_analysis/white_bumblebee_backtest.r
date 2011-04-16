#######
####### PREPARE ENVIRONMENT AND SET PARAMETERS
#######

## load libraries

require(quantmod)
require(PerformanceAnalytics)
require(blotter)

# set global variables

ticker        <- "SPY"

start_date    <- '2002-07-31'
end_date      <- format(Sys.Date(),"%Y-%m-%d") 

var_one       <- 10
var_two       <- 30
var_three     <- 0.5
var_four      <- 1
var_five      <- 2

start_equity  <- 100000

## Set currency and instruments
## this may be required of blotter or PerformanceAnalytics ???????????????

# currency("USD")
# stock("ticker",currency="USD",multiplier=1)

######
###### IMPORT AND PROCESS DATA
######

## load xts objects

tick <- getSymbols(ticker, auto.assign=FALSE)

## correct for splits if necessary (SLV is a notorious example)

# tick <-  adjustOHLC(tick, adjust="split")

## get rid of extraneous vectors

tick <- tick[,c(-1,-2,-3,-5,-6)]

## attach TA data

# tick$SMA_one   = SMA(Cl(tick), var_one)
#                      
# tail(tick)           
#                      
# tick$SMA_two   = SMA(Cl(tick), 39)
#                
# tail(tick)     

tick$fast = BBands(Cl(tick), n=var_one, sd=var_three)               
tick$slow = BBands(Cl(tick), n=var_two, sd=var_three)

tail(tick)

tick = tick[,c(1,3,6,8)]

tail(tick)

######
###### TRADE LOGIC
######

signal <- ifelse(tick$mavg > tick$up.1, 1, ifelse(tick$mavg < tick$dn.1, -1, NA))

tick$signal = signal

tick$signal <- na.locf(tick$signal)


tail(tick)



# for( i in 10:NROW(tick) ) {
# 	if((tick$signal)[i] == 99) 
# 	(tick$signal)[i]=0
# 	
# 	
# 	  # { tick$signal[i]=tick$signal[-i]	}
# }


# tick$lagsignal <- c(NA, head(tick$signal, -1))
# 
# tail(tick)
# 
# tick$newsignal <- ifelse(tick$signal == 99, tick$lagsignal, tick$signal)
# 
# tail(tick)

tick





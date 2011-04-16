# Given the following zoo object
# 
#            SLV.Open SLV.Close       dn fast_ma       up     dn.1  slow_ma     up.1
# 2010-12-09    28.10     28.03 27.30078  27.778 28.25522 25.63011 26.38167 27.13322
# 2010-12-10    27.80     27.98 27.58363  27.963 28.34237 25.82214 26.53333 27.24453
# 2010-12-13    28.84     28.87 27.88458  28.195 28.50542 25.98405 26.69000 27.39595
# 2010-12-14    28.69     28.81 28.03905  28.332 28.62495 26.16135 26.84800 27.53465
# 2010-12-15    28.41     28.08 28.07649  28.359 28.64151 26.32178 26.97367 27.62555
# 2010-12-16    28.24     28.28 28.12099  28.394 28.66701 26.49886 27.10800 27.71714
# 
# which was created with these steps:
# 
#  >library("quantmod")
#  
#  > getSymbols("SLV")
#  > fast_band <- BBands(( SLV[,4] ), n=10, sd=0.5)
#  > slow_band <- BBands((SLV[,4]), n=30, sd=0.5)
#  > fast_band <- fast_band[,(1:3)]
#  > slow_band <- slow_band[,(1:3)]
#  > all_band  <- merge(fast_band, slow_band)
#  > names(all_band)[2] <- "fast_ma"
#  > names(all_band)[5] <- "slow_ma"
#  > SLV <- SLV[, c(1,4)]
#  > SLV.1 <- merge(SLV, all_band)
#   
# Mind you, copying this does not work for some strange reason, but if you type
# it in, it works just fine to return the object listed above.
# 
# After the SLV.1 is created thusly, 
# 
# > class(SLV.1)
# [1] "xts" "zoo"
#    
# So, I believe we need it to be a data.frame to run a function against it.
# 
# > SLV.2 <- as.data.frame(SLV.1)
# > class(SLV.2)
# [1] "data.frame"
# 
# Now the code below works to implement White Bumblebee (actually, not quite but I 
#	just want to return long/short for now)

white_bumblebee <- function(x){
  
   x$Position <- sapply( as.numeric(sign(x[,4]-x[,7])+2),
                         function(j) switch(j,"Short","Flat","Long"))
	                
    x$BarMood <- sapply( as.numeric(sign(x[,1]-x[,2])+2),                                     
                             function(j) switch(j,"Hot","Lukewarm","Cold"))                                                                                 

   return(x)
}


# This is what I get:
# 
# > tail(SLV.3)
#            SLV.Open SLV.Close       dn fast_ma       up     dn.1  slow_ma     up.1 Position BarMood
# 2010-12-09    28.10     28.03 27.30078  27.778 28.25522 25.63011 26.38167 27.13322     Long    Cold
# 2010-12-10    27.80     27.98 27.58363  27.963 28.34237 25.82214 26.53333 27.24453     Long     Hot
# 2010-12-13    28.84     28.87 27.88458  28.195 28.50542 25.98405 26.69000 27.39595     Long     Hot
# 2010-12-14    28.69     28.81 28.03905  28.332 28.62495 26.16135 26.84800 27.53465     Long     Hot
# 2010-12-15    28.41     28.08 28.07649  28.359 28.64151 26.32178 26.97367 27.62555     Long    Cold
# 2010-12-16    28.24     28.28 28.12099  28.394 28.66701 26.49886 27.10800 27.71714     Long     Hot
#
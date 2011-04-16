require("quantmod")

getSymbols("^GSPC")  
getSymbols("^VIX")  

# weird how the caret is removed for the object name
# also, I'm just getting to the gritty return straight away

spx <- ROC (GSPC)
vix <- ROC (VIX)

# now let's isolate the closing value 

spx.c <- spx[,4]
vix.c <- vix[,4]

CurveFittingMadness <- spx.c - vix.c

plot (CurveFittingMadness)





I_am_a_bull <- function(close, sma_50, sma_200) 
{	
    if (close > sma_50 && close > sma_200 && sma_50 > sma_200)
	{ cat("I am a bull") }
	
	else
	{ cat ("I am NOT a bull") }
}

I_am_a_bull(200, 130, 100)
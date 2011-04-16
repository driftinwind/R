#!/usr/bin/Rscript

require(quantmod)


VIX <- getSymbols ("^VIX", from="2008-01-01", src="yahoo")
SPX <- getSymbols ("^GSPC", from="2008-01-01", src="yahoo")


tail (VIX)
tail (SPX)





library(quantmod)

getSymbols( c("WRESCRT", "PPIACO"), src="FRED" )

bs_ppi_raw = merge( Delt(WRESCRT, k=52), Delt(PPIACO, k=12) )

head (bs_ppi_raw)
length(bs_ppi_raw)
str(bs_ppi_raw)

bs_ppi     = na.locf( bs_ppi_raw, na.rm=TRUE )

head(bs_ppi)
length(bs_ppi)
str(bs_ppi)


ccf( as.vector(bs_ppi[,1]), as.vector(bs_ppi[,2]) )

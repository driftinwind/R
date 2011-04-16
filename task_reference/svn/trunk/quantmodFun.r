require(quantmod)

# you can assign a variable to getSymbols with auto.assign=FALSE

# but you can't have it both ways, either auto.assign FALSE, 
# which lets the variable create the object
# or auto.assign TRUE, which automatically assigns the object
 
getSymbols("AAPL", from="1999-01-01", src="yahoo") 

# Apple <- getSymbols("AAPL", from="1999-01-01", src="yahoo" , auto.assign=FALSE)


#head (AAPL)
#head (Apple)

#aapl <- AAPL[,c(1:4)]
aapl <- OHLC(AAPL)

# that demonstrates extraction and special method

head(aapl)
#head(apple)

tail(aapl)

# and finally we write it to our DATA file

write.csv (aapl, "~/Dropbox/DATA/YAHOO/aapl.csv")
#write.csv (apple, "~/Dropbox/DATA/YAHOO/apple.csv")


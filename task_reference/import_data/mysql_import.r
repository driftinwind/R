require (quantmod)
require (RMySQL)

setDefaults(getSymbols.MySQL, user="wlasiuk", password="", dbname='test' , db.fields=c("date", "o", "h", "l", "c"))

getSymbols("silver_short", src="MySQL") 

head(silver_short)
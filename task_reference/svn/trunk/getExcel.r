## import excel file from Dropbox

require("RODBC")

channel <- odbcConnectExcel("~/Dropbox/DATA/SAMPLE/petro.xls")


petro <- sqlFetch (channel, "weekly")
	
odbcClose(channel)

str(petro)
head(petro)


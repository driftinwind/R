require("quantmod")

getSymbols("^GSPC;^VIX")

plot(VIX, col="red")
par (new=TRUE)
plot(GSPC, ann=FALSE, yaxt="n")
axis(4)
# library(zoo)
# library(tseries)

require(quantmod)
require(tseries)

# gld <- read.csv("GLD.csv", stringsAsFactors=F)
# gdx <- read.csv("GDX.csv", stringsAsFactors=F)

getSymbols("GLD;GDX")

# gld <- zoo(gld[,7], as.Date(gld[,1]))
# gdx <- zoo(gdx[,7], as.Date(gdx[,1]))

t <- as.data.frame(merge(GLD, GDX))

# t.zoo <- merge(gld, gdx, all=FALSE)
# t <- as.data.frame(t.zoo)

cat("Date range is", format(start(GLD)), "to", format(end(GLD)), "\n")

m <- lm(GLD ~ GDX + 0, data=t)
beta <- coef(m)[1]

cat("Assumed hedge ratio is", beta, "\n")

sprd <- t$GLD.Close - beta*t$GDX.Close
ht <- adf.test(sprd, alternative="stationary", k=0)

cat("ADF p-value is", ht$p.value, "\n")

if (ht$p.value < 0.05) {
    cat("The spread is likely mean-reverting\n")
} else {
    cat("The spread is not mean-reverting.\n")
}
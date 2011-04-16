# the trick is to get two ts time series to match up
# on length and data format
# this was read in with getSymbols, which returns an xts object
# but that works to apply to.monthly() as well as date indexing
# with WWW['::2010'] and then using the as.ts() to get it to work with ccf()

ccf(WWW, PPP, lag.max=300, main="PPIACO & WRESCRT")
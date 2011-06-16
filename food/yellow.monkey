# 2-class classifier model for input into svm.
# Binary answer to market up? (1) or market down? (-1)

#  the answer is:

sign(ret.zero)

# 7 binary features include: 

sign(ret.one)
sign(ret.two)
sign(ret.thr)
sign(ret.fou)
sign(ret.fiv)
sign(ret.six)
sign(ret.sev)

# also of interest is the market structure in relation to the 50 and 200 EMA

# the basic structure of this feature is a percentage that can be negative

structure <- (50 EMA - 200 EMA) / 200 EMA

cl.50     <- (close - 50 EMA) / 50 EMA
cl.200    <- (close - 200 EMA) / 200 EMA

cl.50.3   <- lag((cl.50, k=3)
cl.200.3  <- lag((cl.200, k=3)

cl.50.7   <- lag((cl.50, k=7)
cl.200.7  <- lag((cl.200, k=7)


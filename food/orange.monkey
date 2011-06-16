# 2-class classifier model for input into svm.
# Binary answer to market return > n% ? (1) or not (-1)

#  the answer is:

subset(abs(ret.zero) > n%)

# 7 binary features include: 

subset(abs(ret.one) > n%)
subset(abs(ret.two) > n%)
subset(abs(ret.thr) > n%)
subset(abs(ret.fou) > n%)
subset(abs(ret.fiv) > n%)
subset(abs(ret.six) > n%)
subset(abs(ret.sev) > n%)

# next is a contraction/expansion metric based on BBands
# the idea is to measure the breadth of the band and see if its large or small
# percentage and there are 9 of them

bb <- (upperband - midpoint) / midpoint
lag(bb, k=2)
lag(bb, k=3)
lag(bb, k=4)
lag(bb, k=5)
lag(bb, k=6)
lag(bb, k=7)
lag(bb, k=14)
lag(bb, k=21)

# do.call() method per JD Long

IAmMoney <- function(x) {
    require("quantmod")
    getSymbols(x)
    do.call(tail, list(as.name(x)))  # this calls tail and passes the unquoted value of x to the function 
# A ‘name’ (also known as a ‘symbol’) is a way to refer to R objects by name (rather than the value of the object,
}

IAmMoney("GLD")

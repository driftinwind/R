IAmMoney <- function(x) {

    require("quantmod")

    getSymbols("x")

    tail(x)    

}

IAmMoney("GLD")
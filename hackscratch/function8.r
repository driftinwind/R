IAmMoney <- function(x) {

    require("quantmod")

    getSymbols("GLD")

    tail(GLD)    

}

IAmMoney("GLD")

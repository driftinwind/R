
for(i in 1:6) {                  #-- Create objects  'r.1', 'r.2', ... 'r.6' --
 
    nam <- paste("r",i, sep=".")
 
    assign(nam, 1:i)
}


for(i in 1:2) {               
 
    nam <- "r"
 
    assign(nam, 12)
}



######### the envir = .GlobalEnv is the critical piece of code here

myf <- function(x) {
 innerf <- function(x) assign("hello", x^2, envir = .GlobalEnv)
 innerf(x+1)
}

myf1 <- function(x) {
 innerf <- function(x) assign("hello_1", x^2)
 innerf(x+1)
}

myf2 <- function(x) {
 assign("hello_2", x^2, envir = .GlobalEnv)
 innerf(x+1)
}
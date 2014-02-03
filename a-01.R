#
# 2014-01-14
#

source("EWMAvol.R")


myData <- 
  as.matrix(
    cbind(
    rnorm(250),
    rnorm(250),
    rnorm(250),
    rnorm(250),
    rnorm(250)
    )
  )

ewma.results <- EWMAvol(myData, lambda=0.505)
sigma.t <- ewma.results$Sigma.t
last.sigma.t <- sigma.t[250, ]
dim(last.sigma.t) <- c(5,5)
last.sigma.t

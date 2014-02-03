#
# 2014-01-27
#

test1.raw<-read.csv("data/test1.csv", sep = ";")
test1.raw <- test1.raw[with(test1.raw, order(obs)), ]
head(test1.raw)
tail(test1.raw)

test2.raw<-read.csv("data/test2.csv", sep = ";")
test2.raw <- test2.raw[with(test2.raw, order(obs)), ]
head(test2.raw)
tail(test2.raw)


require(xts)

test1.alpha <- vector()
test2.alpha <- vector()


#################################
for(i in 2:length(test1.raw$r)){
  tmp.data <- test1.raw[test1.raw$obs <= i,]
  test1.ts <- ts(tmp.data[1:length(tmp.data$r), c("r")])
  test1.expo <- HoltWinters(test1.ts, 
                            #alpha = 0.01,
                            beta = FALSE, 
                            gamma = FALSE)
  
  test1.alpha[i] <- test1.expo$alpha
  
}

plot(test1.alpha, type = "l")
head(test1.raw)

test1.raw$alpha_PS <- test1.alpha
write.csv(test1.raw, file = "data/test1data.csv")



#################################
for(i in 2:length(test2.raw$r)){
  tmp.data <- test2.raw[test2.raw$obs <= i,]
  test2.ts <- ts(tmp.data[1:length(tmp.data$r), c("r")])
  test2.expo <- HoltWinters(test2.ts, 
                            #alpha = 0.01,
                            beta = FALSE, 
                            gamma = FALSE)
  
  test2.alpha[i] <- test2.expo$alpha
  
}

plot(test2.alpha, type = "l")
head(test2.raw)

test2.raw$alpha_PS <- test2.alpha
write.csv(test2.raw, file = "data/test2data.csv")

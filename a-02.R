#
# 2014-01-20
#


pkn<-read.csv("data/PKNORLEN.txt")
pkn$date <- as.Date(as.character(pkn$Date), format = "%Y%m%d")
pkn$Date <- NULL

require(xts)
pkn$r <- diff.xts(log(pkn$Close), k = 1)
pkn$R <- diff.xts(pkn$Close, k = 1)/lag.xts(pkn$Close, lag = 1)

pkn2 <- pkn[pkn$date >= "2013-01-01" & pkn$date <= "2013-10-31", ]
pkn2
pkn.ts <- ts(pkn2[1:length(pkn2$r), c("r")])
pkn.ts.expo <- HoltWinters(pkn.ts, 
                           alpha = -0.01,
                           beta = FALSE, 
                           gamma = FALSE)
plot(pkn.ts.expo)
pkn.ts.expo

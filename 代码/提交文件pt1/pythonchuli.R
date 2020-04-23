#在app<-前
write.csv(dat,file='data.csv',row.names =FALSE)
write.csv(metrics,file='metrics.csv',row.names =FALSE)
#python处理后
xj<-read.csv(file="./R/newd.csv",header=TRUE)
xj$ID<-as.character(xj$ID)
#继续执行app<-等代码

#Function:Multiple regression to predict the house price.
#Author:Reallocing
#Time:20150813

#====================读取文件数据============
#文件数据格式如下
# 2 7
# 0.18 0.89 109.85
# 1.0 0.26 155.72
# 0.92 0.11 137.66
# 0.07 0.37 76.17
# 0.85 0.16 139.75
# 0.99 0.41 162.6
# 0.87 0.47 151.77
# 4
# 0.49 0.18
# 0.57 0.83
# 0.56 0.64
# 0.76 0.18
#==================code========================
# Enter your code here. Read input from STDIN. Print output to STDOUT
# nums <- read.table("/dev/stdin", sep=" ");
# nums <- as.list(as.data.frame(t(nums)))
# write.table(as.numeric(nums[1])+as.numeric(nums[2]), sep = "", append=T, row.names = F, col.names = F)
Data<-read.table("House_prices.txt",fill=TRUE,header = FALSE)
Feature_F<-Data$V1[1] #the numbers of features.
Houses_Num_N<-Data$V2[1] #the numbers of Houses.

x1<-Data$V1[seq(2,Houses_Num_N+1)]  #obtain the first column of X.
x2<-Data$V2[seq(2,Houses_Num_N+1)]

X<-as.matrix(cbind(x1,x2))
Y<-as.matrix(Data$V3[seq(2,Houses_Num_N+1)])

test_data<-as.data.frame(cbind(Data$V1[seq(Houses_Num_N+3,Houses_Num_N+6)],Data$V2[seq(Houses_Num_N+3,Houses_Num_N+6)]))
#==============================================
#multiple regression Function
#Input:Y_matrix(need to predict),X_matrix(features)
#==============================================
Mul_Reg<-function(X,Y){
  X<-as.matrix(X)
  X<-cbind(Intercept = 1,X)
  solve(t(X)%*%X)%*%t(X)%*%Y
  
}
#==============================================

#======================Main====================

Coeffi<-lm(Y~x1+x2) #beta<-Mul_Reg(X,Y)
House_Prices_Pred<-matrix(NA,4,1)
For(i in 1:4){
  House_Prices_Pred[i,1]<- predict(Coeffi,as.data.frame(x1=test_data[i,1],x2=test_data[i,2]))
}






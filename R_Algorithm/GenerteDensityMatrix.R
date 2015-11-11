#paper title:Discovery of optimal factors in binary data via a novel method of matrix decomposition
#main: implemente algorithm 2
#author:L.P
#time:201509261337

#example matrix for verify algorithm

I <-matrix(c(1,1,1,0,1,0,0,0,
             1,1,0,0,0,1,0,1,
             0,1,0,0,1,0,1,0,
             1,1,0,0,0,1,0,1,
             1,1,1,0,1,0,0,0,
             0,1,0,0,1,0,1,0,
             0,1,0,0,1,0,1,0,
             0,0,0,0,0,0,1,0,
             1,1,1,0,1,0,0,0,
             0,0,0,0,0,0,1,0,
             1,1,1,0,1,0,0,0,
             1,1,0,0,0,1,0,1),12,8,byrow=TRUE)

#example 4
I <- matrix(c(1,0,1,0,1,1,
              0,0,1,0,0,0,
              1,1,0,1,1,1,
              0,0,1,0,0,1,
              0,1,1,1,0,1),5,6,byrow = T)


#read mushroom data
#I <- read.table(file.choose(),sep = " ")
I <- read.table("/home/reallocing/Git/MyCodeSpace/R_Algorithm/dna.txt",sep = " ")
I <- as.matrix(I)

#define function RelyYFindX() that find x-index by y-index;the index's position represent element 1;
#input:I(the matrix need to decomposition),Y-index(single element)
#output:X-index
RelyYFindX <- function(I,y_index){
  #find the element equal to 1 in y-index;
  rowindex <- which(I[,y_index] == 1)
  
  if(sum(I[,y_index])==0){
    rowindex<-NULL
  }
  return(rowindex)
}

#========================================#
#Define functionRelyXFindY() that find y-index by x-index;
#input:I,X-index(x-index may be a list ,so pay attention to it!)
#output:Y-index

RelyXFindY <-function(I,x_index){
  lenIndex <- length(x_index)
  temp <- which(I[x_index[1],]==1)
  for(i in 1:lenIndex){
    temp <- intersect(temp,which(I[x_index[i],]==1))
  }
  y_index <- temp
  return(y_index)
}

#depend on x-index and y-index to construct matrix;
#input:I,x-index and y-index; for example(x-index={1,3},y-index={1,5,6})
#output:Matrix(n*m equal to I's dim)
GenMbyxyindex <- function(I,x_index,y_index){
  I_dim <- dim(I)
  M <- matrix(0,I_dim[1],I_dim[2])
  M[x_index,y_index]<-1
  return(M)
}

#depend on y-index to construct vector;
#input:I, y-index
#output:vector in Matrix
GenYVector <- function(I,yindex){
  I_dim <- dim(I)
  M <- matrix(0,1,I_dim[2])
  M[1,yindex]<-1
  return(M)
}

#depend on x-index to construct vector;
#input:I,x-index 
#output:vector in Matrix 
GenXVector <- function(I,xindex){
  I_dim <- dim(I)
  M <- matrix(0,I_dim[1],1)
  M[xindex,1]<-1
  return(M)
}



#Algorithm 2
#input:I(Boolean Matrix)(dim: n*m)
#output:F(set of factor concepts)
Rprof()
#=============initialize===============#
n <- dim(I)[1]  #row's nums
m <- dim(I)[2]  #column's nums
U <- I #mark matrix ; The program stoped until U equal to  zeros 
C <- matrix(NA,n,0)
D <- matrix(NA,0,m)
X_Index <- NULL
Y_Index <- NULL

while(sum(U)!=0){
  D_index <- NULL # the set contains y-index
  V <- 0 #mark matrix's nums in each iteration
  #browser()
  for(j in 1:m){
    if(j %in% D_index){
      break
    }
    #----do select that maximizes D xor j----#
    #browser()
    X_Index <- RelyYFindX(U,j)
    if(is.null(X_Index)){
      #V <- 0
      next
      } 
    Y_Index <- RelyXFindY(U,X_Index)
    M <- GenMbyxyindex(U,X_Index,Y_Index)
    Vtemp <- sum(M==1)
    if(Vtemp > V){
      V <- Vtemp
      X_Index_Max <- X_Index
      Y_Index_Max <- Y_Index
      D_index <- c(D_index,Y_Index)
    }
    
  }
  
  
  C <- cbind(C,GenXVector(I,X_Index_Max))
  D <- rbind(D,GenYVector(I,Y_Index_Max))
  
  #------remove the elements by marked------#
  MM<- GenMbyxyindex(I,X_Index_Max,Y_Index_Max)
  U[1==MM]<-0
  #print(U)
}



#-------get the decomposition matrix C and D
#C
#D

Rprof(NULL)
summaryRprof()


#--------Statistics--------------#

############################################################################
#计算两个矩阵的布尔乘积，
#输入为两个对应矩阵
#输出成绩结果
############################################################################
bool_prod<-function(X,Y)
{ 
  Z<-matrix(1,nrow(X),ncol(Y))
  if(ncol(X)==nrow(Y))
  {
    for (i in 1:nrow(X))
    {
      for (j in 1:ncol(Y))
      {
        for(t in 1:nrow(Y))
        {
          Z[i,j]<-1;
          if(X[i,t]*Y[t,j]==1){break}else {Z[i,j]<-0}
        }
      }
    }
    
  }
  
  return(Z)
}




Rprof()
#############################################################################
#对O和A按乘积对I的覆盖排序
#最后结果用X和Y表示
#############################################################################
A <-  C
O <-  D

#排序函数（算法1的主要函数，参数不同，功能不同，^_^ ^_^）
library(Rcpp)
func <- 'NumericMatrix grecond(NumericMatrix U,NumericMatrix A4,NumericMatrix O4,NumericMatrix A,NumericMatrix O) {

int Urown=U.nrow();

int Ucoln=U.ncol();

NumericMatrix T(Urown,Ucoln) ;
while(sum(U)>0){
int cov=0;
int index=0;
for(int i=0;i<O4.nrow();i++){
NumericMatrix temp(Urown,Ucoln) ;
for(int m=0; m<Urown;m++){
for(int n=0;n<Ucoln;n++){
if(A4(m,i)*O4(i,n)==1){
temp(m,n)=1;
}else{
temp(m,n)=0;
}
}
}
NumericMatrix te(Urown,Ucoln);
for(int i=0;i<Urown;i++){
for(int j=0;j<Ucoln;j++){
te(i,j)=U(i,j)*temp(i,j);
}
}
int num=sum(te);
if(cov<num){
cov=num;
index=i;
T=te;
}
} 

NumericMatrix t1(A.nrow(),A.ncol()+1) ;
for (int j = 0;j < A.ncol()+1;j++) {
if(j<A.ncol()) {
t1(_,j) = A(_,j);
} else {
//put the context in the second matrix to the new matrix
t1(_,j) = A4(_,index);
}
}
A=t1;
NumericMatrix t2(O.nrow()+1,O.ncol()) ;
for (int j = 0;j < O.nrow()+1;j++) {
if(j<O.nrow()) {
t2(j,_) = O(j,_);
} else {
//put the context in the second matrix to the new matrix
t2(j,_) = O4(index,_);
}
}
O=t2;
for(int i=0;i<Urown;i++){
for(int j=0;j<Ucoln;j++){
if(U(i,j)*T(i,j)==1){
U(i,j)=0;
}
}
}
}
NumericMatrix t3(A.ncol(),A.nrow()) ;
for(int i=0;i<t3.nrow();i++){
for(int j=0;j<t3.ncol();j++){
t3(i,j)=A(j,i);
}
}
NumericMatrix t4(t3.nrow(),t3.ncol()+O.ncol()) ;
for (int j = 0;j < t3.ncol()+O.ncol();j++) {
if(j<t3.ncol()) {
t4(_,j) = t3(_,j);
} else {
t4(_,j) = O(_,j-t3.ncol());
}
}
return t4;
}'
cppFunction(func)

X=matrix(0,nrow=nrow(A),ncol=0)
Y=matrix(0,nrow=0,ncol=ncol(O))
U=I;#I 是原数据矩阵，dna数据
t=grecond(U,A,O,X,Y);#A和O表示分解的结果，X 和 Y 表示排序以后的结果。  #BUG:modify the value of Matrix I and Matrix U.
#t是返回一个矩阵，通过t可以得到X和Y。
X=t(t[,1:nrow(I)]);
Y=t[,(nrow(I)+1):ncol(t)];

Rprof(NULL)
summaryRprof()  # the function above is too slowly costed 12 hour. So Need to use C++ speed up.
#costed-time function:
#bool_prod 42803.88s
#nrow       3669.48s

Rprof()
#############################################################################
#对生成的X和Y的各列的覆盖进行统计百分比
#############################################################################
func1 <- 'NumericMatrix prt(NumericMatrix X,NumericMatrix Y,NumericMatrix I) {
  double total=sum(I);
int cov=0;
NumericMatrix U=I;
NumericMatrix out(Y.nrow(),1) ;
for(int i=0;i<Y.nrow();i++){
NumericMatrix temp(I.nrow(),I.ncol()) ;
for(int m=0; m<I.nrow();m++){
for(int n=0;n<I.ncol();n++){
if(X(m,i)*Y(i,n)==1){
temp(m,n)=1;
}else{
temp(m,n)=0;
}
}
}
NumericMatrix te(I.nrow(),I.ncol()) ;
for(int i=0;i<I.nrow();i++){
for(int j=0;j<I.ncol();j++){
te(i,j)=U(i,j)*temp(i,j);
}
}
cov=cov+sum(te);
out(i,0)=cov/total;
for(int i=0;i<I.nrow();i++){
for(int j=0;j<I.ncol();j++){
if(U(i,j)*te(i,j)==1){
U(i,j)=0;
}
}
}
}
return out;
}'

cppFunction(func1)
#运行之前，保证I就是原来的数据（我的算法中I的值在这个时候会有变化，我又重新读取了一遍，不知道为什么。）
I <- read.table("/home/reallocing/Git/MyCodeSpace/R_Algorithm/dna.txt",sep = " ")
I <- as.matrix(I)
out=prt(X,Y,I)  #BUG:the cpp function will modified the value of matrix I.
out

Rprof(NULL)
summaryRprof()
#costed 3 hour
#costed-time function
#bool_prod 10442
#print     10442




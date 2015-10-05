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
I <- read.table(file.choose(),sep = " ")
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
  print(U)
}



#-------get the decomposition matrix C and D
C
D

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


X=matrix(0,nrow=nrow(A),ncol=0)
Y=matrix(0,nrow=0,ncol=ncol(O))
judge=matrix(1,nrow(O),1);
U=I;
for(i in 1:(nrow(O))){
  cover=0;
  index=0;
  for(j in 1:nrow(O)){
    Newcover <- sum(U*bool_prod(matrix(A[,j]),t(matrix(O[j,]))))
    if(cover < Newcover){
      cover <- Newcover;
      index <- j;
    }
  }
  judge[index,1]=0;
  X=cbind(X,A[,index]);
  Y=rbind(Y,O[index,]);
  A[,index]=0;
  O[index,]=0;
  U=I-bool_prod(X,Y);
}

Rprof(NULL)
summaryRprof()  # the function above is too slowly costed 12 hour. So Need to use C++ speed up.
#costed-time function:
#bool_prod 42803.88s
#nrow       3669.48s

Rprof()
#############################################################################
#对生成的X和Y的各列的覆盖进行统计百分比
#############################################################################
total=sum(I);
for(i in 1:nrow(Y)){
  if(i==1){
    print(sum(bool_prod(matrix(X[,1:i]),t(matrix(Y[1:i,]))))/total);
  }else{
    print(sum(bool_prod(X[,1:i],Y[1:i,]))/total);
  }
}

Rprof(NULL)
summaryRprof()
#costed 3 hour
#costed-time function
#bool_prod 10442
#print     10442



#随即生成R0(m,n)矩阵
#input：m,n,d（属于[0,1],R中1s的百分比,即density）
#function:生成k密度的1的R0
getR0<-function(rownum,colnum,k){
  i<-0
  K<-round(k*rownum*colnum)
  M<-matrix(0,rownum,colnum)
  R<-matrix(0,rownum,colnum)
  #bug:取0.51是因为，这里有可能取0，那么就没有这个索引了

  while(sum(M)!=K){
    for(q in 1:rownum){ #每次遍历行 取1个元素翻转
      a<-round(runif(1,0.51,colnum))
       R[q,a] <- 1        
      if(M[q,a] == 0){
          R[q,a]<- 1
          M[q,a]<- 1
          i<-i+1
          if(i==K){break}
      }
    }
  }
  
  return(R)
}

Rprof()
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

#############################################################################
#判断行向量是否在矩阵中
#输入为一个矩阵和对应的向量，
#输出为1（在）或0（不在）
#############################################################################
judge_in<-function(I,x){
	res=0;
	for(i in 1:nrow(I)){
		if(sum(abs(I[i,]-x))==0){
			res=1;
			break;
		}
	}
return(res);
}
#############################################################################
#判断行向量是否在矩阵中
#输入为一个矩阵和对应的向量，
#输出为对应向量在矩阵中的index（不在则为0）
#############################################################################
judge_index<-function(I,x){
	res=0;
	for(i in 1:nrow(I)){
		if(sum(abs(I[i,]-x))==0){
			res=i;
			break;
		}
	}
return(res);
}

#############################################################################
#从文本读取一个矩阵
#MUSHROOM DATASET 8124*119
#写入到矩阵I中
#############################################################################
# a<-read.table("mush.txt",header=FALSE,sep=" ")
# I<-matrix(0,nrow=nrow(a),ncol=ncol(a))
# for(i in 1:nrow(a))for(j in 1:ncol(a)){I[i,j]<-a[i,j]}

#read mushroom data
I <- read.table(file.choose(),sep = " ")
I <- as.matrix(I)

#############################################################################
#试验用例
# 12*8
#############################################################################
#i=c(1,1,1,0,1,0,0,0,
#1,1,0,0,0,1,0,1,
#0,1,0,0,1,0,1,0,
#1,1,0,0,0,1,0,1,
#1,1,1,0,1,0,0,0,
#0,1,0,0,1,0,1,0,
#0,1,0,0,1,0,1,0,
#0,0,0,0,0,0,1,0,
#1,1,1,0,1,0,0,0,
#0,0,0,0,0,0,1,0,
#1,1,1,0,1,0,0,0,
#1,1,0,0,0,1,0,1);

#I=matrix(i,ncol=8,byrow=T);

#############################################################################
#从矩阵I的行出发，找出存在的对应关系
#即论文中的O(X,Y,I)
#############################################################################
for(i in 1:nrow(I)){
	x=I[i,]
	y=matrix(1,nrow=nrow(I),1)
	for(j in 1:ncol(I)){
		if(x[j]==1){
			y=y*I[,j]
		}
	}
	if(i==1){
		O1=t(matrix(x));
		A1=y;
	}else{
		if(judge_in(O1,x)==0){
			O1=rbind(O1,x);
			A1=cbind(A1,y);	
		}
	}
}

#############################################################################
#从矩阵I的列出发，找出存在的对应关系
#即论文中的A(X,Y,I)
#############################################################################
for(j in 1:ncol(I)){
	y=I[,j]
	x=matrix(1,ncol=ncol(I),1)
	for(i in 1:nrow(I)){
		if(y[i]==1){
			x=x*I[i,]
		}
	}
	if(j==1){
		O2=t(matrix(x));
		A2=y;
	}else{
		if(judge_in(O2,x)==0){
			O2=rbind(O2,x);
			A2=cbind(A2,y);	
		}
	}
}

#############################################################################
#论文中的O(X,Y,I)^A(X,Y,I)
#生成的关系用矩阵O3和A3表示
#############################################################################
O3=matrix(0,nrow=0,ncol=ncol(I))
A3=matrix(0,nrow=nrow(I),ncol=0)

for(i in 1:nrow(O2)){
	if(judge_in(O1,O2[i,])==1){
			O3=rbind(O3,O2[i,]);
			A3=cbind(A3,A2[,i]);	
		}
}

#############################################################################
#论文中的B(X,Y,I)除去O(X,Y,I)^A(X,Y,I)的部分
#生成的关系用矩阵O4和A4表示
#############################################################################
O4=unique(rbind(O1,O2))
A4=t(unique(t(cbind(A1,A2))))
if(ncol(A3)>0){
	for(i in 1:nrow(O3)){
		j=judge_index(O4,O3[i,])
		if(j==0){next;}
		if(j==1){
			O4=O4[2:nrow(O4),];
			A4=A4[,2:ncol(A4)];
		}else{
			if(j==nrow(O4)){
				O4=O4[1:(nrow(O4)-1),];
				A4=A4[,1:(ncol(A4)-1)];
			}else{
				O4=rbind(O4[1:(j-1),],O4[(j+1):nrow(O4),]);
				A4=cbind(A4[,1:(j-1)],A4[,(j+1):ncol(A4)]);
			}
		}
	}
}


#############################################################################
#论文中算法主要部分，
#分解结果为O和A表示
#############################################################################
A=A3;
O=O3;
if(ncol(A)>0){
	U=I-bool_prod(A,O)
}else{
	U=I;
}
while(sum(U)>0){
	cov=0;
	index=0;
	T=matrix(0,nrow(U),ncol(U));
	for(i in 1:nrow(O4)){
		#num=sum(U*bool_prod(matrix(A4[,i]),t(matrix(O4[i,]))));		
		temp=matrix(0,nrow(U),ncol(U));
		for( m in 1:nrow(A4)){
			for(n in 1:ncol(O4)){
				if(A4[m,i]*O4[i,n]==1){
					temp[m,n]=1;
				}
			}
		}
		num=sum(U*temp);
		if(cov<num){
			cov=num;
			index=i;
			T=U*temp;
		}
	}
	A=cbind(A,A4[,index]);
	O=rbind(O,O4[index,]);
	U=U-T;
}

O
A

Rprof(NULL)
summaryRprof()


Rprof()
#############################################################################
#对O和A按乘积对I的覆盖排序
#最后结果用X和Y表示
#############################################################################
X=matrix(0,nrow=nrow(A),ncol=0)
Y=matrix(0,nrow=0,ncol=ncol(O))
#judge=matrix(1,nrow(O),1);
U=I;
for(i in 1:nrow(O)){
	cover=0;
	index=0;
	T=matrix(0,nrow(U),ncol(U));
	for(j in 1:nrow(O)){
		#num=sum(U*bool_prod(matrix(A[,j]),t(matrix(O[j,]))));
		temp=matrix(0,nrow(U),ncol(U));
		for( m in 1:nrow(A)){
			for(n in 1:ncol(O)){
				if(A[m,j]*O[j,n]==1){
					temp[m,n]=1;
				}
			}
		}
		num=sum(U*temp);
		if(cover<num){
			cover=num;
			index=j;
			T=U*temp;
		}
	}
	#judge[index,1]=0;
	X=cbind(X,A[,index]);
	Y=rbind(Y,O[index,]);
	A[,index]=0;
	O[index,]=0;
	U=U-T;
}


Rprof(NULL)
summaryRprof()

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



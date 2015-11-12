#author:LP
#the first try for data.table
#learn refer link: https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.pdf
DF = data.frame(x = c("b","b","b","a","a"),v = rnorm(5),c = c(1,2,3,4,5))  #data.frame
DF

library(data.table)
#data.table:with a colon
DT = data.table(x = c("b","b","b","a","a"),v = rnorm(5),c = c(1,2,3,4,5))
DT

#convert the existing data.frame objects to data.table
class(cars)  #the object is data.frame;
CARS = data.table(cars)  #convert to data.table
head(CARS)


#------------
DT = as.data.table(DF)
DT

##display the memory of the data.table;
tables()


sapply(DT, class)


#index
DT[2,]  #select the row 2;

DT[x == "b"]

#cause err
DT['b',]  #no key for index

#setKey()
setkey(DT,x)  #re-ordered according to the value of x;
DT  
tables() #now, we will found the x has the key

DT['b',]

DT['b',mult="first"] #return the first row;
DT['b',mult="last"]  #last row;

grpsize = ceiling(1e7/26^2)    

head(DF,3)
tail(DF,3)
dim(DF)


#---------fast grouping-----
DT[,sum(v)]
DT[,sum(c)]
DT[,sum(v),by=x]



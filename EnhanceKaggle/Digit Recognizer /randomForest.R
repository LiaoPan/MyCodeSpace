#https://www.kaggle.com/c/digit-recognizer/data
#how to get score 1? 
#https://www.kaggle.com/c/digit-recognizer/forums/t/18979/how-to-get-1-0-score
#Learning random forest from kaggle
library(randomForest)
library(readr)

set.seed(0)


#set the para of randomForest
numTrain <- 42000 #10000
numTrees <- 1000

#read train and test data
train <- read_csv("/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/train.csv") #in /KDD2015/
test <- read_csv("/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/test.csv")

#the row of train
nrow(train)  #42000

rows <- sample(1:nrow(train),numTrain)
labels <- as.factor(train[rows,1])
train <- train[rows,-1]  #don't read the first column,-1

rf <- randomForest(train,labels,xtest=test,ntree=numTrees)
predictions <- data.frame(ImageId = 1:nrow(test),Label=levels(labels)[rf$test$predicted])

head(predictions)

write_csv(predictions,"/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/rf_learn_digit_rec_42000_1000.csv")
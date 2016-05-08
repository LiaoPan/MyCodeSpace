#author:LP
#read few lines of train and test data as a sample of train and test 
#just convenience for coding;

library(readr)

test_sample <- read_csv("/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/test.csv",n_max = 10) # the num set by you.
train_sample <- read_csv("/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/train.csv",n_max = 10)

write_csv(test_sample,"/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/test_sample.csv")
write_csv(train_sample,"/media/reallocing/本地磁盘1/KDD2015/Dataset/digit-recognizer/train_sample.csv")

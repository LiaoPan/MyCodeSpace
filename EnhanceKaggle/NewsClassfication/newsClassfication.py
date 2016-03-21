#coding:utf-8
#author:L.P
import pandas as pd
import numpy as np
import jieba
from tgrocery import Grocery
import time
#=======================================================


t0 = time.time()

#load  train data
train_file = pd.read_csv(r"/media/reallocing/本地磁盘/KDD2015/Dataset/NewsClassfication/news_train.csv",names = ["ID","Value","String"],sep=" ")  #在这里，我只取乐小半部分的训练集，不然对于这个库来说太慢．
print "load's train file length:",len(train_file)
print "train_file's String",train_file["String"]
print "train_file's Value",train_file["Value"]
#load test data
#test_file = pd.read_table("test.txt",names = ["ID","String"])

#print train_file["Value"]  # it is a pandas.series
#train_file must convert to list.
train_value = train_file["Value"].tolist()
print train_value[1]
train_string = train_file["String"].tolist()
train_src = zip(train_value,train_string)
print train_src[12]
#print "train's src len",len(train_src)

#test file
#print "test's file len",len(test_file)
# test_src = test_file["String"].tolist()
# print "test_src",test_src[0]
# print "test's len",len(test_src)

#tgrocery classify
grocery =Grocery('sample')
grocery.train(train_src)
grocery.save()
new_grocery = Grocery('sample')
new_grocery.load()


#predict
print new_grocery.predict("当你坐上飞机在上面俯视它的时候")
#load the submit standard file
submit = pd.read_table(r"/media/reallocing/本地磁盘/KDD2015/Dataset/NewsClassfication/sample_a.txt",names=["id","value"])
print "the submit file len is ",len(submit)

t = []
f = open(r"/media/reallocing/本地磁盘/KDD2015/Dataset/NewsClassfication/news_test.csv")
for line in f.readlines():
    #print line.split("\t")[1]  #content
    t.append(new_grocery.predict(line.split(" ")[1]))
submit["value"] = t
print submit


submit.to_csv("submit.csv",sep=",")
t1 = time.time()
print "cost time:",(t1-t0)
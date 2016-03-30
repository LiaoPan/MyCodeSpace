#coding:utf-8
#author:LP
#time:20160330


#set
#创建一个set，需要提供一个list作为输入集合；

s = set([1,2,3,4,1,2,4])

print s

s1 = set(['1','a','1','2',2])

print s1


#增加元素

s.add("d")

print s

#删除元素
s.remove(1)
print s


#数学上的交集和并集
print s&s1
print s|s1


l =[1,1,2,3,4,3,4,3]
s2 = set(l)

print s2


s3 = set((1,2,3,'s',[1,2,3]))  #这样将list（【1,2,3】）放入集合会报错；

print s3
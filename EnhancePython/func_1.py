#coding:utf-8
#author:LP
#time:20160329


def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

print add_end()
print add_end([2,3])
age= 33

if age > 10:
    print "ok"
elif age < 10:
    print "<10"
else:
    print "sorry"


#可变参数

#sum
num = [1,23,45,6]
def sum_info(*num):
    sum = 0
    for i in num:
        sum = sum + i
    return sum
print sum_info(*num)
print sum_info(1,2,3,45,6)

#关键词参数
def add_info(name,sex,**keypara):
    print name,sex,keypara
add_info('Mike','M',age = 12,home = "USA")

#参数组合
def para_zom(a,b,c = 1,*d,**f):
    print 'a',a,'b',b,'c',c,'d',d,'f',f

para_zom(1,2,3,3,4,5,ok='Hello',num = [1,2,34,4])
para_zom(*(1,2,34,343434,234),name = "MIke")
#coding:utf-8
_author_ = 'LiaoPan'
import math

#判断是否是偶数；
def is_even(x):
    if x%2 == 0:
        return True
    else:
        return False

print filter(is_even,[2,3,4,5,6,7,8,9,12])


#找到1~100的所有素数：
def is_prime(x): #判断x是否是素数；
    #能被2所整除，false
    if x % 2 == 0 and x > 2:
        return False
    else:
        return all(x % i for i in range(3,int(math.sqrt(x)+1),2))  #被小于sqrt（n）的素数整除，false；

print filter(is_prime,range(1,101))

#删除1~100的所有素数
def not_prime(x):
    if x % 2 == 0 and x > 2:
        return True
    else:
        return not all(x % i for i in range(3,int(math.sqrt(x)+1),2))

print filter(not_prime,range(1,101))
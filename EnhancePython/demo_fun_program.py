#coding:utf-8
#author:LP
#time:20160331

#review 列表生成式

print [x*x for x in range(1,11) if x%2==0]

print [x*y*z for x in range(1,6) for y in range(1,6) for z in range(1,10)]

print [x for x in 'ABNDX']

#key and value

dic = {'name':'LP','gender':'M','age':'24'}
for key,value in dic.iteritems():
        print 'key:',key,'value:',value


dic2 = {'name':'LP1','gender':'M','age' : '12'}

print [key + ' and '+ value for key,value in dic.iteritems() ]


#生成器
g = (x*x for x in range(1,10))
for i in range(1,10):  #notice:输出一次后,就没有啦
    print g.next()



g1 = (x*x*x for x in range(1,10))
for i in g1:
    print 'i:',i


#高阶函数:就是让函数的参数可以接受别的函数
def absoluteAdd(x,y,f=abs):  #可以传入默认函数
    return f(x)+f(y)

print absoluteAdd(-3,-5,abs)
print absoluteAdd(-4,-6)

#map/reduce

#map :参数为一个函数和序列，将函数作用与=于序列的每个元素。
def f(x):
    return x*x*x

print map(f,[1,2,3,4,5])

print map(str,[1,12,3,4,4])

print map(int,["23","45"])


#reduce:函数作用于序列上，但函数需接受两个参数，对序列进行累积运算。
#for example ： SUM

def sum1(x,y):
    return x+y

print reduce(sum1,[1,2,3,4,5])


#将字符拼接成字符串
def addstr(x,y):
    return x+y

print reduce(addstr,["H","e","l","l","o"])


#将str转换为int的函数，结合map/reduce；

def char2num(s):
    return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]

print map(char2num,'123456')
print map(char2num,'123456')

def fn(x,y):
    return x*10+y

print reduce(fn,map(char2num,'1234567'))

#strip() #只移除头尾指定字符串
s = "0000fsfdsfds0000fdsfsdfs0000"
print s.strip("0")

print s and s.strip("0")

#filter :（过滤序列）接受函数作用于序列，然后根据true or false 进行返回元素
#def isodd():

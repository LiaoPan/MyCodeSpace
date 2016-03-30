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


#高阶函数
def absoluteAdd(x,y,f=abs):  #可以传入默认函数
    return f(x)+f(y)

print absoluteAdd(-3,-5,abs)
print absoluteAdd(-4,-6)
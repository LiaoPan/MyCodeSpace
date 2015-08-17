#coding=utf-8
from pandas import Series,DataFrame
import pandas as pd
import numpy as np

obj = Series([4,7,-5,3])
print obj
print obj.values
print obj.index

print "#============================================#"
obj2 = Series([4,7,-5,3],index=['d','b','a','c'])
print obj2

print "#=================Index===========================#"
print obj2['a']
print obj2[['a','b']]

print "#==================Operations==========================#"
print obj2[obj2>2]
print obj2*2
print obj2-2
print np.exp(obj2)

print "#=================直接通过字典来创建Series===========================#"
sdata = {'ohio':35000,'Texes':71000,'Oregen':16000,'Utah':5000}
obj3 = Series(sdata)
print obj3
print "#-----------------------------#"
stats = ['California','ohio','Texes']
obj4 = Series(sdata,index=stats)
print obj4
print "#=================判断是否缺失===========================#"
print pd.isnull(obj4)
print pd.notnull(obj4)
print obj4.isnull()
print "#============================================#"
obj4.name = "population"

obj4.index.name = 'state'
print obj4
print "#==================DataFrame==========================#"
data = {'state':['Ohio','Ohio','Nevada','Nevada'],
		'year':['20','201','22','23'],
		'pop':[1.5,1.4,1.4,1.7]
		}

frame = DataFrame(data)
print frame
print "#===================指定列表顺序=========================#"
frame1 = DataFrame(data,columns=['year','state','pop'])
print frame1
print '#--------------index----------------#'
print frame1.state
print frame['year']

print '#-------------modified------------------#'

frame1['debt'] = np.arange(4.)
print frame1

print '#---------del-------------#'
frame1["OK"] = frame1.state == 'Ohio'
print frame1
del frame1['OK']
print frame1

print '#------------矩阵列行形式的DataFrame------------#'
pop = {'Nevada':{2001:2.4,2002:2.9},
		'Ohio':{2001:1.7,2002:3.6,2004:9.7}}
frame3 = DataFrame(pop)
print frame3 

print '#----转置----#'
print frame3.T

print frame3["Ohio"][:]

print '#==========逻辑问答===========#'
print 'Ohio' in frame3.columns



print '#------reindex-----#'
obj = Series([4.5,7.2,-5.3,3.6],index=['a','d','b','c'])
print obj
obj2 = obj.reindex(['a','b','c','d','e','f'],fill_value=0)
print obj2

print '#-------丢弃指定轴上的值------------#'
obj = Series(np.arange(5.),index=['a','b','c','d','e'])
print obj
new_obj = obj.drop('a')
print new_obj

data =DataFrame(np.arange(16.).reshape((4,4)),
				index=['Ohio','Colorado','Utha','NewYork'],
				columns=['one','two','three','four'])
				
print data
print data.drop('Ohio')  #删除行
print data.drop('one',axis=1)   #删除列  axis=0表示行 1表示列



print '#--------索引选取过滤---------#'
obj = Series(np.arange(4.),index=['a','b','c','d'])
print obj
print obj[1]
print obj["b"]
print '#------------#'
print obj[2:4]    #Series的Notice:选取的是索引3,4 ，即与python普通切片不同，它在这里采用末端包含。
print obj[['c','d']]
print obj[[1,3]]
print obj[obj<2]

print '#----DataFrame的------#'
data =DataFrame(np.arange(16.).reshape((4,4)),
				index=['Ohio','Colorado','Utha','NewYork'],
				columns=['one','two','three','four'])
				
print data
print '--------'
print data['two']
print '--------'
print data[:2]   #Notice:打印的是第一二行。即索引0,1
print '---------'
print data[data['three']>5]
print '---------'
print data<5
print '---------'
data[data<5] = 0
print data


print '#=======DataFrame ix====选取某个元素======#'
print data.ix['Colorado','two']
print data.ix[['Colorado','Ohio'],['one','two']]
print '----print data.ix[2]-----'
print data.ix[2]  #选取行   
print "----print data.ix[:'Utha','two']-----"
print data.ix[:'Utha','two']
print '----print data.ix[data.three>5,:3]-----'
print data.ix[data.three>5,:3]


print "#-------广播------#"
frame = DataFrame(np.arange(12.).reshape(4,3),
				index=['Utah','Ohio','Texas','Oregon'],
				columns=list('bde')
				)
print frame		

series = frame['d']
print series
print frame.state['Utah']
print frame.sub(series,axis=0)		#默认广播方式是将series当做一行来减，即按列广播  沿着行一直向下广播






















































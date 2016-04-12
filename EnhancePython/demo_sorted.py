#coding:utf-8
_author_='LiaoPan'

#sorted function
#https://docs.python.org/2/howto/sorting.html

#for list
list = [23,4,6,12,122]
list1= ["ok","as","hello"]

print sorted(list,reverse=True)
print sorted(list)
print sorted(list1,reverse=True)
print sorted(list1)

#for dict

'''
对python的字典(dict)排序有很多方法，这里只介绍一种最优雅，最pythonic的方式：

对字典按键/按值排序，用元组列表的形式返回，同时使用lambda函数来进行；

sorted(iterable[, cmp[, key[, reverse]]]
cmp和key一般使用lambda
如：
>>> d={“ok”:1,”no”:2}
对字典按键排序，用元组列表的形式返回
>>> sorted(d.items(), key=lambda d:d[0])
[('no', 2), ('ok', 1)]
对字典按值排序，用元组列表的形式返回
>>> sorted(d.items(), key=lambda d:d[1])
[('ok', 1), ('no', 2)]
'''
dict1 = {"A":28,"B":26,"C":29}
print sorted(dict1)   #by key
print sorted(dict1,reverse=True)

print "按字典的值进行排序",sorted(dict1.items(),key=lambda v:v[1])  #按字典的值进行排序

print sorted(dict1.items(),reverse=True)


#for tuple
student_tuples = [
    ('john', 'A', 15),
    ('jane', 'B', 12),
    ('dave', 'B', 17),
]

print "按名字排序",sorted(student_tuples,key=lambda x:x[0])
print "按年龄排序",sorted(student_tuples,key=lambda x:x[2])
#for object
class Student:
        def __init__(self, name, grade, age):
            self.name = name
            self.grade = grade
            self.age = age
        def __repr__(self):
            return repr((self.name, self.grade, self.age))
student_objects = [
    Student('john', 'A', 15),
    Student('jane', 'B', 12),
    Student('dave', 'B', 10),
]


print "sorted by grade",sorted(student_objects,key=lambda x :x.grade)
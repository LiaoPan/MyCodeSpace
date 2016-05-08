#coding:utf-8
_author_ = "LiaoPan"

"""
返回函数
"""

def calc_sum(*args):
    """

    :rtype: object
    """
    ax = 0
    for n in args:
        ax = ax + n
    return ax


#返回函数
def calc_sum1(*args):
    def sum():
        ax = 0
        for n in args:
            ax = ax + n
        return ax
    return sum

print calc_sum(*[1,2,3,4])
f = calc_sum1(*[1,2,3,4])
print f()

#闭包
"""
返回闭包时牢记的一点就是：返回函数不要引用任何循环变量，或者后续会发生变化的变量。

如果一定要引用循环变量怎么办？方法是再创建一个函数，用该函数的参数绑定循环变量当前的值，无论该循环变量后续如何更改，已绑定到函数参数的值不变：
返回闭包时牢记的一点就是：返回函数不要引用任何循环变量，或者后续会发生变化的变量。

如果一定要引用循环变量怎么办？方法是再创建一个函数，用该函数的参数绑定循环变量当前的值，无论该循环变量后续如何更改，已绑定到函数参数的值不变：
"""
def count(m,n):
    """

    :param m: 开始的范围 |begin num
    :param n: 结束的范围 |end num
    :return: 返回函数
    """
    c = []
    for i in range(m,n+1):
        def f(j):
            def g():
                return j*j
            return g
        c.append(f(i))
    return c

s = count(2,6)
print "Start-----"
for i in s:
    print i()

print repr(count.__doc__).encode('gbk') #输出文档注释

encoded = '\xe4\xbb\x8a\xe5\xa4\xa9\xe5\xa4\xa9\xe6\xb0\xa3\xe7\x9c\x9f\xe5\xa5\xbd'
print encoded.encode('utf-8')
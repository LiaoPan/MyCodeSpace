#coding:utf-8
"""
extract the references from paper(pdf).
"""
_author_ = 'Liao Pan'

def fun():
    """
    just for fun;
    -A
    *B*
    *1
    *2
        *2.1
        *2.2
    |zhe xie hang.
    1.Hello
    2.Ok

    :param etype: exception type
    :return: void
=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======
    """
    pass

if __name__ == '__main__':
    """
    在main()函数前加入了一个判断语句，
    以此来让脚本判断自己是被当做模块调用，还是被直接运行的。
    当被import作为模块调用的时候，if以下的代码就不会被执行，
    也就是说main()函数不会被执行。
    """
    #: Doc comment for class attribute Foo.bar.
    #: It can have multiple lines.
    fun()
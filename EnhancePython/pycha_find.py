#coding:utf-8

_author_ = "LiaoPan"

import string

def find_char(s):
    """
    找到字符并返回
    :param s: char
    :return: true or false
    """

    if 64 < ord(s) < 91 or 96 < ord(s) < 123:
        return True
    else:
        return False

with open("data.txt",'rb') as f:
    ll = list()
    for line in f.readlines():
        for s in line:
            if find_char(s):
                ll.append(s)


print "".join(ll)

# Test = "())&#@*[#}+#^}#%!![#&*}^{^(({+#*[!{!}){(!*@!+@[_(*^+*]$]+@+*_##)&)^(@$^]e@][#&)("
# for line in Test:
#     l = find_char(line)
#



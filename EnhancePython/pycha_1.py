#coding:utf-8
_author_ = "LiaoPan"

import pdb
from string import maketrans

Target = "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj."



def split_str(str):
    """
    将字符串以空格为间隔划分成list
    :param str:string
    :return: list[string]
    """
    l = str.split(" ")
    return l



def transform_char(c):
    """
        将字符串的每个字符值+2,然后再恢复成字符,再链接成字符串
    :param c: string c | "acv"  "ab'c"
    :return: transformed string
    """
    tl = list()
    #pdb.set_trace()
    for s in c:
        if 64 < ord(s) < 91 or 96  < ord(s) < 123:
            t = ord(s) + 2
            if t > 122:
                t = t -26 #loop ; for example :z-->b ; y-->a
            if 93> t > 91:
                t = t - 26 # Z--->B
            tl.append(chr(t))
        else:
            tl.append(s)

    #pdb.set_trace()
    tl = "".join(tl)
    return tl





# Main

#print split_str(Target)

print transform_char("fmnc")

for l in split_str(Target):
    ll = list()
    ll.append(transform_char(l))
    print ll

intab = "abcdefghijklmnopqrstuvwxyz"
outtab = "cdefghijklmnopqrstuvwxyzab"
trantab = maketrans(intab,outtab)
s = "map"
print s.translate(trantab)


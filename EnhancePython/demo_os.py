#coding:utf-8
_author_  = "LiaoPan"
_time_ = "16.6.20"


"""
Task:
 编写一个search(s)的函数，
 能在当前目录以及当前目录的所有子目录下查找文件名包含指定字符串的文件，
 并打印出完整路径
"""
import sys
import os



key = sys.argv[1] #获取要搜索的关键词

current_dir = os.path.abspath('.')
print current_dir

def search(s):
    pass
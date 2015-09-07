#coding:utf-8
import numpy as np
#Data = open('House_prices.txt')
#print Data.readlines()
# for line in Data:
	# line = line.rstrip('\n')   #去掉文本中的‘\n’
	# print line
arr = np.loadtxt('House_prices.txt',delimiter=' ')
print arr
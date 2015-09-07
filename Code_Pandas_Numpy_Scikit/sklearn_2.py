#coding:utf-8
#author:L.P 
#time:201509071847
#==========Preprocessing data=========================#
from sklearn import preprocessing
import numpy as np

X = np.array([[1.,-1.,2.],
			  [2.,0.,0.],
			  [0,1.,-1.]])
			  
print "X\n",X

X_scaled = preprocessing.scale(X)

print "Scaled_X\n",X_scaled  #scale and make all features are centered around zero and 
							#have variance in the same order. mean = 0;std = 1;

print "X_scaled.mean(axis=0)\n",X_scaled.mean(axis=0)
print "X_scaled.std(axis=0)\n",X_scaled.std(axis=0)


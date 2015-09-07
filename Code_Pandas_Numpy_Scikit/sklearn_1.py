#coding:utf-8
#author:L.P 
#time:201509071617

#========Data representation===========#
#---everything is numpy array--------#
print "Data representation\n"
from sklearn.datasets import load_digits
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA

digits = load_digits()
print "images shape:%s"%str(digits.images.shape)
print "targets shape:%s"%str(digits.target.shape)

plt.matshow(digits.images[0],cmap = plt.cm.Greys)
#plt.show()
# plt.bar(left = 0,height=1)
# plt.show()

#=================Prepare the data==============#
print "Prepare the data\n"
X = digits.data.reshape(-1,64)
print X.shape
print X

y = digits.target
print y.shape

#===========Principal Component Analysis===========#
print "Principal Component Analysis\n"
pca = PCA(n_components=2)
pca.fit(X)
X_pca = pca.transform(X)
X_pca.shape

print "X_pca",X_pca
# pca =PCA(n_components=2)
# pca.fit(X)
# X_pca = pca.transform(X)
# X_pca.shape

plt.figure(figsize=(16,10))
plt.scatter(X_pca[:,0],X_pca[:,1],c=y)
plt.show()

print "pca.mean_.shape",pca.mean_.shape
print "pca.components_.shape",pca.components_.shape






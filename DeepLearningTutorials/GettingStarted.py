#coding:utf-8
#author:L.P 
#time:201009051058

#==============Main=======================#
#
#Getting started on Learning DeepLearning
#
#============End=========================#

import cPickle,numpy,gzip
from theano import *
import theano.tensor as T 

#Load the dataset
f = gzip.open('mnist.pkl.gz','rb')
train_set,valid_set,test_set = cPickle.load(f)
print train_set
print valid_set
print test_set
f.close()

#========store data and access a minibatch===========#

#-----fun------#
#loads dataset into shared variables
def shared_dataset(data_xy):
	data_x,data_y = data_xy
	shared_x = theano.shared(numpy.asarray(data_x,dtype = theano.config.floatX))
	shared_y = theano.shared(numpy.asarray(data_y,dtype = theano.config.floatX))
	return shared_x,T.cast(shared_y,'int32')  #let 'shraed_y' cast to int.
	
test_set_x,test_set_y = shared_dataset(test_set)
train_set_x,train_set_y = shared_dataset(train_set)
valid_set_x,valid_set_y = shared_dataset(valid_set)

batch_size = 500 #size of minibatch

#accessing the  third minibatch of the training set
data = train_set_x[2*500:3*500]
label = train_set_y[2*500:3*500]

# print 'daata:',data
# print 'label',label
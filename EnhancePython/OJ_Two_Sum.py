#coding:utf-8
#author:L.P 
#time:201509022018
#Problem:Online judge - Two Sum

#input:
nums = [2,7,8,3]
target = 10
def twoSum(nums,target):
	if len(nums) <= 1:
		return False
	buff_dict = {}
	for i in range(len(nums)):
		if nums[i] in buff_dict:
			#print "[buff_dict[nums[i]], i+1]",([buff_dict[nums[i]], i+1])
			return [buff_dict[nums[i]], i+1]  #Bug1:
		else:
			buff_dict[target - nums[i]] = i+1
			#print "else buff_dict",(buff_dict)
				

def twoSum1(nums,target):
	if len(nums)<=1:
		return False
		
	buff = {}   #Define Hash table
	for i in range(len(nums)):
		if nums[i] in buff:
			#print "return results:",([buff[nums[i]],i+1]) 
			print [buff[nums[i]],i+1]    #Bug1:��returnֻ�᷵��һ�ԣ�����print���Է�������ƥ��Ľ��
			 
		else:
			buff[target-nums[i]] = i+1

def twoSum2(nums, target):
    m = {}
    for i,num in enumerate(nums):  #����������ֵ
        if target - num in m:
			return [m[target - num],i + 1]
        m[num] = i + 1			
		
	
				
print twoSum(nums,target)
print twoSum1(nums,target)
print twoSum2(nums,target)

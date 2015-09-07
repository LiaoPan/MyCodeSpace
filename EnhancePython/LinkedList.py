#coding:utf-8
#auhtor:L.P 
#time:201509071258

class ListNode:
	def __init__(self,data):
		self.data = data
		self.next = None
		

		
l1 = ListNode(11)
l2 = ListNode(12)
l3 = ListNode(22)

l1.next = l2
l2.next = l3

print "l1:",l1.data
print "l2:",l1.next.data
print "l3:",l1.next.next.data

#------------Singly Linked list-------------------#
#----traversing a linked list-------------#
def traversal(head):
	curNode = head
	while curNode is not None:
		print curNode.data
		curNode = curNode.next
		
#------searching a node---------#
def unordersearch(head,target):
	curNode = head
	while curNode is not None and curNode.data != target:
		curNode = curNode.next
	return curNode is not None
		
#---------------prepending a node to the linked-----------#
#add the new node to list and adjust the head to point to the new node.
def prependNode(head,newNode):
	newNode.next= head
	head = newNode
	return head


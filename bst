class BinarySearchTree:
	def __init__(self,value):
		self.value = value
		self.leftChild = None
		self.rightChild = None


	def insert(self,value):
		if value <= self.value and self.leftChild:
			self.leftChild.insert(value)
		elif value <= self.value :
			self.leftChild = BinarySearchTree(value)
		elif value > self.value and self.rightChild:
			self.rightChild.insert(value)
		else:
			self.rightChild = BinarySearchTree(value)		


	def find(self,value):
		if value < self.value and self.leftChild:
			return self.leftChild.find(value)
		if value > self.value and self.rightChild:
			return self.rightChild.find(value)

		return value == self.value


	def remove(self,value,parent):
		if value < self.value and self.leftChild:
			return self.leftChild.remove(value,self)
		elif value < self.value:
			return False
		elif value > self.value and self.rightChild:
			return self.rightChild.remove(value,self)
		elif value > self.value:
			return False
		else:
			if self.leftChild is None and self.rightChild is None and self == parent.leftChild:
				parent.leftChild = None
				self.clearNode()
			elif self.leftChild is None and self.rightChild is None and self == parent.rightChild:
				parent.rightChild = None
				self.clearNode()
			elif self.leftChild and self.rightChild is None and self == parent.leftChild:
				parent.left_child = self.left_child
				self.clear_node()
			elif self.leftChild and self.rightChild is None and self == parent.rightChild:
				parent.rightChild = self.leftChild
				self.clearNode()
			elif self.rightChild and self.leftChild is None and self == parent.leftChild:
				parent.leftChild = self.rightChild
				self.clearNode()
			elif self.rightChild and self.leftChild is None and self == parent.rightChild:
				parent.rightChild = self.rightChild
				self.clearNode()	
			else:
				self.value = self.rightChild.findMinimumValue()
				self.rightChild.remove(self.value, self)
			return True
	
	def clearNode(self):
		self.value = None
		self.leftChild = None
		self.rightChild = None	
	def findMinimumValue(self):
		if self.left_child:
			return self.left_child.find_minimum_value()
		else:
			return self.value	


	

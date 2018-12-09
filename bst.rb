require 'pry-byebug'
require './node'

class BinarySearchTree
	attr_accessor :root_node, :left, :right

	def initialize(root_val=nil, left=nil, right=nil)
		@root_node = root_val
		@left = left
		@right = right
	end

	def insert(val)
		current = self
		if val < current.root_node
			current.left = BinarySearchTree.new(val, nil, nil)
		elsif val > current.root_node
			current.right = BinarySearchTree.new(val, nil, nil)
		end
	end
end

bst = BinarySearchTree.new(30)
bst.insert(50)
bst.insert(25)
binding.pry
bst.insert(75)
# bst.insert(8)
# bst.insert(15)
binding.pry
bst
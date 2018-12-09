require 'pry-byebug'

class Node
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end
end

class BinaryTree
  attr_accessor :root_node

  def initialize(root_value)
    @root_node = Node.new(root_value, nil, nil)
  end

  def pre_order_traverse(node = @root_node)
    return if node.nil?
    puts node.value
    pre_order_traverse(node.left)
    pre_order_traverse(node.right)
  end

  def in_order_traverse(node = @root_node)
    return if node.nil?
    in_order_traverse(node.left)
    puts node.value.to_s
    in_order_traverse(node.right)
  end

  def insert(value)
    current_node = @root_node
    while current_node
      if value < current_node.value && current_node.left.nil?
        current_node.left = Node.new(value, nil, nil)
      elsif value > current_node.value && current_node.right.nil?
        current_node.right = Node.new(value, nil, nil)
      elsif value < current_node.value
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      else
        return
      end
    end
  end

  def search(value, node=@root_node)
    return puts node if value == node.value
    if value < node.value
      search(value, node.left)
    elsif value > node.value
      search(value, node.right)
    end
  end
end

tree = BinaryTree.new(5)
tree.insert(4)
tree.insert(3)
tree.insert(6)
tree.insert(7)
tree.insert(1)
tree.search(6)
binding.pry
tree.in_order_traverse

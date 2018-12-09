require 'pry-byebug'

class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(root_value)
    @value = root_value
    @left = nil
    @right = nil
  end

  def insert_left(new_node)
    if @left == nil
      @left = BinaryTree.new(new_node)
    else
      tree = BinaryTree.new(new_node)
      tree.left = @left
      @left = tree
    end
  end

  def insert_right(new_node)
    if @right == nil
      @right = BinaryTree.new(new_node)
    else
      tree = BinaryTree.new(new_node)
      tree.right = @right
      @right = tree
    end
  end

  def get_right
    @right
  end

  def get_left
    @left
  end

  def set_root=val
    @value = val
  end

  def get_root
    @value
  end

  # def pre_order_traverse(node = @value)
  #   return if node.nil?
  #   puts node.value
  #   pre_order_traverse(node.left)
  #   pre_order_traverse(node.right)
  # end

  # def in_order_traverse(node = @value)
  #   return if node.nil?
  #   in_order_traverse(node.left)
  #   puts node.value.to_s
  #   in_order_traverse(node.right)
  # end

end

# tree = BinaryTree.new(5)
# tree.insert_left(4)
# tree.insert_left(3)
# tree.insert_right(6)
# tree.insert_right(7)
# binding.pry
# puts ""
# tree.set_root(3)
# tree.get_root
# tree.in_order_traverse

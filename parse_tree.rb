require 'pry-byebug'
require './binary_tree2'

def build_parse_tree(expression)
  expression_list = expression.split
  btree = BinaryTree.new('')
  stack = []
  stack << btree
  current_tree = btree

  expression_list.each do |exp|
    if exp == '('
      current_tree.insert_left(nil)
      stack << current_tree
      current_tree = current_tree.get_left
    elsif !['+', '-', '*', '/', ')'].include?(exp)
      current_tree.set_root = exp.to_i
      parent = stack.pop()
      current_tree = parent
    elsif ['+', '-', '*', '/'].include?(exp)
      current_tree.set_root = exp
      current_tree.insert_right(nil)
      stack << current_tree
      current_tree = current_tree.get_right
    elsif exp == ')'
      current_tree = stack.pop()
    end
  end
  btree
end

parse_tree = build_parse_tree("( ( 10 + 5 ) * 3 )")

puts parse_tree.inspect

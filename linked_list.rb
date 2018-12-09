require_relative 'node'
require 'pry-byebug'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def is_empty
    @head == nil
  end

  def add(item)
    new_node = Node.new(item)
    new_node.set_next(@head)
    @head = new_node
  end

  def size
    current = @head
    count = 0

    while current do
      current = current.get_next
      count += 1
    end

    count
  end

  def search(item)
    current = @head
    found = false

    while current && !found do
      if current.get_data == item
        found = true
        current.get_data
      else
        current = current.get_next
      end
    end

    current
  end

  def remove(item)
    current = @head
    previous = nil
    found = false

    while !found do
      if current.get_data == item
        found = true
      else
        previous = current
        current = current.get_next
      end
    end

    if found
      if current.get_next == nil
        previous.set_next(nil)
      else
        previous = previous.set_next(current.get_next)
      end
    end
  end

  def append(item)
    new_node = Node.new(item)
    current = @head

    while current.get_next do
      current = current.get_next
    end

    current.set_next(new_node)
    binding.pry
  end
  # def append(value)
  #   if @head
  #     find_tail.set_next(Node.new(value))
  #   else
  #     @head = Node.new(value)
  #   end
  #   binding.pry
  # end
  def find_tail
    node = @head
    return node if !node.next
    return node if !node.next while (node = node.next)
  end

  def insert_after(target, item)
    current = @head
    found_node = search(target)
    new_node = Node.new(item)

    if current != found_node
      while current.get_next != found_node
        current = current.get_next
      end
    end

    new_node.set_next(found_node)
    current.set_next(new_node)
  end

  def append_after(target, value)
    node           = search(target)
    return unless node
    old_next       = node.get_next
    node.set_next( Node.new(value) )
    node.get_next.set_next(old_next)
    binding.pry
  end

  def index
  end

  def pop
  end

end

mylist = LinkedList.new
mylist.add(31)
mylist.add(77)
mylist.add(93)
mylist.append(100)






# mylist.add(100)

# mylist.remove(54)
# mylist.remove(93)
# mylist.remove(31)
# puts mylist.size
# mylist.append(99)
# puts mylist.size
# puts mylist.search(99)

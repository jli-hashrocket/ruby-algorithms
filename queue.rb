require 'pry-byebug'

class Queue
  attr_accessor :items

	def initialize
    @items = []
  end

  def isEmpty
    @items == []
  end

  def enqueue(item)
    @items.insert(0, item)
  end

  def dequeue
    @items.pop
  end

  def size
    @items.length
  end

end
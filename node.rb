class Node
  attr_reader :val
  attr_accessor :left, :right

  def initialize(value=nil)
    @val = value
    @left = nil
    @right = nil
  end

end

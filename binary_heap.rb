require 'pry-byebug'

class BinHeap
	def init
		@heap_list = [0]
		@current_size = 0
	end

	def insert(k)
		@heap_list << k
		@current_size = @current_size + 1
		percolate_up(@current_size)
	end

	def percolate_up(i)
		while i/2 > 0
			if @heap_list[i] < @heap_list[i/2]
				temp = @heap_list[i/2]
				@heap_list[i/2] = @heap_list[i]
				@heap_list[i] = temp
			end
			i = i/2 
		end
	end

	def percolate_down(i)
		while i*2 <= @current_size
			min_child = minimum_child(i)
			if @heap_list[i] > @heap_list[min_child]
				tmp = @heap_list[i]
				@heap_list[i] = @heap_list[min_child]
				@heap_list[min_child] = tmp
			end

			i = min_child
		end
	end

	def minimum_child(i)
		if i * 2 + 1 > @current_size
			i * 2
		else
			if @heap_list[i*2] < @heap_list[i*2+1]
				i * 2
			else
				i * 2 + 1
			end
		end
	end

	def delete_min
		return_val = @heap_list[1]
		@heap_list[1] = @heap_list[@current_size]
		@current_size = @current_size - 1
		@heap_list.pop 
		percolate_down(1)
		return_val
	end

	def build_heap(alist)
		i = alist.length/2
		@current_size = alist.length
		@heap_list = [0] + alist
		while i > 0
			percolate_down(i)
			i = i - 1
		end
	end

end

bheap = BinHeap.new
#9,5,6,2,3
bheap.build_heap([9,5,10,6,14,2,3])
bheap.insert(7)
binding.pry

puts bheap.delete_min
puts bheap.delete_min
puts bheap.delete_min
puts bheap.delete_min
puts bheap.delete_min

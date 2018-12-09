require 'pry-byebug'

class Vertex

	attr_accessor :connected_to
	attr_reader :id

	def initialize(key)
		@id = key
		@connected_to = {}
	end

	def add_neighbor(neighbor, weight=0)
		@connected_to[neighbor] = weight
	end

	def get_connections
		@connected_to.keys()
	end

	def get_id
		@id
	end

	def get_weight(neighbor)
		@connected_to[neighbor]
	end

end

class Graph
	attr_accessor :vert_list, :num_vertices

	def initialize
		@vert_list = {}
		@num_vertices = 0
	end

	def add_vertex(key)
		@num_vertices = @num_vertices + 1
		new_vertex = Vertex.new(key)
		vert_list[key] = new_vertex	
		new_vertex
	end

	def get_vertex(n)
		if @vert_list.include?(n)
			@vert_list[n]
		else
			nil
		end
	end

	def contains(n)
		@vert_list.include?(n)
	end

	def add_edge(f, t, cost=0)
		if !@vert_list.include?(f)
			nv = add_vertex(f)
		end

		if !@vert_list.include?(t)
			nv = add_vertex(t)
		end

		@vert_list[f].add_neighbor(@vert_list[t], cost)
	end

	def get_vertices
		@vert_list.keys
	end
end

# g = Graph.new
# for i in (0..6)
# 	g.add_vertex(i)
# end

# g.vert_list
# g.add_edge(0,1,5)
# binding.pry
# g

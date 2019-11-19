# Estructura del nodo (valor_nodo, nodo_anterior, nodo_sucesor)
Node = Struct.new(:value, :next, :prev) do
	#def ==(o)
	#	if value == o.value and next_ == o.next and prev == o.next do
	#		return true
	#	end
	#end
end

class List
	attr_reader :head, :tail, :tam

	def initialize (node)
		@head = node 
		@tail = node
		@tam = 1
	end

	def insert_head (node)
		if tam == 0
			@head = @tail = node
		else
			puts "nodo ~> v:#{@head.value}, prev:#{@head.prev}, next:#{@head.next}\n"
			puts "nodo ~> v:#{node.value}, prev:#{node.prev}, next:#{node.next}\n"
			@head.next = node
			node.prev = @head
			@head = node
		end

		@tam += 1
	end
end

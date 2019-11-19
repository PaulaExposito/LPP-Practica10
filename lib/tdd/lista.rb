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
			@head.next = node
			node.prev = @head
			@head = node
		end

		@tam += 1
	end

	def insert_tail (node)
		if tam == 0
			@head = @tail = node
		else
			@tail.prev = node
			node.next = @tail
			@tail = node
		end
		@tam += 1
	end

	def extract_head
		if tam > 0
			aux = @head
			@head = @head.prev
			@head.next = nil
			aux.prev = nil
		end
		puts "[DEBUG EXTRACT HEAD]: tam = #{@tam} \n"
		@tam = @tam - 1
		puts "[DEBUG EXTRACT HEAD]: tam = #{@tam} \n"
		return aux
	end
end

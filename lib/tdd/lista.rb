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
	include Enumerable

	def initialize (dato)
		node = Node.new(dato, nil, nil)
		@head = node 
		@tail = node
		@tam = 1
	end

	def insert_head (dato)
		node = Node.new(dato, nil, nil)
		if tam == 0
			@head = @tail = node
		else
			@head.next = node
			node.prev = @head
			@head = node
		end

		@tam += 1
	end

	def insert_tail (dato)
		node = Node.new(dato, nil, nil)
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
		
		@tam = @tam - 1
		return aux
	end

	def extract_tail
		if tam > 0
			aux = @tail
			@tail = @tail.next
			@tail.prev = nil
			aux.next = nil
		end

		@tam -= 1
		return aux
	end

	def to_s
		aux = @tail
		c = "("
		while aux.next != nil do
			c = c + aux.value.to_s + ", "
			aux = aux.next
		end
		c = c + aux.value.to_s + ")"
	end

	#def each
	#	aux = @tail
	#	while aux.next != nil do
	#		yield aux.value
	#		aux = aux.next
	#	end
	#end
end

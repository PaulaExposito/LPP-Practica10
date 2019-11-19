# Estructura del nodo (valor_nodo, nodo_anterior, nodo_sucesor)
Node = Struct.new(:value, :next, :prev)

class List
	attr_reader :head, :tail, :tam

	def initialize (node)
		@head = node 
		@tail = node
		@tam = 1
	end
end

# = lista.rb
#
# == Estructura Node
# Estructura del nodo (valor_nodo, nodo_anterior, nodo_sucesor)
Node = Struct.new(:value, :next, :prev) do
end

# == Clase Lista
#
# La clase lista contiene nodos anidados, en cada nodo hay un dato y dos referencias a otros nodos
#
# Elementos de la clase List
# - head -> es la referencia al siguiente elemento
# - tail -> referencia al elemento anterior
# - tam -> número de nodos que hay en una lista
#
class List

	# Métodos para el acceso y modificación de los elementos de una lista
	attr_accessor :head, :tail, :tam
	include Enumerable

	#Invalidación del método initialize para instanciar un objeto de tipo List
	#Recibe un dato que se meterá en un Node y posteriormente se inyecta en la lista
	def initialize (dato)
		if (dato.instance_of?(NilClass)) 
			@head, @tail, @tam = nil, nil, 0
		else
			node = Node.new(dato, nil, nil)
			@head = node 
			@tail = node
			@tam = 1
		end
	end

	# Método que inserta un nodo por la cabeza de la lista
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

	# Método que inserta un nodo por la cola de la lista
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

	# Método que elimina un elemento por la cabeza de la lista
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

	# Método que extrae un elemento por la cola de lista
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

	# Método que invalida el método to_s para mostrar los datos de una lista
	def to_s
		aux = @tail
		c = "("
		while aux.next != nil do
			c = c + aux.value.to_s + ", "
			aux = aux.next
		end
		c = c + aux.value.to_s + ")"
	end

	# Método que define cómo se enumera una lista
	# Hace uso del módulo Enumerable
	def each
		aux = @tail
		while aux.next != nil do
			yield aux.value
			aux = aux.next
		end
		yield aux.value
	end
end

# = menu.rb
#
# Esta clase reoresenta un modelo de datos para un menú de varios platos
#
class Menu

	# Métodos para leer y modificar los datos de las variables de instancia
	attr_accessor :name

	# Método para inicializar las variables de instancia de la clase
	def initialize (name, &block)
		if block_given?
			@name = name
			@descripcion = ""
			@componentes = []
			@precio

			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end
	end

	# Métpdp para guardar la descripción de un menú
	def descripcion (desc)
		@descripcion = desc
	end

	# Método que almacena los platos del menú
	def componente (plato = {})
		@componentes << [ "#{plato[:descripcion]}", plato[:precio], plato[:plato] ] 	
	end

	# Método que almacena el precio total del menú
	def precio (p)
		@precio = p
	end
end


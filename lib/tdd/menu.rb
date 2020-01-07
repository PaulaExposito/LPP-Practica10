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

	# Método para formatear la salida por pantalla del contenido del menú" 
	def to_s
		output = name.upcase
		@componentes.each_with_index do |plato, indice|
			output << "\n#{indice+1})#{plato[0]}    #{plato[1]}€"
		end
		output << "\n\nPrecio total: #{@precio}"
		output << "\n\nINFORMACIÓN NUTRICIONAL:\n"
		a = valores_n_a
		output << "   Proteínas: #{a[0][0]} gramos\n"
		output << "   Carbohidratos: #{a[0][1]} gramos\n"
		output << "   Lípidos: #{a[0][2]} gramos\n"
		output << "\nINFORMACIÓN AMBIENTAL:\n"
		output << "   Gases de efecto invernadero: #{a[1][0]}\n"
		output << "   Uso de terreno: #{a[1][1]} m2\n"

		return output
	end

	# Método que devuelve la información nutricional y ambiental total del menu
	def valores_n_a
		nutricional = [0,0,0]
		ambiental = [0,0]

		p @componentes[0][2].to_s

		@componentes.each do |plato|
			nutricional[0] += plato[2].valores_n_a[0][0]
			nutricional[1] += plato[2].valores_n_a[0][1]
			nutricional[2] += plato[2].valores_n_a[0][2]
			ambiental[0] += plato[2].valores_n_a[1][0]
			ambiental[1] += plato[2].valores_n_a[1][1]
		end

		n = nutricional.collect { |i| i = i.round(2) }
		a = ambiental.collect { |i| i = i.round(2) }
		return [ n, a ]
	end
end


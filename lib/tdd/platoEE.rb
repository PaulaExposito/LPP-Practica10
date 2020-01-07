# = platoEE.rb
#
# La clase PlatoEE hereda de la clase madre Plato
# Esta clase incluye la información sobre la eficiencia energética de un plato, es decir, los gases de efecto invernadero y el uso del terreno.
#
class PlatoEE < Plato
	# Métodos que acceden a las variables de instancia de la clase y las modifica
	attr_accessor :plato_gei, :plato_terreno, :nombre

	include Comparable

	# Invalidación del método <=> del módulo Comparable para poder comparar dos PlatoEE
	def <=> (anOther)
		raise TypeError, "asrgumento no es de tipo platoEE" unless anOther.is_a?PlatoEE
		self.huella_nutricional <=> anOther.huella_nutricional
	end

	# Método que calcula la huella nutricional de un plato
	# Devuelve la media entre el índice de la huella de carbono y el índice de energía
	def huella_nutricional
		media = ((indice_energia + indice_huella_carbono)/2).round(2)
	end

	# Método que calcula la huella de carbono de un plato
	# Devuelve un valor entre 1 y 3
	def indice_huella_carbono
		huella_carbono = @plato_gei * 1000
		indice_hc = 1 if huella_carbono < 800
		indice_hc = 3 if huella_carbono > 1200
		indice_hc = 2 if indice_hc == nil
		return indice_hc
	end

	# Método que invalida el método initialize para poder instanciar objetos de tipo PlatoEE
	# Recibe una lista de alimentos y llama al contructor de su clase madre
	# Rellena las variables de instancia con el conjunto de alimentos de la lista
	# Las variables de instancia son los gases de efecto inverdero de un plato y el uso del terreno 
	# Recibe una lista de alimentos
	def initialize (alimentos)
		# Initialize para una lista
#		raise TypeError, "no es una lista de alimentos" unless alimentos.is_a?List
=begin		super(alimentos)
		
		@plato_gei = @plato_terreno = 0
		aux = alimentos.tail
		while aux.next != nil do
			raise TypeError, "no es un alimento" unless aux.value.is_a?Alimento
			@plato_gei += aux.value.gei
		        @plato_terreno += aux.value.terreno
			aux = aux.next
		end

		@plato_gei += aux.value.gei
		@plato_terreno += aux.value.terreno
		@plato_gei = @plato_gei.round(2)
=end		@plato_terreno = @plato_terreno.round(2)

		@nombre = alimentos
		@descripcion = ""
		@alimentos = []

		yield self

	end

	def descripcion (nombre)
		p "holi"
		@nombre = nombre
	end

	def alimento (comida = {}, cantidad ={})
		@alimentos << [ comida[:nombre], cantidad[:gramos] ]
	end


	# Método que invalida el método to_s para formatear la salida de los datos de un objeto PlatoEE
	def to_s 
=begin		s = "{"
		s << super.to_s
		s << "(#{@plato_gei} kgCO2eq, #{@plato_terreno} m2año)}"
=end		return s

		output = nombre.upcase
		output << "\n\n"
		@alimentos.each do |i|
			output << "#{i[1]} gramos de #{i[0]} \n"
		end
		return output
	end	
end

# = platoEE.rb
#
# La clase PlatoEE hereda de la clase madre Plato
# Esta clase incluye la información sobre la eficiencia energética de un plato, es decir, los gases de efecto invernadero y el uso del terreno.
#
# Funcionalidades:
# - Calcular el índice de la huella de carbono de un plato
# - Calcular la huella ambiental de un plato
#
# Esta clase utiliza el módulo Comparable e invalida el método <=> de la clase madre.
class PlatoEE < Plato
	attr_accessor :plato_gei, :plato_terreno

	include Comparable

	def <=> (anOther)
		raise TypeError, "asrgumento no es de tipo platoEE" unless anOther.is_a?PlatoEE
		self.huella_nutricional <=> anOther.huella_nutricional
	end

	def huella_nutricional
		media = ((indice_energia + indice_huella_carbono)/2).round(2)
	end

	def indice_huella_carbono
		huella_carbono = @plato_gei * 1000
		indice_hc = 1 if huella_carbono < 800
		indice_hc = 3 if huella_carbono > 1200
		indice_hc = 2 if indice_hc == nil
		return indice_hc
	end

	def initialize (alimentos)
		raise TypeError, "no es una lista de alimentos" unless alimentos.is_a?List
		super(alimentos)
		
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
		@plato_terreno = @plato_terreno.round(2)
	end

	def to_s 
		s = "{"
		s << super.to_s
		s << "(#{@plato_gei} kgCO2eq, #{@plato_terreno} m2año)}"
		return s
	end	
end

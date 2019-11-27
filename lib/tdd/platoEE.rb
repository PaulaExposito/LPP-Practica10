class PlatoEE < Plato
	attr_accessor :plato_gei, :plato_terreno
	#include Comparable

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

	#def <=> (anOther)
	#	return nil unless anOther.instance_of?PlatoEE
	#	#(@plato_gei) <=> (anOther.plato_gei)
	#	super <=> anOther
	#end
end

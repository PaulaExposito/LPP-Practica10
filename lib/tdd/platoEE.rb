class PlatoEE < Plato
	attr_accessor :plato_gei, :plato_terreno

	def initialize (alimentos)
		super(alimentos)
		
		@plato_gei = @plato_terreno = 0
		aux = alimentos.tail
		while aux.next != nil do
			@plato_gei += aux.value.gei
		        @plato_terreno += aux.value.terreno
			aux = aux.next
		end

		@plato_gei += aux.value.gei
		@plato_terreno += aux.value.terreno
		@plato_gei = @plato_gei.round(2)
		@plato_terreno = @plato_terreno.round(2)
	end	

end

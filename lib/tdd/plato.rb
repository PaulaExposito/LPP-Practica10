require './lib/tdd/lista.rb'
class Plato
	attr_accessor :nombre, :cjto_alimentos, :cjto_gramos

	def initialize (alimentos)
		return nil unless alimentos.instance_of?List
		aux = alimentos.tail
		@nombre = ""
		@cjto_alimentos = List.new(nil)
		@cjto_gramos = List.new(nil)

		while aux.next != nil do
			@nombre += aux.value.nombre + " "
			@cjto_alimentos.insert_head(aux.value)
			cont = 0
			cont = aux.value.proteinas + aux.value.carbohidratos + aux.value.lipidos
			@cjto_alimentos.insert_head(cont)
			aux = aux.next
		end

		@nombre = @nombre + aux.value.nombre
		@cjto_alimentos.insert_head(aux.value)
		cont = 0
		cont = aux.value.proteinas + aux.value.carbohidratos + aux.value.lipidos
		@cjto_alimentos.insert_head(cont)
	end
end

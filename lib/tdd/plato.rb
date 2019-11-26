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
			@cjto_gramos.insert_head(cont)
			aux = aux.next
		end

		@nombre = @nombre + aux.value.nombre
		@cjto_alimentos.insert_head(aux.value)
		cont = 0
		cont = aux.value.proteinas + aux.value.carbohidratos + aux.value.lipidos
		@cjto_gramos.insert_head(cont)


	end

	def x100_proteinas
		cont_proteinas = 0
		cont_gramos = 0
		aux = @cjto_alimentos.tail
		aux2 = @cjto_gramos.tail

		while aux.next != nil do
			cont_proteinas += aux.value.proteinas
			cont_gramos += aux2.value
			aux = aux.next
			aux2 = aux2.next
		end
		
		cont_proteinas += aux.value.proteinas
		cont_gramos += aux2.value
		
		return ((cont_proteinas / cont_gramos).round(2) * 100).round(2)
	end
end

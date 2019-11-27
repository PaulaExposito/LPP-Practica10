require './lib/tdd/lista.rb'
class Plato
	attr_accessor :nombre, :cjto_alimentos, :cjto_gramos, :total_gramos
	include Comparable

	def <=> (anOther)
		@total_gramos <=> @anOther.total_gramos
	end

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
		@total_gramos = cont.round(2)
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
	
	def x100_lipidos
		cont_lipidos = 0
		cont_gramos = 0
		aux = @cjto_alimentos.tail
		aux2 = @cjto_gramos.tail

		while aux.next != nil do
			cont_lipidos += aux.value.lipidos
			cont_gramos += aux2.value
			aux = aux.next
			aux2 = aux2.next
		end
		
		cont_lipidos += aux.value.lipidos
		cont_gramos += aux2.value
		
		return ((cont_lipidos / cont_gramos).round(2) * 100).round(2)
	end
	
	def x100_carbohidratos
		cont_carbohidratos = 0
		cont_gramos = 0
		aux = @cjto_alimentos.tail
		aux2 = @cjto_gramos.tail

		while aux.next != nil do
			cont_carbohidratos += aux.value.carbohidratos
			cont_gramos += aux2.value
			aux = aux.next
			aux2 = aux2.next
		end
		
		cont_carbohidratos += aux.value.carbohidratos
		cont_gramos += aux2.value
		
		return ((cont_carbohidratos / cont_gramos).round(2) * 100).round(2)
	end

	def vct
		aux = @cjto_alimentos.tail
		kcal = 0

		while aux.next != nil do
			kcal += (aux.value.proteinas * 4 + aux.value.carbohidratos * 4 + aux.value.lipidos * 9)
			aux = aux.next
		end	
		kcal += (aux.value.proteinas * 4 + aux.value.carbohidratos * 4 + aux.value.lipidos * 9)

		return kcal
	end

	def to_s
		return "(#{@nombre}: #{vct} kcal)"
	end
end

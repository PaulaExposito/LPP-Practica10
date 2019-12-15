require './lib/tdd/lista.rb'

# = plato.rb
# 
# La clase plato contiene la información sobre el:
# - nombre de un plato
# - el conjunto de alimentos que forman parte del plato
# - el total de gramos del plato
#
# Las funcionalidades de la clase son:
# - Calcular el procentaje de proteínas del plato
# - Calcular el procentaje de carbohidratos del plato
# - Calcular el procentaje de lípidos del plato
# - Calcular el valor energético del plato
# - Calcular el índice de energía del plato
#
# Esta clase utiliza el módulo Comparable
#
class Plato
	attr_accessor :nombre, :cjto_alimentos, :cjto_gramos, :total_gramos
	include Comparable

	def <=> (anOther)
		raise TypeError, "argumento no es tipo plato" unless anOther.is_a?Plato
		@total_gramos <=> anOther.total_gramos
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

		return kcal.round(2)
	end

	def indice_energia
		energia = self.vct
		ind_energia = 1 if energia < 670
		ind_energia = 3 if energia > 830
		ind_energia = 2 if ind_energia == nil
		return ind_energia
	end

	def to_s
		return "(#{@nombre}: #{vct} kcal)"
	end
end

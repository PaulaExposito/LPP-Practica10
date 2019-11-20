# Clase persona, almacena el nombre de una persona y su sexo
# Se utiliza para calcular el impacto ambiental diario de la dieta de una persona de entre 10-39 años
#

class Persona
	attr_accessor :nombre, :sexo

	def initialize (nombre, sexo)
		@nombre = nombre
		@sexo = sexo
	end


	def impacto_ambiental_diario (dieta)
		if dieta.is_a?Array 
			alimento_conjunto = dieta[0]
			for l in 1...dieta.length
				alimento_conjunto = alimento_conjunto + dieta[l]
			end

		elsif dieta.is_a?List
			aux = dieta.tail			
			alimento_conjunto = aux.value
			aux = aux.next
			while aux.next != nil do 
				alimento_conjunto = alimento_conjunto + aux.value
				aux = aux.next
			end
			alimento_conjunto = alimento_conjunto + aux.value
		end

		return [alimento_conjunto.gei, alimento_conjunto.terreno]
	end

	def impacto_ambiental_anual (dieta)
		a = impacto_ambiental_diario(dieta)
		return [ (a[0]*365).round(2), (a[1]*365).round(2) ]
	end
end

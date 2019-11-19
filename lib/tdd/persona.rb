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
		alimento_conjunto = dieta[0]
		for l in 1...dieta.length
			alimento_conjunto = alimento_conjunto + dieta[l]
		end

		return [alimento_conjunto.gei, alimento_conjunto.terreno]
	end
end

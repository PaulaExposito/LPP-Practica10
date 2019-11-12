# Clase persona, almacena el nombre de una persona y su sexo
# Se utiliza para calcular el impacto ambiental diario de la dieta de una persona de entre 10-39 años
#

class Persona
	attr_reader :nombre, :sexo

	def initialize (nombre, sexo)
		@nombre = nombre
		@sexo = sexo
	end


	def impacto_ambiental_diario (dieta)
		impacto = 0.0
		proteinas = 0.0
		dieta.each do |i|
			impacto += i.valor_energetico
		end

		impacto.round(2)
		proteinas.round(2)

		if sexo == "hombre"
			if impacto <= 3000 && proteinas <= 54
				return impacto
			else
				return false
			end
		else
			if impacto <= 2300 && proteinas <= 41
				return impacto
			else
				return false
			end
		end

	end
end

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
		impacto_terreno = 0.0
		impacto_gei = 0.0
		impacto = 0.0
		proteinas = 0.0

		dieta.each do |i|
			impacto_gei += i.gei
			impacto_terreno += i.terreno
			impacto +=0.0
			proteinas += 0.0
		end

		impacto_gei.round(2)
		impacto_terreno.round(2)
		impacto.round(2)
		proteinas.round(2)
		impactos_ambientales = [impacto_gei, impacto_terreno]

		if sexo == "hombre"
			if impacto <= 3000 && proteinas < 55
				return impactos_ambientales
			else
				return false
			end
		else
			if impacto <= 2300 && proteinas < 42
				return impactos_ambientales
			else
				return false
			end
		end
	end
end

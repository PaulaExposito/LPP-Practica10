# Clase persona, almacena el nombre de una persona y su sexo
# Se utiliza para calcular el impacto ambiental diario de la dieta de una persona de entre 10-39 años
#

class Persona
	attr_reader :nombre, :sexo

	def initialize (nombre, sexo)
		@nombre = nombre
		@sexo = sexo
	end
end

# Clase Alimento
#

class Alimento
	attr_reader :nombre, :proteinas

	def initialize (nombre, proteinas)
		@nombre = nombre
		@proteinas = proteinas
	end

	def to_s
		"{hola mundo}"
	end
end 

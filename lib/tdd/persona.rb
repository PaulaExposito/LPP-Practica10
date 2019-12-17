# Clase persona, almacena el nombre de una persona y su sexo
# Se utiliza para calcular el impacto ambiental diario de la dieta de una persona de entre 10-39 años
#
# Esta clase tiene dos variables de instancia: el nombre de una persona y su sexo
#
class Persona
	# Métdos para el acceso a las variables de instancia
	attr_accessor :nombre, :sexo

	# Invalizadación del método initialize para instanciar un objeto de tipo Persona
	# Recibe el nombre y el sexo de la persona
	def initialize (nombre, sexo)
		@nombre = nombre
		@sexo = sexo
	end


	# Método que devuelve el impacto ambiental diario de una persona en función de la dieta que sigue
	# La dieta se puede representar con un Array o una lista List
	# Se devuelve un Array con el total de gases de efecto invernadero y metros de terreno utilizados
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

	# Método que devuelve el impacto ambiental anual de una persona si lleva la misma dieta durante todos los días del año
	# Calcula el impacto ambiental diario y lo multiplica por el número de días de un año
	def impacto_ambiental_anual (dieta)
		a = impacto_ambiental_diario(dieta)
		return [ (a[0]*365).round(2), (a[1]*365).round(2) ]
	end
end

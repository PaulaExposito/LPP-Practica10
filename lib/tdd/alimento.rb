
# Tipos de alimentos que se pueden introducir al programa


# Los alimentos se guardan en un array de la forma
# nombre_alimento = [ "proteinas" "carbohidratos" "lipidos" "GEI" "Terreno" ]

Carne_vaca = [21.1, 0.0, 3.1, 50.0, 164.0]
Carne_cordero = [18.0, 0.0, 17.0, 20.0, 185.0]
Camarones = [17.6, 1.5, 0.6, 18.0, 2.0]
Chocolate = [5.3, 47.0, 30.0, 2.3, 3.4]
Salmon = [19.9, 0.0, 13.6, 6.0, 3.7]


# Clase Alimento

class Alimento
	attr_reader :nombre#, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :cantidad

	def initialize (alimento, nombre, cantidad)
		@nombre = nombre
		@proteinas = alimento[0]
		@carbohidratos = alimento[1]
		@lipidos = alimento[2]
		@gei = alimento[3]
		@terreno = alimento[4]
		@cantidad = cantidad
	end

	def to_s
		"{hola mundo}"
	end
end 

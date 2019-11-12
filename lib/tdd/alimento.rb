
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
	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :cantidad

	def initialize (alimento, nombre, cantidad)
		@nombre = nombre
		@proteinas = (alimento[0] * cantidad).round(2)
		@carbohidratos = (alimento[1] * cantidad).round(2)
		@lipidos = (alimento[2] * cantidad).round(2)
		@gei = (alimento[3] * cantidad).round(2)
		@terreno = (alimento[4] * cantidad).round(2)
		@cantidad = cantidad
	end

	def +(other)
		return nil unless other.instance_of? Alimento
		nuevo_alimento = [(proteinas+other.proteinas).round(2), (carbohidratos+other.carbohidratos).round(2), (lipidos+other.lipidos).round(2), (gei+other.gei).round(2), (terreno+other.terreno).round(2)]
		nuevo_nombre = nombre + other.nombre
		nueva_cantidad = 1
		Alimento.new(nuevo_alimento, nuevo_nombre, nueva_cantidad)
	end

#	def to_s
#		"{hola mundo}"
#	end
end 

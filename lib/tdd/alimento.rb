
# = alimento.rb
#
# autor:: Paula Expósito Estévez
# asignatura:: Lenguajes y Paradigmas de Programación
#
# == Clase Alimento
# Esta clase define los alimentos con los que trabajará el programa, contiene:
# - El nombre del alimento
# - La cantidad de proteínas por cada 100 gramos
# - La cantidad de carbohidratos por cada 100 gramos
# - La cantidad de lipidos por cada 100 gramos
# - La cantidad de gases de efecto invernadero emitidos  por porción
# - La cantidad de terreno utilizado por metro cuadrado
#
# Los funcionalidades principales de la clase son:
# - Sumar alimentos
# - Calcular el valor energético de un alimento
# 
# Se hace uso del módulo Comparable 
#
class Alimento
	include Comparable
	attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :cantidad

	def <=> (anOther)
		return nil unless anOther.instance_of?Alimento
		valor_energetico <=> anOther.valor_energetico
	end

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

	# Invalidando el método to_s de la clase Object
	def to_s
		"#{@cantidad} kg de #{@nombre}: #{@proteinas}, #{@carbohidratos}, #{@lipidos}, #{@gei}, #{@terreno}"
	end

	def valor_energetico
		(proteinas*4.0 + carbohidratos*4.0 + lipidos*9.0).round(2)
	end
end 

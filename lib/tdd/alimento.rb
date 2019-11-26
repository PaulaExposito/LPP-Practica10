
# Tipos de alimentos que se pueden introducir al programa


# Clase Alimento

class Alimento
	include Comparable
	attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :gei, :terreno, :cantidad

	def <=> (anOther)
		return nil unless anOther.instance_of?Alimento
#		temp1 = @proteinas + @carbohidratos + @lipidos + @gei + @terreno
#		temp2 = anOther.proteinas + anOther.carbohidratos + anOther.lipidos + anOther.gei + anOther.terreno
#		temp1 <=> temp2
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

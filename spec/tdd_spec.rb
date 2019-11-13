require 'spec_helper'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'


RSpec.describe TDD do
	context "# Creando clase Alimento" do
		before :each do
			@a1 = Alimento.new(Carne_vaca, "carne de vaca", 1)
			@a2 = Alimento.new(Carne_cordero, "carne de cordero", 1)
			@a3 = Alimento.new(Camarones, "camarones", 1)
			@a4 = Alimento.new(Chocolate, "chocolate", 1)
			@a5 = Alimento.new(Salmon, "salmon", 1)
		end
		it "Se crea un alimento correctamente" do
			c1 = Alimento.new(Camarones, "camarones", 1)
			expect(c1.nombre).to eq("camarones")
		end

		it "Existe un nombre para el alimento" do
			expect(false).to eq(@a1.nombre.nil?)
			expect(false).to eq(@a2.nombre.nil?)
			expect(false).to eq(@a3.nombre.nil?)
		end

		it "Existen los nutrientes de un alimento y tienen valores correctos" do
			expect(false).to eq(@a1.proteinas.nil? && @a1.carbohidratos.nil? && @a1.lipidos.nil?)
			expect(21.1).to eq(@a1.proteinas)
			expect(0.0).to eq(@a1.carbohidratos)
			expect(3.1).to eq(@a1.lipidos)
		end


		it "Existen los gases de efecto invernadero y el terreno m2 año y tienen valores correctos" do
			@a1 = Alimento.new(Carne_vaca, "carne de vaca", 0.5)
			expect(false).to eq(@a1.gei.nil? && @a1.terreno.nil?)
			expect(25).to eq(@a1.gei)
			expect(82).to eq(@a1.terreno)
		end

		it "Existe un método para obtener el terreno utilizado" do
			expect(185).to eq(@a2.terreno)
			expect(3.4).to eq(@a4.terreno)
			expect(3.7).to eq(@a5.terreno)
		end


		it "Existe un método para obtener los gases de efecto invernadero" do
			expect(20).to eq(@a2.gei)
			expect(2.3).to eq(@a4.gei)
			expect(6).to eq(@a5.gei)
		end

		it "Se pueden sumar dos o más alimentos" do
			a_suma = @a4 + @a5
			expect(25.2).to eq(a_suma.proteinas)
			expect(47).to eq(a_suma.carbohidratos)
			expect(43.6).to eq(a_suma.lipidos)
			expect(8.3).to eq(a_suma.gei)
			expect(7.1).to eq(a_suma.terreno)


			b_suma = @a3 + @a4 + @a5
			expect(42.8).to eq(b_suma.proteinas)
			expect(48.5).to eq(b_suma.carbohidratos)
			expect(44.2).to eq(b_suma.lipidos)
			expect(26.3).to eq(b_suma.gei)
			expect(9.1).to eq(b_suma.terreno)
		end

		it "Se puede obtener el alimento formateado (método to_s)" do
			expect("1 kg de camarones: 17.6, 1.5, 0.6, 18.0, 2.0").to eq(@a3.to_s)
			@a5 = Alimento.new(Salmon, "salmon", 0.5)
			expect("0.5 kg de salmon: 9.95, 0.0, 6.8, 3.0, 1.85").to eq(@a5.to_s)
		end

		it "Calcular el aporte energético del alimento" do
			expect(112.3).to eq(@a1.valor_energetico)
			expect(225).to eq(@a2.valor_energetico)
			expect(81.8).to eq(@a3.valor_energetico)
			expect(479.2).to eq(@a4.valor_energetico)
			expect(202).to eq(@a5.valor_energetico)
		end	
	end

	context "# Creando la clase Persona" do
		before :each do
			@a1 = Alimento.new(Carne_cordero, "carne de cordero", 1)
			@a2 = Alimento.new(Chocolate, "chocolate", 1)
			@a3 = Alimento.new(Lentejas, "lentejas", 1)
			@a4 = Alimento.new(Leche, "leche", 1)
			@a5 = Alimento.new(Tofu, "tofu", 1)
			@dieta1 = [@a1, @a2, @a3, @a4, @a5]

			@a6 = Alimento.new(Camarones, "camarones", 1)
			@a7 = Alimento.new(Pollo, "pollo", 1)
			@a8 = Alimento.new(Huevos, "huevos", 1)
			@dieta2 = [@a6, @a7, @a8]

			@hombre = Persona.new("Antonio", "hombre")
			@mujer = Persona.new("María", "mujer")
		end	

		it "Se crea un objeto persona y sus getters funcionan correctamente" do
			maria = Persona.new("María", "mujer")
			expect("María").to eq(maria.nombre)
			expect("mujer").to eq(maria.sexo)

			antonio = Persona.new("Antonio", "hombre")
			expect("Antonio").to eq(antonio.nombre)
			expect("hombre").to eq(antonio.sexo)
		end

		it "Se calcula correctamente el impacto ambiental de un hombre" do
			expect(27.9).to eq(@hombre.impacto_ambiental_diario(@dieta1)[0])  # impacto de los GEI
			expect(202.9).to eq(@hombre.impacto_ambiental_diario(@dieta1)[1])  # impacto del terreno

			expect(27.9).to eq(@hombre.impacto_ambiental_diario(@dieta2)[0])
			expect(14.8).to eq(@hombre.impacto_ambiental_diario(@dieta2)[1])
		end

		it "Se calcula correctamente el impacto ambiental de una mujer" do
			expect(27.9).to eq(@mujer.impacto_ambiental_diario(@dieta2)[0])
			expect(14.8).to eq(@mujer.impacto_ambiental_diario(@dieta2)[1])

			expect(false).to eq(@mujer.impacto_ambiental_diario(@dieta1)[0])
			expect(false).to eq(@mujer.impacto_ambiental_diario(@dieta1)[1])
		end
	end
end

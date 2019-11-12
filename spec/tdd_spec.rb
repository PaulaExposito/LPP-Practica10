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
			expect("0.5 kg de salmon: 9.95, 0.0, 6.8, 3.0, 1.85").tp_eq(@a5.to_s)
		end	

	end
end

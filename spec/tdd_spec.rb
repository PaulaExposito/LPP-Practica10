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
	end
end

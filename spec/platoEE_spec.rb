require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/plato.rb'
require './lib/tdd/lista.rb'
require './lib/tdd/platoEE.rb'

RSpec.describe PlatoEE do
	before :each do
		@lista_alimentos = List.new(Alimento.new(TDD::Cafe, "cafe", 1))
		@lista_alimentos.insert_head(Alimento.new(TDD::Leche, "leche", 1))
		@plato1 = PlatoEE.new(@lista_alimentos)
	end

	context "Probando la clase Plaro Eficiencia Energética" do
		it "Se crea un objeto de tipo PlatoEE" do
			a = PlatoEE.new(@lista_alimentos)
		end

		it "Valor de las emisiones de gases de efecto invernadero" do
			expect(3.6).to eq(@plato1.plato_gei)
		end

		it "Estimación m2 de terreno utilizados" do
			expect(9.2).to eq(@plato1.plato_terreno)
		end

		it "Método to_s utilizando clase madre" do
			expect("{(cafe leche: 65.2 kcal)(3.6 kgCO2eq, 9.2 m2año)}").to eq(@plato1.to_s)
		end
	end

	context "Probando clase, tipo y pertenencia de PlatoEE" do
		it "Comprobar la clase de un objeto" do
			expect(PlatoEE).to eq(@plato1.class)
		end

		it "Comprobar tipo de la clase" do
			expect(true).to eq(@plato1.instance_of?PlatoEE)
			expect(false).to eq(@plato1.instance_of?Plato)
		end

		it "Comprobar pertenecia a una jerarquía" do
			expect(true).to eq(@plato1.is_a?PlatoEE)
			expect(true).to eq(@plato1.is_a?Plato)
			expect(true).to eq(@plato1.is_a?Object)
		end
	end
end

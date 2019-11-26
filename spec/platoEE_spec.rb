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

	end
end

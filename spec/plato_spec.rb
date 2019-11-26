require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/plato.rb'
require './lib/tdd/lista.rb'

RSpec.describe Plato do
	before :each do
		lista_alimentos = List.new(Alimento.new(TDD::Cafe, "cafe", 1))
		lista_alimentos.insert_head(Alimento.new(TDD::Leche, "leche", 1))
		@plato1 = Plato.new(lista_alimentos)
	end

	context "Plato con información nutricional" do
		it "Existe un plato con nombre" do
			expect("cafe leche").to eq(@plato1.nombre)
		end

		it "Existe un conjunto de alimentos" do
			expect(false).to eq(@plato1.cjto_alimentos.nil?)
		end		

		it "Existe un conjunto de gramos de alimentos" do
			expect(false).to eq(@plato1.cjto_gramos.nil?)
		end			
	end
end

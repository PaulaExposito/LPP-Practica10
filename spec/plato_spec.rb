require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/plato.rb'
require './lib/tdd/lista.rb'

RSpec.describe Plato do
	before :each do
	end

	context "Plato con información nutricional" do
		it "Existe un plato con nombre" do
			plato1 = List.new(Alimento.new(TDD::Cafe), "cafe", 1)
			plato1.insert(Alimento.new(TDD::Leche), "leche", 1)
			expect("cafe leche").to eq(plato1.nombre)
		end
	end
end

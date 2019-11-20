require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'
require './lib/tdd/lista.rb'

RSpec.describe List do

	context "# Dieta española" do
		before :each do
			@maria = Persona.new("María", "mujer")

			@pollo = Node.new(Alimento.new([6,0,3,5.7,7.1], "pollo", 1), nil, nil)
			@lenteja = Node.new(Alimento.new([8,25,1,0.4,3.4], "lentejas", 1), nil, nil)
			@nuez = Node.new(Alimento.new([6,15,36,0.3,7.9], "nueces", 1), nil, nil)

			@espanola = List.new(@pollo)
			@espanola.insert_head(@lenteja)
			@espanola.insert_head(@nuez)
		end

		it "Emisiones de GEI diarias" do
			expect(6.4).to eq(@maria.impacto_ambiental_diario(@espanola)[0])
		end

		it "Emisiones de GEI anuales" do
			expect(2336).to eq(@maria.impacto_ambiental_anual(@espanola)[0])
		end
	end

end

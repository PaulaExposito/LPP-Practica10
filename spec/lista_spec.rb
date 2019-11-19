require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'
require './lib/tdd/lista.rb'

RSpec.describe List do

	before :all do
		#declarar cosillas
	end

	context "# ESTRUCTURA DE NODO " do
		it "Existe un nodo" do
			n = Node.new(7, nil, nil)
			expect(true).to eq(n.is_a?Node)
		end

		it "Se puede acceder a los miembros de Node" do
			n = Node.new(7, nil, nil)
			expect(7).to eq(n.value)
			expect(nil).to eq(n.prev)
			expect(nil).to eq(n.next)
		end

		it "Se pueden encadenar dos nodos" do
			n = Node.new(7, nil, nil)
			m = Node.new(8, n, nil)
			n.next = m
			expect(m).to eq(n.next)
		end

	end
end

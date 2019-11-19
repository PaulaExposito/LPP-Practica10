require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'
require './lib/tdd/lista.rb'

RSpec.describe List do

	before :all do
		#Nodos
		@n = Node.new(7, nil, nil)
		@m = Node.new(8, nil, nil)

		#Lista
		#@l = List.new(@n)
	end

	context "# ESTRUCTURA DE NODO " do
		it "Existe un nodo" do
			n = Node.new(7, nil, nil)
			expect(true).to eq(n.is_a?Node)
		end

		it "Se puede acceder a los miembros de Node" do
			expect(7).to eq(@n.value)
			expect(nil).to eq(@n.prev)
			expect(nil).to eq(@n.next)
		end

		it "Se pueden encadenar dos nodos" do
			@n.next = @m
			@m.prev = @n
			expect(@m).to eq(@n.next)
			expect(nil).to eq(@n.prev)
			expect(@n).to eq(@m.prev)
			expect(nil).to eq(@m.next)
		end
	end

	context "# CLASE LISTA " do
		it "Se crea una lista con cabeza y cola" do
			l = List.new(@n)
			expect(true).to eq(l.is_a?List)
			expect(@n).to eq(l.head)
			expect(@m).to eq(l.tail)
		end
	end
end

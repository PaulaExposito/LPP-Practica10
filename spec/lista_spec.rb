require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'
require './lib/tdd/lista.rb'

RSpec.describe List do

	before :each do
		#Nodos
		@n = Node.new(7, nil, nil)
		@n_l = Node.new(7, nil, nil)
		@m = @m_l = Node.new(8, nil, nil)
		@o = @o_l = Node.new(3, nil, nil)

		#Lista
		@l = List.new(@n_l)
		@v = List.new(@n_l)
		@v.insert_head(@m_l)
		@v.insert_head(@o_l)
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
			puts "[DEBUG EN SPEC]"
			puts "nodo ~> v:#{@n.value}, prev:#{@n.prev}, next:#{@n.next}\n"
		       	puts "nodo ~> v:#{@m.value}, prev:#{@m.prev}, next:#{@m.next}\n"   
			
			puts "[DEBUG EN SPEC]"
			@n.next = @m
			@m.prev = @n
			@m.next = nil
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
			expect(@n).to eq(l.tail)
		end

		it "Insertamos elementos en la lista por la cabeza" do
			@l.insert_head(@m_l)
			expect(2).to eq(@l.tam)

			@l.insert_head(@o_l)
			expect(3).to eq(@l.tam)
		end

		it "Insertar elementos por la cola de la lista" do
			@l.insert_tail(@m_l)
			expect(2).to eq(@l.tam)

			@l.insert_tail(@o_l)
			expect(3).to eq(@l.tam)
		end

		it "Extrayendo la cabeza de la lista" do
			nodo = @v.extract_head
			expect(2).to eq(@v.tam)
			expect(nil).to eq(nodo.prev)
			expect(nil).to eq(nodo.next)
			expect(3).to eq(nodo.value)
		end

	end
end


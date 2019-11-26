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
		@l = List.new(7)
		@v = List.new(7)
		@v.insert_head(8)
		@v.insert_head(3)
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
			@m.next = nil
			expect(@m).to eq(@n.next)
			expect(nil).to eq(@n.prev)
			expect(@n).to eq(@m.prev)
			expect(nil).to eq(@m.next)
		end
	end

	context "# CLASE LISTA " do
		it "Se crea una lista con cabeza y cola" do
			l = List.new(7)
			expect(true).to eq(l.is_a?List)
			expect(@n).to eq(l.head)
			expect(@n).to eq(l.tail)
		end

		it "Insertamos elementos en la lista por la cabeza" do
			@l.insert_head(8)
			expect(2).to eq(@l.tam)

			@l.insert_head(3)
			expect(3).to eq(@l.tam)
		end

		it "Insertar elementos por la cola de la lista" do
			@l.insert_tail(8)
			expect(2).to eq(@l.tam)

			@l.insert_tail(3)
			expect(3).to eq(@l.tam)
		end

		it "Extrayendo la cabeza de la lista" do
			nodo = @v.extract_head
			expect(2).to eq(@v.tam)
			expect(nil).to eq(nodo.prev)
			expect(nil).to eq(nodo.next)
			expect(3).to eq(nodo.value)
		end

		it "Extrayendo la cola de la lista" do
			nodo = @v.extract_tail
			expect(2).to eq(@v.tam)
			expect(nil).to eq(nodo.prev)
			expect(nil).to eq(nodo.next)
			expect(7).to eq(nodo.value)
		end

		it "Mostrando la lista" do
			expect("(7, 8, 3)").to eq(@v.to_s)
		end

		it "Mixin Enumerable: COLLECT operativo" do
=begin			@v = @v.collect{ 
				|i| 
				puts "[---] #{i.is_a?Node} \n" 
				i.value + "x"
			}
			puts "[...] #{@v.is_a?List} \n"
			puts "[...] #{@v.is_a?Array} \n"
			expect("(7x, 8x, 3x)").to eq(@v.to_s)
=end
		end

		it "Mixin Enumerable: SELECT operativo" do
#			expect("(7, 8)").to eq(@v.select{ |i| i.between?(6,9)}.to_s)
		end

		it "Mixin Enumerable: SORT, MAX y MIN operativos" do
=begin			puts "DEBUG CÓMO ES V EN 3º IT: #{@v.to_s} \n"
			expect("(3, 7, 8)").to eq(@v.sort.to_s)
			expect("(3)").to eq(@v.min.to_s)
			expect("(8)").to eq(@v.max.to_s)
=end
		end

	end
end


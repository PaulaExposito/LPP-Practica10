require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/plato.rb'
require './lib/tdd/lista.rb'
require './lib/tdd/platoEE.rb'

RSpec.describe PlatoEE do
	before :each do
		@lista_alimentos = List.new(Alimento.new(TDD::Cafe, "cafe", 1))
		@lista_alimentos.insert_head(Alimento.new(TDD::Leche, "leche", 1))
#		@plato1 = PlatoEE.new(@lista_alimentos)
	end

	context "Probando la clase Plaro Eficiencia Energética" do
=begin		it "Se crea un objeto de tipo PlatoEE" do
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
=end		end
	end

	context "Probando clase, tipo y pertenencia de PlatoEE" do
=begin		it "Comprobar la clase de un objeto" do
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
=end		end
	end

	context "Probando PlatoEE con 5 dietas" do
=begin		before :each do
			@es_plato1 = List.new(Alimento.new(TDD::Leche, "leche", 1))
			@es_plato1.insert_head(Alimento.new(TDD::Cafe, "cafe", 1))
			@es_platoEE1 = PlatoEE.new(@es_plato1)
			@es_plato2 = List.new(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@es_plato2.insert_head(Alimento.new(TDD::Carne_cordero, "carne de cordero", 1))
			@es_platoEE2 = PlatoEE.new(@es_plato2)
			@espanola = List.new(@es_platoEE1)
			@espanola.insert_head(@es_platoEE2)

			@va_plato1 = List.new(Alimento.new(TDD::Carne_vaca, "carne de vaca", 1))
			@va_plato1.insert_head(Alimento.new(TDD::Cerveza, "cerveza", 1))
			@va_platoEE1 = PlatoEE.new(@va_plato1)
			@va_plato2 = List.new(Alimento.new(TDD::Salmon, "salmón", 1))
			@va_plato2.insert_head(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@va_platoEE2 = PlatoEE.new(@va_plato2)
			@vasca = List.new(@va_platoEE1)
			@vasca.insert_head(@va_platoEE2)
			
			@ve_plato1 = List.new(Alimento.new(TDD::Pollo, "pollo", 1))
			@ve_plato1.insert_head(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@ve_platoEE1 = PlatoEE.new(@ve_plato1)
			@ve_plato2 = List.new(Alimento.new(TDD::Camarones, "camarones", 1))
			@ve_plato2.insert_head(Alimento.new(TDD::Huevos, "huevos", 1))
			@ve_platoEE2 = PlatoEE.new(@ve_plato2)
			@vegetaria = List.new(@ve_platoEE1)
			@vegetaria.insert_head(@ve_platoEE2)
			
			@veg_plato1 = List.new(Alimento.new(TDD::Tofu, "tofu", 1))
			@veg_plato1.insert_head(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@veg_platoEE1 = PlatoEE.new(@veg_plato1)
			@veg_plato2 = List.new(Alimento.new(TDD::Nuez, "nuez", 1))
			@veg_plato2.insert_head(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@veg_platoEE2 = PlatoEE.new(@veg_plato2)
			@vegetaliana = List.new(@veg_platoEE1)
			@vegetaliana.insert_head(@veg_platoEE2)
			
			@lxc_plato1 = List.new(Alimento.new(TDD::Carne_vaca, "carne de vaca", 1))
			@lxc_plato1.insert_head(Alimento.new(TDD::Cerdo, "cerdo", 1))
			@lxc_platoEE1 = PlatoEE.new(@lxc_plato1)
			@lxc_plato2 = List.new(Alimento.new(TDD::Carne_cordero, "carne de cordero", 1))
			@lxc_plato2.insert_head(Alimento.new(TDD::Pollo, "pollo", 1))
			@lxc_platoEE2 = PlatoEE.new(@lxc_plato2)
			@locuraXcarne = List.new(@lxc_platoEE1)
			@locuraXcarne.insert_head(@lxc_platoEE2)
		end

		it "Comparando platos de la dieta española" do
			expect(true).to eq(@es_platoEE1 < @es_platoEE2)
			expect(true).to eq(@es_platoEE1 <= @es_platoEE2)
			expect(false).to eq(@es_platoEE1 > @es_platoEE2)
			expect(false).to eq(@es_platoEE1 == @es_platoEE2)
		end

		it "Comparando platos de la dieta vasca" do
			expect(true).to eq(@va_platoEE1 < @va_platoEE2)
			expect(true).to eq(@va_platoEE1 <= @va_platoEE2)
			expect(false).to eq(@va_platoEE1 > @va_platoEE2)
			expect(false).to eq(@va_platoEE1 == @va_platoEE2)
		end

		it "Comparando platos de la dieta vegetaria" do
			expect(true).to eq(@ve_platoEE1 > @ve_platoEE2)
			expect(true).to eq(@ve_platoEE1 >= @ve_platoEE2)
			expect(false).to eq(@ve_platoEE1 < @ve_platoEE2)
			expect(false).to eq(@ve_platoEE1 == @ve_platoEE2)
		end

		it "Comparando platos de la dieta vegetativa" do
			expect(false).to eq(@veg_platoEE1 > @veg_platoEE2)
			expect(true).to eq(@veg_platoEE1 >= @veg_platoEE2)
			expect(false).to eq(@veg_platoEE1 < @veg_platoEE2)
			expect(true).to eq(@veg_platoEE1 == @veg_platoEE2)
		end

		it "Comparando platos de la dieta locura por la carne" do
			expect(true).to eq(@lxc_platoEE1 > @lxc_platoEE2)
			expect(true).to eq(@lxc_platoEE1 >= @lxc_platoEE2)
			expect(false).to eq(@lxc_platoEE1 < @lxc_platoEE2)
			expect(false).to eq(@lxc_platoEE1 == @lxc_platoEE2)
		end


		it "Prueba para enumerar listas de platos" do
			expect([@es_platoEE1, @es_platoEE2]).to eq(@espanola.sort)
			expect(@es_platoEE2).to eq(@espanola.max)
			expect(@va_platoEE1).to eq(@vasca.min)
			expect([@es_platoEE1, @es_platoEE1]).to eq(@locuraXcarne.collect { |i| i = @es_platoEE1 })
			expect([@ve_platoEE2]).to eq(@vegetaria.select { |i| i < @ve_platoEE1 })
		end
=end
	end

	context "Práctica 9" do
=begin		before :each do
			@p1 = List.new(Alimento.new(TDD::Camarones, "camarones", 1))
			@p1.insert_head(Alimento.new(TDD::Cerveza, "cerveza", 1))
			@primero = PlatoEE.new(@p1)

			@p2 = List.new(Alimento.new(TDD::Pollo, "pollo", 1))
			@p2.insert_head(Alimento.new(TDD::Lentejas, "lentejas", 1))
			@segundo = PlatoEE.new(@p2)

			@p3 = List.new(Alimento.new(TDD::Cafe, "café", 1))
			@postre = PlatoEE.new(@p3)

			@menu = [@primero, @segundo, @postre]
			@precio = [12.70, 7.25, 0.90]
		end

		it "Prueba para obtener el plato con mayor huella nutricional" do
			expect(@menu.max).to eq(@segundo)
		end
		
		it "Prueba para obtener el plato con menor huella nutricional" do
			expect(@menu.min).to eq(@postre)
		end

		it "Prueba para incrementar el precio del menú" do
			precio_nuevo = @precio.collect { |p| p * @menu.max.huella_nutricional }
			expect(precio_nuevo).to eq([25.40, 14.50, 1.80])
=end		end		
		
	end


	context "# Práctica 10: diseñar e implementar un DSL" do

		before :each do
			@hamburguesa = PlatoEE.new("Hamburguesa") do |r|
				r.descripcion	"hamburguesa especial de la casa"
				r.alimento	:descripcion => "carne de vaca",
						:gramos => 100
				r.alimento	:descripcion => "huevo",
						:gramos => 20
			end
		end

		it "Se recibe un bloque" do
			plato = PlatoEE.new("Hamburguesa") do |r|
				r.descripcion	"hamburguesa especial de la casa"
				r.alimento	:descripcion => "carne de vaca",
						:gramos => 100
				r.alimento	:descripcion => "huevo",
						:gramos => 20
			end
		end

		it "Prueba del método to_s utilizando bloques" do
			expect(@hamburguesa.to_s).to eq("HAMBURGUESA ESPECIAL DE LA CASA\n\n100 gramos de carne de vaca \n"
	end	

end

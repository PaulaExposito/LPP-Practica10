require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'
require './lib/tdd/lista.rb'

RSpec.describe List do

	context "# Dieta española" do
		before :each do
			@maria = Persona.new("María", "mujer")

			@es_pollo = Alimento.new([6,0,3,5.7,7.1], "pollo", 1)
			@es_lenteja = Alimento.new([8,25,1,0.4,3.4], "lentejas", 1)
			@es_nuez = Alimento.new([6,15,36,0.3,7.9], "nueces", 1) 			    
			@va_camarones = Alimento.new([14.5,10,30,18,2], "camarones", 1)
			@va_cerveza = Alimento.new([0.5,30,10,0.24, 0.22], "cerveza", 1)
			@ve_leche = Alimento.new([12,5,7,3.2,8.9], "leche", 1)
			@ve_huevos = Alimento.new([3,5,3,4.2,5.7], "huevos", 1)
			@ve_chocolate = Alimento.new([5,30,20,2.3,3.4], "chocolate", 1)
			@veg_cafe = Alimento.new([0,18,15,0.4,0.3], "cafe", 1)
			@veg_tofu = Alimento.new([0,22,35,2,2.2], "tofu", 1)
			@veg_lentejas = Alimento.new([10,15,5,0.4,3.4], "lentejas", 1)
			@lxc_vaca = Alimento.new([20,5,1,50,164], "carne de vaca", 1)
			@lxc_cordero = Alimento.new([20,10,20,20,185], "carne de cordero", 1)
			@lxc_pollo = Alimento.new([10,10,4,5.7,7.1], "pollo", 1)

			@espanola = List.new(@es_pollo)
			@espanola.insert_head(@es_lenteja)
			@espanola.insert_head(@es_nuez)

			@vasca = List.new(@va_camarones)
			@vasca.insert_head(@va_cerveza)

			@vegetalia = List.new(@ve_leche)
		        @vegetalia.insert_head(@ve_huevos)
			@vegetalia.insert_head(@ve_chocolate)	

			@vegetaliana = List.new(@veg_cafe)
			@vegetaliana.insert_head(@veg_tofu)
			@vegetaliana.insert_head(@veg_lentejas)

			@locuraXcarne = List.new(@lxc_vaca)
			@locuraXcarne.insert_head(@lxc_cordero)
			@locuraXcarne.insert_head(@lxc_pollo)
		end

		it "Emisiones de GEI diarias" do
			expect(6.4).to eq(@maria.impacto_ambiental_diario(@espanola)[0])
			expect(18.24).to eq(@maria.impacto_ambiental_diario(@vasca)[0])
			expect(9.7).to eq(@maria.impacto_ambiental_diario(@vegetalia)[0])
			expect(2.8).to eq(@maria.impacto_ambiental_diario(@vegetaliana)[0])
			expect(75.7).to eq(@maria.impacto_ambiental_diario(@locuraXcarne)[0])
		end

		it "Emisiones de GEI anuales" do
			expect(2336).to eq(@maria.impacto_ambiental_anual(@espanola)[0])
			expect(6657.6).to eq(@maria.impacto_ambiental_anual(@vasca)[0])
			expect(3540.5).to eq(@maria.impacto_ambiental_anual(@vegetalia)[0])
			expect(1022).to eq(@maria.impacto_ambiental_anual(@vegetaliana)[0])
			expect(27630.5).to eq(@maria.impacto_ambiental_anual(@locuraXcarne)[0])
		end

		it "Terreno utilizado diariamente" do
			expect(18.4).to eq(@maria.impacto_ambiental_diario(@espanola)[1])
			expect(2.22).to eq(@maria.impacto_ambiental_diario(@vasca)[1])
			expect(18).to eq(@maria.impacto_ambiental_diario(@vegetalia)[1])
			expect(5.9).to eq(@maria.impacto_ambiental_diario(@vegetaliana)[1])
			expect(356.1).to eq(@maria.impacto_ambiental_diario(@locuraXcarne)[1])
		end

		it "Terreno utilizado anualmente" do
			expect(6716).to eq(@maria.impacto_ambiental_anual(@espanola)[1])
			expect(810.3).to eq(@maria.impacto_ambiental_anual(@vasca)[1])
			expect(6570).to eq(@maria.impacto_ambiental_anual(@vegetalia)[1])
			expect(2153.5).to eq(@maria.impacto_ambiental_anual(@vegetaliana)[1])
			expect(129976.5).to eq(@maria.impacto_ambiental_anual(@locuraXcarne)[1])
		end
	end

end

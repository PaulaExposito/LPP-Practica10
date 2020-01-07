require './lib/tdd/version.rb'
require './lib/tdd/alimento.rb'
require './lib/tdd/plato.rb'
require './lib/tdd/lista.rb'
require './lib/tdd/platoEE.rb'
require './lib/tdd/menu.rb'

RSpec.describe Menu do
	context "# Pruebas para la clase Menú" do
		before :all do
			@hamburguesa = PlatoEE.new("Hamburguesa") do 
				descripcion	"hamburguesa especial de la casa"
				alimento 	:descripcion => "carne de vaca",
						:gramos => 100,
						:valores_nutricionales => TDD::Carne_vaca
				alimento	:descripcion => "huevo",
						:gramos => 20,
						:valores_nutricionales => TDD::Huevos
			end

			@papitas = PlatoEE.new("Papas fritas") do 
				descripcion	"Papas fritas pequeñas"
				alimento 	:descripcion => "papas",
						:gramos => 30,
						:valores_nutricionales => TDD::Nuez
			end

			@batido = PlatoEE.new("Batido de chocolate") do 
				descripcion	"batido de chocolate y leche extra grande"
				alimento 	:descripcion => "leche",
						:gramos => 75,
						:valores_nutricionales => TDD::Leche
				alimento 	:descripcion => "chocolate",
						:gramos => 30,
						:valores_nutricionales => TDD::Chocolate
			end

=begin			@menu = Menu.new("Combinado nº1") do
				descripcion "hamburguesa, papas, batido"
				componente :descripcion => "Hamburguesa especial de la casa",
					:precio => 4.25,
					:plato => @hamburguesa
				componente :descripcion => "Papas pequeñas",
					:precio => 1.75,
					:plato => @papitas
				componente :descripicion => "Batido de chocolate",
					:precio => 1.50,
					:plato => @batido
				precio 	7.50
=end			end
		end

		it "Se crea la estructuras de Menu con los dos métodos" do
			menu2 = Menu.new("Combinado nº1") do |r|
				r.descripcion "hamburguesa, papas, batido"
				r.componente :descripcion => "Hamburguesa especial de la casa",
					:precio => 4.25,
					:plato => @hamburguesa
				r.componente :descripcion => "Papas pequeñas",
					:precio => 1.75,
					:plato => @papitas
				r.componente :descripicion => "Batido de chocolate",
					:precio => 1.50,
					:plato => @batido
				r.precio 	7.50
			end
			p @hamburguesa.to_s
		end
	end
end

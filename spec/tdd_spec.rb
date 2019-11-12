require 'spec_helper'
require './lib/tdd/alimento.rb'
require './lib/tdd/persona.rb'

describe TDD do
	context "# Creando clase Alimento" do
		it "Se crea un alimento correctamente" do
			queso = Alimento::Alimento.new(25.0)
			expect(queso.nombre).to eq("queso")
		end
	end
end

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Solo las pruebas de lista"
task :lista do
	sh "rspec ./spec/dietas_spec.rb"
	sh "rspec ./spec/lista_spec.rb"
end

desc "Solo las pruebas de plato"
task :plato do
	sh "rspec ./spec/platoEE_spec.rb"
end

task :default => :spec

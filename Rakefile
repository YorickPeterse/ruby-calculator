require 'rake/clean'

CLEAN.include('lib/calculator/parser.rb')

rule '.rb' => '.y' do |task|
  sh "racc -l -o #{task.name} #{task.source}"
end

desc 'Runs the tests'
task :test => [:generate] do
  sh 'rspec spec'
end

desc 'Generates the parser'
task :generate => ['lib/calculator/parser.rb']

task :default => :test

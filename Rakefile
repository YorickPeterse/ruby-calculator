require 'rake/clean'

CLEAN.include('lib/calculator/parser.rb')

rule '.rb' => '.y' do |task|
  sh "racc -l -o #{task.name} #{task.source}"
end

desc 'Generates the parser'
task :generate => ['lib/calculator/parser.rb']

desc 'Regenerates the parser'
task :regenerate => [:clean, :generate]

desc 'Runs the tests'
task :test => [:regenerate] do
  sh 'rspec spec'
end

task :default => :test

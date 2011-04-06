require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "congress_scrapper"
  gem.homepage = "http://github.com/Canx/congress_scrapper"
  gem.license = "MIT"
  gem.summary = %Q{Wrapper para acceder a las propuestas del Congreso (congreso.es)}
  gem.description = %Q{Wrapper para acceder a las propuestas del Congreso (congreso.es)}
  gem.email = "canchete@gmail.com"
  gem.authors = ["Canx"]
  
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_runtime_dependency 'mechanize'
  gem.add_development_dependency 'rspec'
end
Jeweler::RubygemsDotOrgTasks.new
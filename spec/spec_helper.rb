# encoding: utf-8
require 'webmock/rspec'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

Rspec.configure do |config|
  config.include WebMock::API
  config.extend VCR::RSpec::Macros
end

$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')



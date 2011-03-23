# encoding: utf-8

require File.dirname(__FILE__) + '/congress_scrapper'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

VCR.use_cassette "proyecto_ley_sinde" do
  scrapper = CongressScrapper.new
  scrapper.query_with(:title => "Proyecto de Ley de Economía Sostenible") do |p|
    puts p[:title]  
  end
end

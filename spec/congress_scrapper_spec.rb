# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/congress_scrapper.rb'

describe "Scrap Proposal" do
	before(:each) do
		@scrapper = CongressScrapper.new
	end

	it "should get correct title" do
		VCR.use_cassette("proyecto_ley_sinde", :record => :none) do
			title = "Proyecto de Ley de Economía Sostenible"
      @scrapper.query_with(:title => title) { |p| puts p }
      scrapped_title.should == title
		end
	end

	#it "should get all the proposals" do
	#	@scrapper.where()
	#	@scrapper.get_proposals { |p| total = total + 1 } == @scrapper.count
	#end
end	

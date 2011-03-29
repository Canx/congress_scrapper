# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/initiative_factory.rb'

describe "InitiativeFactory" do
  
  it "should return the initiative title" do
    VCR.use_cassette("initiative_title") do
      title = "Moción de reprobación a don Gaspar Zarrías Arévalo"
      params = {"title" => title}
      initiatives = []
      pages=PageIterator.new
      pages.each_initiative_with(params) { |i| initiatives << i }
      initiatives.first[:title].should =~ /#{title}/
    end
  end

end
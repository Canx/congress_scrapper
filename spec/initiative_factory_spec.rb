# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/initiative_factory.rb'

describe "InitiativeFactory" do
  before(:each) do
      @title = "Moción de reprobación a don Gaspar Zarrías Arévalo"
      @params = {"title" => @title}
      @pages=PageIterator.new
  end

  it "should return the initiative title" do
    VCR.use_cassette("initiative_title") do
      initiatives = []
      @pages.each_initiative_with(@params) { |i| initiatives << i }
      initiatives.first[:title].should =~ /#{@title}/
    end
  end

  it "should return the initiative record date" do
    pending
  end
  
  it "should return the initiative qualification date, if exists" do
    pending
  end
  
  it "should return nothing if the qualification date doesn't exist" do
    pending
  end
  
  it "should return the initiative author, if exists" do
    pending
  end
end
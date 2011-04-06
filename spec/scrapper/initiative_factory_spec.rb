# encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'
require 'scrapper'
require 'scrapper/initiative_factory'

describe "InitiativeFactory" do
  before(:each) do
      @title = "Moción de reprobación a don Gaspar Zarrías Arévalo"
      @params = {"title" => @title}
      @pages=Scrapper.new
  end

  it "should return the initiative title" do
    VCR.use_cassette("initiative_title") do
      initiatives = []
      @pages.each_initiative_with(@params) { |i| initiatives << i }
      initiatives.first[:title].should =~ /#{@title}/
    end
  end

  it "should return the initiative proposal date" do
    VCR.use_cassette("initiative_title") do
      initiatives = []
      @pages.each_initiative_with(@params) { |i| initiatives << i }
      initiatives.first[:proposed_at].should == Date.new(2010,12,9)
    end
  end
  
  it "should return the initiative qualification date, if exists" do
    VCR.use_cassette("initiative_title") do
      initiatives = []
      @pages.each_initiative_with(@params) { |i| initiatives << i }
      initiatives.first[:qualified_at].should == Date.new(2010,12,14)
    end
  end
  
  it "should return the iniciative code" do
    pending
  end
  
  it "should return the tramitation result, if exists" do
    pending
  end
  
  it "should return nothing if the qualification date doesn't exist" do
    pending
  end
  
  it "should return the initiative author, if exists" do
    pending
  end
end
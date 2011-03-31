# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require 'scrapper'

describe "Scrapper" do
  before(:each) do
    @scrap = Scrapper.new
  end
  
  it "should not return results in a empty page result" do
    VCR.use_cassette("page_empty") do
      params = {"from_date" => "01/01/2010", "to_date" => "01/01/2010"}
      initiatives = []
      @scrap.each_initiative_with(params) { |i| initiatives << i }
      initiatives.should == []
    end
  end
  
  it "should return all iniciatives in a single page result" do
    VCR.use_cassette("page_single22") do  
      params = {"from_date" => "01/01/2010",
              "to_date" => "01/05/2010",
              "type" => "Proyecto de ley"}
      initiatives = []
      @scrap.each_initiative_with(params) { |i| initiatives << i }
      initiatives.count.should == 22 
    end
  end
  
  it "should return all iniciatives in a multiple page result" do
    VCR.use_cassette("page_multiple46") do
      params = {"from_date" => "01/01/2010",
              "to_date" => "01/12/2010",
              "type" => "Proyecto de ley"}
      initiatives = []
      @scrap.each_initiative_with(params) { |i| initiatives << i }
      initiatives.count.should == 46
    end
  end
end
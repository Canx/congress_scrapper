# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/page_iterator.rb'

describe "PageIterator" do

  it "should not return results in a empty page result" do
    VCR.use_cassette("page_empty") do
      params = {"from_date" => "01/01/2010", "to_date" => "01/01/2010"}
      initiatives = []
      pages=PageIterator.new
      pages.each_initiative_with(params) { |i| initiatives << i }
      initiatives.should == []
    end
  end
  
  it "should return all iniciatives in a single page result" do
    VCR.use_cassette("page_single22") do  
      params = {"from_date" => "01/01/2010",
              "to_date" => "01/05/2010",
              "type" => "Proyecto de ley"}
      initiatives = []
      pages=PageIterator.new
      pages.each_initiative_with(params) { |i| initiatives << i }
      initiatives.count.should == 22 
    end
  end
  
  it "should return all iniciatives in a multiple page result" do
    pending
  end
end
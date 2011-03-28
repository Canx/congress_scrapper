# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/form.rb'

describe "Form submit" do
  before(:each) do
    @url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
    @agent=Mechanize.new
  end
  
  it "should return results" do
    VCR.use_cassette "form_submit" do
      params = {}
      page=@agent.get(@url)
      form=Form.new(page)
      first_page=form.submit(params)
      first_page.search("//div[@id='RESULTADOS_BUSQUEDA']").should_not be_empty 
    end
  end
  
  it "should return iniciatives witch match with the title specified" do
    VCR.use_cassette "form_title" do
      params = {"title" => "Proyecto de Ley de Contratos de Crédito al Consumo"}
      page=@agent.get(@url)
      form=Form.new(page)
      first_page=form.submit(params)
      first_page.search("//div[@class='SUBTITULO_CONTENIDO']/span").text.should == "1"
    end
  end
  
  it "should raise ArgumentError when incorrect argument is provided" do
    VCR.use_cassette "form_submit" do
      params = {"xxx" => "Incorrect parameter"}
      page=@agent.get(@url)
      form=Form.new(page)
      expect { form.submit(params) }.to raise_error(ArgumentError, "Parameter xxx not supported.")
    end
  end
  
  it "should return iniciatives of type provided" do
    VCR.use_cassette "form_type" do
      params = {"type" => "Iniciativa legislativa popular"}
      page = @agent.get(@url)
      form = Form.new(page)
      first_page = form.submit(params)
      first_page.search("//p[@class='subtitulo_competencias']").text.should == "Iniciativa legislativa popular."
    end
  end
  
  it "should return iniciatives from date1 to date2" do
    VCR.use_cassette "form_date" do
      params = {"from_date" => "01/01/2010", "to_date" => "01/01/2011"}
      page = @agent.get(@url)
      form = Form.new(page)
      first_page = form.submit(params)
      first_page.search("//div[@class='SUBTITULO_CONTENIDO']/span").text.should == "31596"
    end
  end
end

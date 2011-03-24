# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/form.rb'

describe "Form submit" do
  
  it "should return results" do
    VCR.use_cassette "submit form" do
      url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
      params = []
      agent=Mechanize.new
      page=agent.get(url)
      form=Form.new(page,params)
      first_page=form.submit
      first_page.search("//div[@id='RESULTADOS_BUSQUEDA']").should_not be_empty 
    end
  end
end

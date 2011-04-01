# encoding: utf-8
require 'mechanize'
require 'scrapper/initiative_factory'
require 'scrapper/form'

class Scrapper
  
  def initialize
	  @url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
    @agent = Mechanize.new
  end
  
  def each_initiative_with(params,&block)
    each("//div[@class='resultados_competencias']", params) do |node|
        initiative = InitiativeFactory.create(node)
        block.call(initiative) if !initiative.nil?
    end
  end

  private
      
  def each(search_text, params)
    form_page = @agent.get(@url)
    form = Form.new(form_page)
    @actual_page=form.submit(params)
    
    # Loop through pages
    loop do 
      # Loop through matched nodes in each page
      @actual_page.search(search_text).each { |node| yield node }
      break if next_page.nil?
      @actual_page = @agent.click(next_page)
    end
  end
    
  def next_page
    @actual_page.link_with(:text => /Siguiente/)
  end
  
end

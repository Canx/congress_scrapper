# encoding: utf-8
require 'mechanize'

class PageIterator
  
  def initialize()
	  @url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
    @agent = Mechanize.new
    @first_page = page
    @actual_page = page
  end
  
  def each_initiative
    each(".titulo_iniciativa a")
  end

  private
    
  def each(search_text)
    @actual_page = @first_page
    while next_page do
      @actual_page.search(search_text).each { |node| yield node}
      @actual_page = @agent.get(next_page)
    end
  end
    
  def next_page
    @actual_page.link_with(:text => /Siguiente/)
  end
  
end
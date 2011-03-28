# encoding: utf-8
require 'mechanize'

class PageIterator
  
  def initialize
	  @url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
    @agent = Mechanize.new
  end
  
  def each_initiative_with(params)
    each(".titulo_iniciativa a", params)
  end

  private
    
  def each(search_text, params)
    form_page = @agent.get(@url)
    form = Form.new(form_page)

    @first_page=form.submit(params)
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
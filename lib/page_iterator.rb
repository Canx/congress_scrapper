# encoding: utf-8

class PageIterator
  def initialize(page)
    @first_page = page
    @actual_page = page
  end
  
  def each
    
  end
  
  
  def has_next?
    @actual_page.link_with(:text => /Siguiente/)
  end
  
  # Tenemos que cambiar la actual page!
  def next
    @actual_page = @actual_page.link_with(:text => /Siguiente/)
  end
end
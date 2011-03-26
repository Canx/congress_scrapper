# encoding: utf-8

class PageIterator
  def initialize(page)
    @first_page = page
    @actual_page = page
  end
  
  def each
    @actual_page = @first_page
    while has_next? do
      yield @actual_page
      next
    end
  end
  
  def has_next?
    
  end
  
  def next
    @actual_page = @actual_page.link_with(:text => /Siguiente/)
  end
end
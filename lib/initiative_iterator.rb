# external iterator to obtain initiative objects
class InitiativeIterator
  def initialize(page)
    @pages = PageIterator.new(page)
  end
  
  def each
    pages.each do |current_page|
      initiative_item = @current_page.search("//p [@class='titulo_iniciativa']/a")
      initiative_items.each do |item|
        InitiativeScrapper.new(item)  
      #procesar item
      end
    end
  end

  # check if we already are in the last page and in the last initiative
  def has_next?
        
  end

  # return initiative object
  def item
    
  end

  # moves iterator to next initiative
  def next_item

  end

  private

  def next_page
    @pages.next
  end

  
end

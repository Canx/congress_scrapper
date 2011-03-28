# external iterator to obtain initiative objects
class InitiativeScrapper
  def initialize(page_iterator)
    @pages = page_iterator
  end  
  
  def scrap
    @pages.each_iniciative   
  end
  
end

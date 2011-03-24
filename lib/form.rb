# encoding: utf-8

# Usage:
#   params[:title => "Hola"]
#   agent=Mechanize.new
#   page=agent.get(url)
#   form=Form.new(page,params)
#   first_page=form.submit

class Form
  def initialize(page)    
    @form = page.form_with(:action => /enviarCgiBuscadorAvIniciativas/)
    # TODO: if form is null throw exception
  end
  
  def submit(params)
    #check(params)      
    @form.submit
    # TODO: if submit fails throw exception
  end
  
  #def check(params)
  #  params.each do |header, content|
  #    case header
  #      when (:title) then form["OBJE"] = content
	#			# TODO: if params doesn't exist throw exception
  #    end  
  #	end
  #end
  
end

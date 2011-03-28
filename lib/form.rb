# encoding: utf-8

# Usage:
#   params[:title => "Hola"]
#   agent=Mechanize.new
#   page=agent.get(url)
#   form=Form.new(page,params)
#   first_page=form.submit

class Form
  attr_reader :form
  
  def initialize(page)    
    @form = page.form_with(:action => /enviarCgiBuscadorAvIniciativas/)
    # TODO: if form is null throw exception
  end
  
  def submit(params)
    check(params)      
    @form.submit
    # TODO: if submit fails throw exception
  end
  
  def check(params)
    params.each do |header, content|
      case header
        when "title" then @form["OBJE"] = content
        # TODO: Check types
        when "type" then @form["SINI"] = content
        when "from_date" then @form["ddia"], @form["dmes"], @form["dano"] = content.split("/")
        when "to_date" then @form["hdia"], @form["hmes"], @form["hano"] = content.split("/")
        else raise ArgumentError, "Parameter " + header + " not supported."
      end  
    end
  end

end

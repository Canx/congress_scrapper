# encoding: utf-8

# Use:
# scrapper = Scrapper.new
# scrapper.proposal_with(:title=>"prueba") {|p| import p}
# scrapper.proposal_with(:title=>"dfsdf", :fetch => 1) {|p| import p}

# TODO: Como usamos limit para que salga del proceso??? Excepciones???
require 'mechanize'

class Scrapper 
	
	def initialize
	  @url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
    @agent = Mechanize.new
	end
	
  def query(params)
    @form = Form.new(@url)
    @first_page = @form.submit(params)
    initiatives = InitiativeIterator.new(@first_page)
    initiatives.each do |initiative|
      yield initiative
    end
  end

	def count
		@count ||= first_page.search("//*[contains(text(), 'Iniciativas encontradas')]/span").first.text.to_i
	end

  private
  
  # TODO: check params and make sure it will submit again
	def check(params)
		@first_page = @actual_page = nil
		params.each do |header, content|
			case header
				when (:title) then form["OBJE"] = content
				when (:fetch) then @limit = content
				# TODO: lanzar una excepción si no existe el parametro
			end
		end
	end

	# scrap actual page searching for proposal links and scrapping proposals
	def scrap(page)
		page.search(".titulo_iniciativa a").each do |title|
			proposal_page = @agent.get(title[:href])
      #initiatives << Initiative.new(title[:href])
			proposal=scrap_proposal(proposal_page)
			@do_with_proposal.call(proposal)
			check_limit
		end
	end

	def scrap_proposal(proposal_page)
		proposal = {}
		proposal[:title] = proposal_page.search(".subtitulo_competencias").first.content
		#proposal[:type] = clean_text(proposal_page.search(".subtitulo_competencias").first.try(:content))
		#proposal[:resolution] = clean_text(proposal_page.search("//*[@class='apartado_iniciativa' and contains(normalize-space(text()),'Resultado de la tramitación')]/following-sibling::*[@class='texto']").first.try(:content))
		#proposal[:comission_name] = clean_text(proposal_page.search("//*[@class='apartado_iniciativa' and contains(normalize-space(text()),'Comisión competente:')]/following-sibling::*[@class='texto']").first.try(:content))
		#proposal[:full_name] = clean_text(proposal_page.search("//*[@class='apartado_iniciativa' and contains(normalize-space(text()),'Autor:')]/following-sibling::*[@class='texto']").first.try(:content))
		#proposal[:proposed_at_text] = proposal_page.search("//*[@class='texto' and contains(normalize-space(text()),'Presentado el')]").first.try(:content)
		
		#proposal[:proposed_at] = 
		#proposal[:closed_at_text] = proposal_page.search("//*[@class='apartado_iniciativa' and contains(normalize-space(text()),'Tramitación seguida por la iniciativa:')]/following-sibling::*[@class='texto']").first.try(:content)

		return proposal
	end

	# TODO: throws exception when limit is reached!
	def check_limit

	end
	
	def clean_text(text)
	    return unless text
	    text.gsub(/\s+/,' ').gsub(/\s*\.\s*$/, '').strip
	end
        
	def form_page
		@form_page ||= @agent.get(@url)
	end

	def form
		@form ||= form_page.form_with(:action => /enviarCgiBuscadorAvIniciativas/)
	end

	def first_page
		@first_page ||= form.submit
	end

  def next_page
		@actual_page = @actual_page.link_with(:text => /Siguiente/)
	end	
end

require 'mechanize'

url = "http://www.congreso.es/portal/page/portal/Congreso/Congreso/Iniciativas/Busqueda%20Avanzada"
agent = Mechanize.new
form_page = agent.get(url)
form = form_page.form_with(:action => /enviarCgiBuscadorAvIniciativas/)
page_result = form.submit
page_result.search(".titulo_iniciativa a").each do |title|
  puts "ENLACE:" + title[:href]
  proposal_page = agent.get(title[:href])
  puts "TITULO:" + proposal_page.search(".subtitulo_competencias").first
  break
end

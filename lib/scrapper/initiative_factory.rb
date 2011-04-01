# encoding: utf-8

# TODO: Dependiendo de los parámetros y lo que encontremos en el nodo
#       crearemos una iniciativa o un objeto heredado más concreto (ProyectoDeLey...)
class InitiativeFactory
  def self.create(node)    
    node_url=node.search(".titulo_iniciativa a").first
    if !node_url.nil?
      # TODO: clean new line characters from title
      title=node_url.text
      comp_title=node.search("//p [@class='titulo_competencias']").text
      date_text = node.search("//p [contains(text(),'Presentado el')]").first.text
      proposed_at = Date.new($3.to_i, $2.to_i, $1.to_i) if date_text && date_text.match(/Presentado\s+el\s+(\d\d)\/(\d\d)\/(\d\d\d\d)/)
      qualified_at = Date.new($3.to_i, $2.to_i, $1.to_i) if date_text && date_text.match(/calificado\s+el\s+(\d\d)\/(\d\d)\/(\d\d\d\d)/)
      debugger
      return proposal = {:title => title,
                         :url => node_url['href'],
                         :proposed_at => proposed_at,
                         :qualified_at => qualified_at }      
    else 
      return nil
    end
  end
end
    
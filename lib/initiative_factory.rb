# encoding: utf-8

# TODO: Dependiendo de los parámetros y lo que encontremos en el nodo
#       crearemos una iniciativa o un objeto heredado más concreto (ProyectoDeLey...)
class InitiativeFactory
  def self.create(node, agent)
    @url=node["href"]
    @title=node.content
    @date_proposal = node.search("//*[@class='texto' and contains(normalize-space(text()),'Presentado el')]").first
    
    return proposal = {:title => @title,
                       :url => @url,
                       :date_proposal => @date_proposal}
  end
end
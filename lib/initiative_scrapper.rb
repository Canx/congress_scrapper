# encoding: utf-8

class InitiativeScrapper
  attr_reader :url, :title
  
  def initialize(node, agent)
    @url=node["href"]
    @title=node.content
  end
end
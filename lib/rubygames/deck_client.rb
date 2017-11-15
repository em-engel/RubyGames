require 'open-uri'
require 'rubygames/card'

module Rubygames
class DeckClient
  attr_accessor :server

  def initialize(server = 'http://localhost:4567')
    @server = server
  end

  def next_card
    card_parts = open("#{server}/card").read.split('')
    Card.new(card_parts.first, card_parts.last)
  end
end
end

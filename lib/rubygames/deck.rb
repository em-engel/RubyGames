require 'rubygames/card'
require 'rubygames/hand'
require 'forwardable'

module Rubygames
class Deck
  include Enumerable
  extend  Forwardable

  def_delegators :@cards, :each, :length, :size
  
  def initialize
    @cards = Card::VALUES.product(Card::SUITS).map do |v, s|
      Card.new(v, s)
    end
    @discard_pile = []
  end

  def to_s
    "[ " + @cards.join(' ') + " ]"
  end

  def to_pretty_string
    "[ " + @cards.map{|c|c.to_pretty_string}.join(' ') + " ]"
  end
  alias_method :inspect, :to_pretty_string

  def shuffle
    @cards += @discard_pile
    @cards.shuffle!
    self
  end

  def take(n)
    hand = @cards.shift(n)
    @discard_pile += hand
    hand
  end

  def take_one
    take(1).first
  end

  def deal_hand
    Hand.new(take(5))
  end

end
end

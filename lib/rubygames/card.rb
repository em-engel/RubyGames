# coding: utf-8
require 'term/ansicolor'

module Rubygames
class Card
  include Comparable
  extend Term::ANSIColor
  
  SUITS = %w(♠ ♥ ♦ ♣)
  COLORS = [black, red, red, black, reset]
  VALUES = (2..10).to_a + %w(J Q K A)

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit  = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def is_face?
    ['J', 'Q', 'K', 'A'].include?(self.value)
  end
  
  def to_pretty_string
    color = COLORS[SUITS.index(@suit)]
    reset = COLORS.last
    "#{color}#{self}#{reset}"
  end

  alias_method :inspect, :to_s

  def <=>(otherCard)
    return nil unless otherCard.is_a?(Card)

    VALUES.index(self.value) <=> VALUES.index(otherCard.value)
  end
end
end

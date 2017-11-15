#!/usr/bin/env ruby

require './deck'

deck = Deck.new
deck.shuffle
card1 = deck.take_one
card2 = deck.take_one

if card1 > card2
  player1_wins = "WINNER"
elsif card1 < card2
  player2_wins = "WINNER"
else
  player1_wins = player2_wins = "TIE"
end

puts "Player 1: #{card1.to_pretty_string} #{player1_wins}"
puts "Player 2: #{card2.to_pretty_string} #{player2_wins}"

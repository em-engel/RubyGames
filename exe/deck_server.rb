#!/usr/bin/env ruby
require 'sinatra'
require './deck'

class DeckServer < Sinatra::Base
  set :deck, Deck.new
  set :magic_number, 42

  get '/' do
    "Try going to /card"
  end

  get '/number' do
    settings.magic_number.to_s
  end
  
  get '/card' do
    settings.deck.take(1).first.to_s
  end

  get '/shuffle' do
    settings.deck.shuffle
    "Shuffled!"
  end
end

DeckServer.run!

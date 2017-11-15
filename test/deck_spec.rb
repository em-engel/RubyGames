require 'rspec'
require_relative '../deck'

describe Deck do
  it 'delegates #size to an Array' do
    deck = Deck.new

    expect_any_instance_of(Array).to receive(:size).and_return(5)
    expect(deck.size).to eq(5)
  end
end

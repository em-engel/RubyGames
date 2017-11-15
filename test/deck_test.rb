require 'test_helper'

class DeckTest < Minitest::Test
  def setup
    @deck = Rubygames::Deck.new
  end
  
  def test_deck_has_52_cards
    assert_equal 52, @deck.size
  end

  def test_deck_is_enumerable
    count = 0
    @deck.each{|c| count += 1}
    assert_equal 52, count
  end

  def test_take_1_card_gives_1_card
    hand = @deck.take(1)
    assert_kind_of Array, hand
    assert_equal 1, hand.length
  end

  def test_take_5_cards_gives_5_cards
    hand = @deck.take(5)
    assert_kind_of Array, hand
    assert_equal 5, hand.length
  end

  def test_take_1_52_times_returns_all_cards
    hand = []
    52.times do
      hand += @deck.take(1)
    end

    assert_equal 52, hand.size
    assert_equal 52, hand.uniq.size
    assert_equal 0, @deck.size
  end

end

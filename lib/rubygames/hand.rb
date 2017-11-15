module Rubygames
class Hand
  include Comparable

  KINDS = [:high_card, :pair, :two_pair, :three_of_a_kind,
           :straight, :flush, :full_house, :four_of_a_kind,
           :straight_flush]
  
  def initialize(cards)
    @cards = cards
  end

  def to_s
    @cards.to_s
  end

  def <=>(otherHand)
    kind_idx = KINDS.index(self.kind)
    other_kind_idx = KINDS.index(otherHand.kind)

    kind_cmp = kind_idx <=> other_kind_idx
    return kind_cmp unless kind_cmp == 0

    counts = self.counts
    otherCounts = otherHand.counts

    # counts.first is ["Q", 3]
    high_count = counts.first.last
    my_top_counts = counts.select{|val, cnt| cnt == high_count}
    other_top_counts = otherCounts.select{|val, cnt| cnt == high_count}

    my_top_cards = my_top_counts.keys.map{|k| Card::VALUES.index(k)}
    other_top_cards = other_top_counts.keys.map{|k| Card::VALUES.index(k)}

    return my_top_cards.max <=> other_top_cards.max
  end

  def pair?
    n_of_a_kind?(2)
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def kind
    KINDS.reverse.each do |kind|
      if self.methods.include?("#{kind}?".to_sym) && self.send("#{kind}?")
        return kind
      end
    end

    return :high_card
  end

  protected
  def cards
    @cards
  end

  def counts
    counts = self.cards.reduce({}) do |counts, card|
      counts[card.value] ||= 0
      counts[card.value] += 1
      counts
    end

    counts.sort_by{|val, cnt| cnt}.reverse
  end

  

  private
  def n_of_a_kind?(n)
    counts.any?{ |value, count| count == n }
  end
end
end

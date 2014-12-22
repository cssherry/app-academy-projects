require_relative 'card'

class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    total = 0
    ace = 0
    @cards.each do |card|
      if card.value == :ace
        total += 11
        ace += 1
      else
        total += card.class::BLACKJACK_VALUE[card.value]
      end
    end

    ace.times { total -= 10 if total > 21 }

    total
  end

  def busted?
    points > 21
  end

  def hit(deck)
    if busted?
      raise 'already busted'
    end
    @cards.concat(deck.take(1))
  end

  def beats?(other_hand)
    return false if busted?
    return true if other_hand.busted?
    points > other_hand.points
  end

  def return_cards(deck)
    deck.return(cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end

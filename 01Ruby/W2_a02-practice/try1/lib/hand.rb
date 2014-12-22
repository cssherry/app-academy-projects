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
    aces = 0
    total = 0
    @cards.each do | card |
      if card.value == :ace
        aces += 1
      else
        total += card.blackjack_value
      end
    end

    while aces > 0
      total + aces * 11 < 22 ? total += 11 : total += 1
      aces -= 1
    end

    total
  end

  def busted?
    points > 21 ? true : false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if busted?
    other_hand.points < points ? true : false
  end

  def return_cards(deck)
    deck.return(cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end

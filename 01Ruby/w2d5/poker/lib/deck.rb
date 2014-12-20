require_relative('card')

class Deck

  def self.build_deck
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards
  end

  attr_accessor :cards

  def initialize
    @cards = self.class.build_deck
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def draw(number_cards)
    raise Exception if cards.length == 0
    cards_drawn = @cards[-number_cards..-1].reverse
    @cards -= cards_drawn
    cards_drawn
  end
end

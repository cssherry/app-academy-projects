require_relative 'card'

# Represents a deck of playing cards.
class Deck
  attr_accessor :all_cards

  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @all_cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    all_cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    taken_cards = []
    n.times do
      if all_cards.empty?
        raise 'not enough cards'
      else
        taken_cards << all_cards.shift
      end
    end
    taken_cards
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @all_cards = all_cards + cards
  end
end

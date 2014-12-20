require_relative 'hand'

class Player
  attr_accessor :hand, :pot, :deck

  def initialize(hand, pot, deck)
    @hand, @pot, @deck = hand, pot, deck
  end

  def discard

    loop do
      print "Enter value and suit of card to discard."
      value, suit = parse_input
      self.hand.cards.delete_if do |card|
        card.value == value && card.suit == suit
      end
      self.hand.cards += deck.draw(1)
      break if done_discarding?
    end

  end

  def done_discarding?
    print "Card discarded. Done discarding? (y/n)"
    (gets.chomp == "y") ? true : false
  end

  def parse_input
    # "value suit"
    value_str, suit_str = gets.chomp.split(" ")
    begin
      value = Integer(value_str)
    rescue
      value = value_str.to_sym
    end
    suit = suit_str.to_sym

    [value, suit]
  end

  def place_bet(bet)
    self.pot -= bet
    return bet
  end

  def fold
    hand
  end

  def reveal_hand
  end


end

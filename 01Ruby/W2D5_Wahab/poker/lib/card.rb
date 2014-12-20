class Card
  attr_accessor :suit, :value

  SUITS = [:club, :spade, :heart, :diamond]
  VALUES = ([:ace, :king, :queen, :jack] + 10.downto(2).to_a).reverse

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

  def self.rankings
    rankings = {}
    VALUES.each_with_index { |value, i| rankings[value] = i}
    rankings
  end

  def initialize(value, suit)
    @suit, @value = suit, value
  end

  def inspect
    "#{value} of #{suit}s"
  end

end

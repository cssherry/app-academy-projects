require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    until hand.points >= 17
      hand.hit(deck)
    end
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    winners = @bets.select { |player| player.hand.beats?(hand) }
    winners.each do |player, value|
      player.pay_winnings(value * 2) # This is a strange way to pay out people... technically should be paying out total pot divided among each winner right?
    end
    @bets = {}
  end
end

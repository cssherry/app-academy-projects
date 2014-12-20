require 'rspec'
require 'player'

describe Player do

  let(:player_hand) do Hand.new([
    Card.new(9, :spade),
    Card.new(8, :diamond),
    Card.new(7, :spade),
    Card.new(6, :heart),
    Card.new(5, :club),
    ])
  end

  let(:player_hand_clone) do Hand.new([
    Card.new(9, :spade),
    Card.new(8, :diamond),
    Card.new(7, :spade),
    Card.new(6, :heart),
    Card.new(5, :club),
    ])
  end

  subject(:player) { Player.new(player_hand, 1000, Deck.new) }
#  let(:discarder) { double("discarder", :parse_input => [9, :spade], :hand => player_hand, :done_discarding => true) }

  context "when discarding" do

    it "should lose the discarded cards" do
      allow(player).to receive_messages(:parse_input => [9, :spade], :done_discarding? => true)
      player.discard
      expect(player.hand).to_not eql(player_hand_clone)
    end

  end

  context 'when playing' do
    it 'should be able to place bets' do
      player.place_bet(50)
      expect(player.pot).to eql(950)
    end

    it 'should be able to raise bets' do
      player.place_bet(50)
      expect(player.pot).to eql(950)
    end
  end

end

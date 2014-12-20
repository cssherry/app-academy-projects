require 'rspec'
require 'hanoi'

describe TowersOfHanoi do

  let (:player) { double("player", :input => "0 2") }
  subject { TowersOfHanoi.new(player) }

  describe 'initializes with new piles' do

    it "should create three arrays" do
      expect(subject.piles.length).to eql(3)
    end

    it "first array should have discs" do
      expect(subject.piles[0]).to eql([3, 2, 1])
    end
  end

  describe 'users can play the game' do

    it 'prompt and store user input for start and end point' do
      expect(player).to receive(:input).and_return("0 2")
      expect(subject.input).to eql([0,2])
    end

    it 'moves blocks according to user prompt' do
      subject.move([0,2])
      expect(subject.piles).to eq([[3,2], [], [1]])
    end

    it 'does not move larger block onto smaller block' do
      subject.piles = [[3,2], [], [1]]
      expect(subject.move([0,2])).to be(false)
    end

    it 'returns won! if blocks are in order on last pile' do
      subject.piles = [[], [], [3,2,1]]
      expect(subject.won?).to be(true)
    end
  end

  describe 'renders game properly' do
    it 'renders initial piles properly' do
      expect(subject.render).to eq("1  \n2  \n3  ")
    end
    it 'renders mid-game piles properly' do
      subject.piles = [[3,2], [], [1]]
      expect(subject.render).to eq("   \n2  \n3 1")
    end


  end

end


# it 'should recieve board'

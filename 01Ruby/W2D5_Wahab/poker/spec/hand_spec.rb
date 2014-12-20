require 'rspec'
require 'hand'

describe Hand do

  let(:straight_flush) do Hand.new([
    Card.new(:jack, :club),
    Card.new(10, :club),
    Card.new(9, :club),
    Card.new(8, :club),
    Card.new(7, :club),
    ])
  end

  let(:straight_flush_lose) do Hand.new([
    Card.new(10, :club),
    Card.new(6, :club),
    Card.new(9, :club),
    Card.new(8, :club),
    Card.new(7, :club),
    ])
  end

  let(:full_house) do Hand.new([
    Card.new(5, :spade),
    Card.new(5, :heart),
    Card.new(5, :diamond),
    Card.new(8, :spade),
    Card.new(8, :heart),
    ])
  end

  let(:straight) do Hand.new([
    Card.new(9, :spade),
    Card.new(8, :diamond),
    Card.new(7, :spade),
    Card.new(6, :heart),
    Card.new(5, :club),
    ])
  end

  let (:one_pair_lose) do Hand.new([
    Card.new(2, :diamond),
    Card.new(2, :heart),
    Card.new(:queen, :heart),
    Card.new(6, :heart),
    Card.new(5, :club),
    ])
  end

  let (:one_pair) do Hand.new([
    Card.new(4, :diamond),
    Card.new(4, :heart),
    Card.new(:queen, :heart),
    Card.new(6, :heart),
    Card.new(5, :club),
    ])
  end


  context "comparing" do

    it "should say the higher hand wins in case of a draw" do
      expect(straight_flush.beats?(straight_flush_lose)).to be true
      expect(one_pair.beats?(one_pair_lose)).to be true
    end

    it "should say a straight flush beats every hand" do
      expect(straight_flush.beats?(full_house)).to be true
      expect(straight_flush.beats?(straight)).to be true
      expect(straight_flush.beats?(one_pair)).to be true
    end

    it 'should say full house beats straight and one pair' do
      expect(full_house.beats?(straight_flush)).to be false
      expect(full_house.beats?(straight)).to be true
      expect(full_house.beats?(one_pair)).to be true
    end

    it 'should say straight beats one pair' do
      expect(straight.beats?(straight_flush)).to be false
      expect(straight.beats?(full_house)).to be false
      expect(straight.beats?(one_pair)).to be true
    end

    it 'should say one pair loses to straight' do
      expect(one_pair.beats?(straight_flush)).to be false
      expect(one_pair.beats?(full_house)).to be false
      expect(one_pair.beats?(straight)).to be false
    end

  end





end

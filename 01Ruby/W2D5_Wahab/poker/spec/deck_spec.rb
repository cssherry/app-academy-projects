require 'rspec'
require 'deck'

describe Deck do

  it "should start with a 52 card deck" do
    expect(subject.cards.length).to eql(52)
  end

  it "should allow shuffling of cards" do
    default_deck = subject.cards
    subject.shuffle
    expect(subject.cards).to_not eql(default_deck)
  end

  context "drawing from deck" do
    it "should allow drawing from the top of the deck" do
      default_deck = subject.cards
      expect(subject.draw(1)).to eql([default_deck.last])
    end

    it "should allow drawing multiple cards" do
      default_deck = subject.cards
      expect(subject.draw(3)).to eql([default_deck[-1], default_deck[-2], default_deck[-3]])
    end

    it 'should remove cards from the deck' do
      subject.draw(3)
      expect(subject.cards.length).to eql(49)
    end
  end

end

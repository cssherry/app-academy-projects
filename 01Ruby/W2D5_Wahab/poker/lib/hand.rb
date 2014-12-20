require_relative('deck')

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def suits
    numbers = Hash.new {|h, k| h[k] = []}
    cards.map {|card| numbers[card.value] << card.suit}
    numbers
  end

  def values
    cards.collect {|card| card.value}
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    values.any? {|val| values.count(val) == 4}
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def flush?
    cards.all? { |card| card.suit == cards[0].suit }
  end

  def straight?
    rankings = cards.collect {|card| Card.rankings[card.value]}
    rankings.sort!
    rankings == (rankings.first .. rankings.last).to_a
  end

  def three_of_a_kind?
    values.any? {|val| values.count(val) == 3}
  end

  def two_pairs?
    num_paired = 0
    values.each {|val| num_paired += 1 if values.count(val) == 2}
    num_paired == 4
  end

  def one_pair?
    values.any? {|val| values.count(val) == 2}
  end

  def high_card(cards)
    cards.min_by { |card| card.class.values.index(card.value) }
  end

  def relevant_cards(number_matching)
    cards.select {|card| values.count(card.value) == number_matching }
  end


  def beats?(other_hand)
    hands = [:straight_flush?, :four_of_a_kind?, :full_house?, :flush?, :straight?,
    :three_of_a_kind?, :two_pairs?, :one_pair?]
    my_select = [cards, relevant_cards(4), cards, cards, cards,
      relevant_cards(3), relevant_cards(2), relevant_cards(2)]
    other_select = [other_hand.cards, other_hand.relevant_cards(4), other_hand.cards, other_hand.cards, other_hand.cards,
      other_hand.relevant_cards(3), other_hand.relevant_cards(2), other_hand.relevant_cards(2)]

    beats = nil
    i = 0
    while beats.nil? && i < hands.length
      hand = hands[i]
      beats = check_hand(hand, other_hand, my_select[i], other_select[i])
      i += 1
    end
    beats = high_card(cards) > high_card(other_hand.cards) ? true : false if beats.nil?
    beats
  end

  def check_hand(comparator, other_hand, my_select, other_select)
    if self.send(comparator) || other_hand.send(comparator)
      if self.send(comparator) && other_hand.send(comparator)
        Card.rankings[high_card(my_select).value] > Card.rankings[high_card(other_select).value] ? true : false
      else
        self.send(comparator) ? true : false
      end
    end
  end

end

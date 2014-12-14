def win(hand1, hand2)
  dictionary = Hash["Paper", "Rock", "Rock", "Scissors", "Scissors", "Paper"]

  if dictionary[hand1] == hand2
    return "#{hand2}, Win"
  elsif hand1 == hand2
    return "#{hand2}, Draw"
  else
    return "#{hand2}, Lose"
  end
end

def rps(hand1)
  options = %w[Rock Paper Scissors]

  hand2 = options.shuffle[0]

  win(hand1, hand2)
end

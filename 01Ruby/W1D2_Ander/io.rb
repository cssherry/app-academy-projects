def guessing_game
  number = rand(1..100)
  p "Cheat number: #{number}"
  human_number = nil

  while number != human_number
    puts "What is your guess?"
    human_number = gets.chomp.to_i
    puts "Too low!" if human_number < number
    puts "Too high!" if human_number > number
    puts "You guessed it!" if human_number == number
  end
end

#guessing_game

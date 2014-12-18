require_relative("chess/board.rb")
require 'yaml'

class GameSaved < ArgumentError
end

class Game
  attr_accessor :board, :player1, :player2, :current_player

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def play
    game_over = false
    until game_over
      @current_player = player1
      board.render
      game_over = turn("white")
      break unless game_over
      @current_player = player2
      board.render
      game_over = turn("black")
      puts
    end
    board.render
    puts "CHECKMATE. #{player1} wins!"
  end

  def turn(color)
    begin
      puts "Which position do you want to move from? Or 's' to save the game. "
      start_position = gets.chomp
      start_position == "s" ? save_game : start_position = parse_answer(start_position)

      puts "Which position do you want to move to? Or 's' to save the game. "
      end_position = gets.chomp
      end_position == "s" ? save_game : end_position = parse_answer(end_position)
      board.move(start_position, end_position, color)
    rescue WrongStartPositionError => s
      puts "#{s}: Enter a correct start position"
      retry
    rescue WrongEndPositionError => e
      puts "#{e}: Enter a correct end position"
      retry
    rescue GameSaved => g
      puts "#{e}: Game saved!"
      retry
    rescue InCheckError => c
      puts "#{c}: You are still in check"
      retry
    end
    board.checkmate?(color)

  end

  def save_game
    puts "Filename?"
    filename = gets.chomp
    File.open("saved_games/#{filename}.yml", "w") { |f| f.puts self.to_yaml }
    raise GameSaved
  end


  def parse_answer(string)
    next_move = string.split(",")
    next_move.collect { |num| num.to_i }
  end

end

puts "Do you want to start a new game or load an old one? (n/l)"
load = gets.chomp.downcase
if load == "l"
  begin
    puts "Filename?"
    filename = gets.chomp
    file = YAML::load_file("saved_games/#{filename}.yml")
    file.play
  rescue Errno::ENOENT => e
    puts "#{e}: Wrong File Name"
    retry
  end
else
  puts "What is player 1's name?"
  player1 = gets.chomp.capitalize
  puts "What is player 2's name?"
  player2 = gets.chomp.capitalize
  game = Game.new(player1, player2)
  game.play
end

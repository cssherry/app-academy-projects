require_relative('checkers/board.rb')
require 'yaml'

class WrongNumberInput < StandardError
end

class Chess
  attr_accessor :board, :player1, :player2, :current_player

  def initialize(player1, player2, size)
    @board = Board.new(size)
    @player1, @player2 = {player1 => 'red'}, {player2 => 'black'}
    @current_player = @player1
  end

  def play
    until win?
      board.render
      turn
      switch_player
    end
    switch_player
    puts "Congratulations #{current_player.keys.first}! You win. "
  end

  def turn
    puts "#{current_player.keys.first}, you're playing #{current_player.values.first}. \nEnter a sequence of moves you want to make. Include your start position. Separate with spaces."
    puts "You can enter 's' to save the game. Enter 'e' to exit"
    begin
      input = gets.chomp.downcase
      if input == 's'
        save_game
      elsif input == 'e'
        exit
      else
        moves_array = parse_answer(input)
        start_pos = moves_array[0]
        end_pos = moves_array.last
        if board[start_pos].color == current_player.values.first
          a = board[start_pos].perform_moves!(moves_array)
          byebug
          maybe_promote(end_pos) unless a == false
          raise WrongEndPosition if a == false
        else
          raise WrongTeam
        end
      end
      rescue WrongEndPosition => w
        puts "#{w}: Try another end position"
        retry
      rescue NilStartPosition => n
        puts "#{n}: Try another start position"
        retry
      rescue WrongTeam => t
        puts "#{t}: Try another start position"
        retry
      rescue TypeError => t
        puts "#{t}: Try another start position"
        retry
      rescue WrongNumberInput => t
        puts "#{t}: Try another start position"
        retry
    end
  end

  def parse_answer(input)
    moves = input.split(" ")
    moves_array = moves.collect do | move |
      coordinates = move.split(",")
      coordinates.collect(&:to_i)
    end
    fail WrongNumberInput if moves_array.length < 2
    moves_array
  end

  def switch_player
    switch_order = Hash[@player1, @player2, @player2, @player1]
    @current_player = switch_order[@current_player]
  end

  def win?
    other_team = select_team(current_player.values.first)
    other_team.collect { |piece| piece.move_diff }.empty? ? true : false
  end

  def select_team(current_color)
    board.grid.flatten.compact.select { |piece| piece.color == current_color}
  end

  def maybe_promote(end_pos)
    x, y = end_pos
    if board[end_pos].color == 'black'
      board[end_pos].king = true if x == 0
    elsif board[end_pos].color == 'red'
      board[end_pos].king = true if x == (board.grid.length - 1)
    end
  end

  def save_game
    puts 'What would you like to save the game as?'
    filename = gets.chomp.downcase
    File.open("01Ruby/W2D4/saved_games/#{filename}.yml", 'w') { |f| f.puts self.to_yaml}
    puts "Saved!"
    rescue Errno::ENOENT => s
      puts "#{s}: Enter a legitimate filename"
      retry
  end
end

puts "Do you want to start a new game or load an old one? (n/l)"
game_state = gets.chomp.downcase
if game_state == 'l'
  begin
    puts "What's the filename?"
    filename = gets.chomp
    saved_game = YAML.load_file("01Ruby/W2D4/saved_games/#{filename}.yml")
    saved_game.play
  rescue Errno::ENOENT => e
    puts "#{e}: Wrong File Name"
    retry
  end
else
  begin
    puts "What size board do you want? American checkers typically starts with 8 positions. "
    size = gets.chomp.to_i
  raise ArgumentError.new if size < 5
    puts "What's player 1's name?"
    player1 = gets.chomp.capitalize
    puts "What's player 2's name?"
    player2 = gets.chomp.capitalize
    game = Chess.new(player1, player2, size)
    puts "Note: This game requires you to capture if you have the option to capture. You can only capture in your direction until you become king. "
    game.play
  rescue ArgumentError
    puts "Enter a number over 5"
    retry
  end
end

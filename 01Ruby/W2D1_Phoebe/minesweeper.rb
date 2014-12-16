require 'yaml'
require 'colorize'


class Game
  attr_accessor :board, :leaderboard, :time_elapsed, :start_time

  def initialize
    @time_elapsed = 0
    @start_time = Time.new
    @leaderboard = YAML::load_file("leaderboard.yml")
    puts "New game(n) or load file(l)? or leaderboard?(b)"
    answer = gets.chomp.downcase
    case answer
    when "n"
      @board = Board.new
      @board.create_board
      run
    when "l"
      load_game
    when "b"
      render_leaderboard
    end
  end

  def run
    start_time = Time.new
    @board.render
    until board.board.all? { |row| row.all? {|tile| tile.revealed? || tile.mine?} }
      turn
    end
    end_time = Time.new
    puts "You won!"
    total_time = end_time.to_i - start_time.to_i + time_elapsed.to_i
    total_time_min = total_time / 60
    total_time_seconds = total_time % 60
    puts "You took #{total_time_min} minutes and #{total_time_seconds} seconds"
    puts "Would you like to get added to the leaderboard? (y/n)"
    case answer = gets.chomp.downcase
    when "y"
      puts "What is your name?"
      name = gets.chomp.capitalize
      user_array = [name, total_time]
      leaderboard << user_array
      leaderboard.sort! { |leader1, leader2| leader1[1] <=> leader2[1]}
      File.open("leaderboard.yml", "w") { |f| f.write leaderboard.to_yaml }
      puts " Saved!"
      render_leaderboard
    when "n"
      game_over
    end
  end

  def turn
    puts "Position?"
    pos = gets.chomp.split(",")
    pos.map! {|number| number.to_i}
    x, y = pos
    puts "Flag(f) or reveal(r) or save file(s)?"
    answer = gets.chomp.downcase
    case answer
    when 'f'
      @board.board[x][y].flagged ? @board.board[x][y].flagged = false : @board.board[x][y].flagged = true
    when 'r'
      game_over if @board.board[x][y].mine?
      @board.board[x][y].reveal
    when 's'
      save_game
    end
    @board.render
  end

  def game_over
    puts "Game over!"
    puts "Play again? (y/n)"
    answer = gets.chomp.downcase
    case answer
    when 'y'
      Game.new.run
    when 'n'
      exit
    end
  end

  def render_leaderboard
    puts "* * LEADERS * *"
    puts "rank   time            name "
    leaderboard.each_with_index do |entry, rank|
      min = entry[1] / 60
      seconds = entry[1] % 60
      puts "#{rank + 1}   |   #{min} min #{seconds} sec | #{entry[0]}"
    end
    puts "press enter to return to game"
    Game.new if gets
  end

  def save_game
    puts "Filename?"
    filename = gets.chomp
    end_time = Time.new
    @time_elapsed = end_time - start_time
    File.open("saved_games/#{filename}.yml", "w") { |f| f.puts self.to_yaml }
    exit
  end

  def load_game
    puts "Filename?"
    filename = gets.chomp
    file = YAML::load_file("saved_games/#{filename}.yml")
    file.run
  end

end

class Board
  attr_accessor :board
  attr_reader :number_mines

  def initialize
    @board = Array.new(9){Array.new}
    @number_mines = 10
  end

  def create_board
    @board.each_with_index do | row, index |
      (0..8).each {|column| row << Tile.new([index, column], false, self)}
    end
    create_mines
    @board
  end

  def []=(x,y)
    board[x][y]
  end

  def create_mines
    mines_position = []
    while mines_position.size < number_mines
      x, y = rand(8), rand(8)
      unless mines_position.include?([x, y])
        mines_position.push([x, y])
        board[x][y].mine = true
      end
    end
  end


  def render
    puts "    0   1   2   3   4   5   6   7   8".green
    i = 0
    board.each do |row|
      new_row = row.map do |spot|
        if spot.revealed?
          if spot.neighbor_mine_count == 0
            '_'.green
          else
            "#{spot.neighbor_mine_count}".red
          end
        elsif spot.flagged?
          'F'.yellow
        else
          '*'
        end
      end
      puts "#{i}".green + " | #{new_row.join(" | ")}"
      puts "-------------------------------------"
      i += 1
    end
  end

end

class Tile
  attr_accessor :position, :mine, :board, :flagged, :revealed

  def initialize(position, mine, board)
    @position = position
    @board = board
    @mine = mine
    @flagged = false
    @revealed = false
  end

  def neighbors
    x, y = @position
    neighbor_coordinates = [
      [x + 1, y],
      [x + 1, y + 1],
      [x + 1, y - 1],
      [x, y + 1],
      [x, y - 1],
      [x - 1, y],
      [x - 1, y + 1],
      [x - 1, y -1]
    ].select { |pos| pos.none? {|num| num < 0 || num > 8} }

    neighbors = neighbor_coordinates.map do |neighbor|
      x, y = neighbor
      @board.board[x][y]
    end
  end

  def neighbor_mine_count
    count = 0
    neighbors.each do |neighbor|
      x, y = neighbor.position
      count += 1 if @board.board[x][y].mine?
    end
    count
  end

  def reveal
    return if revealed #have to use this to prevent stack overflow

    if !revealed? || !flagged?
      @revealed = true
      if neighbor_mine_count == 0
        neighbors.each do |neighbor|
          neighbor.reveal
        end
        #Don't need this! Unneccessary
      # elsif neighbor_mine_count > 0
      #   neighbors.each do |neighbor|
      #     return if neighbor.mine?
      #     neighbor.revealed = true unless neighbor.mine?
      #     neighbor.reveal if neighbor.neighbor_mine_count == 0
      #   end
      end
    end
  end

  def mine?
    return mine
  end

  def flagged?
    return flagged
  end

  def revealed?
    return revealed
  end


end

game = Game.new

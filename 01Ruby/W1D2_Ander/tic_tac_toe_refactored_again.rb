class Game
  attr_accessor :player_1, :player_2, :board, :current_player

  def initialize(player_1, player_2 = ComputerPlayer.new)
    @board = Board.new
    @player_1 = HumanPlayer.new(player_1)
    @player_2 = ComputerPlayer.new
    @current_player = self.player_1
  end

  def play

    until board.over?

      position = current_player.desired_position
      until board.empty?(position)
        break if board.over?
        puts "Pick a different spot!" if current_player.class == HumanPlayer
        position = current_player.desired_position
      end

      end_turn(position, @current_player)
    end

    puts "Would you like to play again? [Y/N]"
    answer = gets.chomp
    if answer == "Y"
      @board = Board.new
      play
    end
  end

  def end_turn(position, now_playing)
    player_hash = Hash[player_1, player_2, player_2, player_1]

    board.over?
    board.place_mark(position, now_playing.mark)
    board.print_board
    @current_player = player_hash[now_playing]
  end

end

class Board < Game
  attr_accessor :board, :winning_positions

  def initialize
    @board = Array.new(3) { [" "] * 3 }
    @winning_positions = [
      [[0, 0], [1,0], [2,0]],
      [[0, 1], [1,1], [2,1]],
      [[0, 2], [1,2], [2,2]],
      [[0, 0], [0,1], [0,2]],
      [[1, 0], [1,1], [1,2]],
      [[2, 0], [2,1], [2,2]],
      [[0, 0], [1,1], [2,2]],
      [[2, 0], [1,1], [0,2]]
    ]
  end

  def print_board
    board.each { |row| p row }
    puts
  end

  def over?
    if board.count("X") + board.count("O") == 9 || won?("X") || won?("O")
      puts "SO MUCH OVARREERRR"
      return true
    end
    false
  end

  def won?(mark)
    win = false
    winning_positions.each do |three_in_a_row|
      if three_in_a_row.all? { |position| read_mark(position) == mark }
        win = true
        winner(mark)
      end
    end
    win
  end

  def winner(mark)
    if @player_1.mark == mark
      puts "Congratulations! #{@player_1.name}"
    end
  end

  def empty?(pos)
    x, y = pos
    return true if board[x][y] == " "
    false
  end

  def place_mark(pos, mark)
    if empty?(pos)
      x, y = pos
      board[x][y] = mark
    end
  end

  def read_mark(pos)
    x, y = pos
    board[x][y]
  end
end

class HumanPlayer < Game
  attr_reader :mark, :name

  def initialize(name)
    @mark = "X"
    @name = name
  end

  def desired_position
    puts "Where would you like to put an X?"
    position = gets.chomp
    position.split(",").map { |char| char.chomp.to_i }
  end
end

class ComputerPlayer
  attr_reader :mark

  def initialize
    @mark = "O"
  end

  def desired_position
    d = [rand(0..2), rand(0..2)]
  end
end

puts "Enter your name"
player1 = gets.chomp
b = Game.new(player1)
b.play

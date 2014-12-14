class Board
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
  end

  def won?(mark)
    win = false
    winning_positions.each do |three_in_a_row|
      win = true if three_in_a_row.all? { |position| read_mark(position) == mark }
    end
    win
  end

  def winner
    if won?("X")
      puts "Congratulations!"
    elsif won?("O")
      puts "Computer won"
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

class Game
  attr_accessor :human, :board, :computer

  def initialize
    @board = Board.new
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def play

    until board.winner
      position = human.desired_position
      until board.empty?(position)
        puts "Pick a different spot!"
        position = human.desired_position
      end
      end_turn(position, "X")
      puts
      position = computer.pick_mark # no input because random generated
      until board.empty?(position)
        mark = computer.pick_mark
      end
      end_turn(position, "O")

    end
    # Would you like to play again?
  end

  def end_turn(position, mark)
    board.place_mark(position, mark)
    board.print_board
    board.winner
  end

end

class HumanPlayer < Game
  attr_reader :mark

  def initialize
    @mark = "X"
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

  def pick_mark
    [rand(0..2), rand(0..2)]
  end
end

b = Game.new
b.play

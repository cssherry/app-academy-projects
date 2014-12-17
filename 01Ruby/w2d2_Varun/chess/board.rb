require_relative("pieces.rb")

class Board
  GRID = Array.new(8){Array.new(8)}
  attr_accessor :board

  def initialize
    @board = GRID
    populate_board
  end

  def populate_board
    create_pawn_row(6, 'white')
    create_army_row(7, 'white')
    create_pawn_row(1, 'black')
    create_army_row(0, 'black')
  end

  def create_pawn_row(row, color)
    8.times do |n|
      board[row][n] = Pawn.new([row, n], self, color)
    end
  end

  def create_army_row(row, color)
    board[row][0] = Rook.new([row, 0], self, color)
    board[row][7] = Rook.new([row, 7], self, color)
    board[row][1] = Knight.new([row, 1], self, color)
    board[row][6] = Knight.new([row, 6], self, color)
    board[row][2] = Bishop.new([row, 2], self, color)
    board[row][5] = Bishop.new([row, 5], self, color)
    board[row][3] = Queen.new([row, 3], self, color)
    board[row][4] = King.new([row, 4], self, color)
  end

  def [](value) # [](x, y) # board[[x, y]]
    x,y = value
    board[x][y]
  end

  def []=(pos, value)
    x,y = pos
    board[x][y] = value
  end

end

class Piece
  attr_accessor :position, :board, :color
  attr_reader :code

  ROOK_STEP = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  BISHOP_STEP = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  KNIGHT_STEP = [[-2, 1], [-2, -1], [2, 1], [2, -1], [1, -2], [1, 2], [-1, 2], [-1,-2]]

  def initialize(position, board, color)
    @position, @board, @color, @code  = position, board, color, nil
  end

  def inspect
    {code: @code, position: @position}
  end

  def within_grid?(pos)
    x, y = pos
    if x < 0 || x > 7
      false
    elsif y < 0 || y > 7
      false
    else
      true
    end
  end

  def team_piece?(pos)
    !@board[pos].nil? && @board[pos].color == @color
  end

  def opponent_piece?(pos)
    !@board[pos].nil? && @board[pos].color != @color
  end
end

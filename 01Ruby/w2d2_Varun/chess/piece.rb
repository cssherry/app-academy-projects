class Piece
  attr_accessor :position, :board, :color
  attr_reader :code

  ROOK_STEP = [[1,0], [-1,0],[0,1], [0,-1]]
  BISHOP_STEP = [[1,1],[1,-1],[-1,1],[-1,-1]]
  KNIGHT_STEP = [[-2,1], [-2,-1], [2, 1], [2, -1], [1, -2], [1, 2], [-1, 2], [-1,-2]]

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
    @code = nil
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
    # p @board[pos]
    # p @color
    # if @board[pos] != nil
    #   if @board[pos].color != @color
    #     false
    #   else
    #     true
    #   end
    # end
  end

  def opponent_piece?(pos)
    !@board[pos].nil? && @board[pos].color != @color
  #   p @board[pos]
  #   p @color
  #   if @board[pos] != nil && @board[pos].color != @color
  #     true
  #   else
  #     false
  #   end
  # end
  end
end

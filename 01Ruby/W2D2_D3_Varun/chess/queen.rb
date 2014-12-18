class Queen < SlidingPieces
  def initialize(position, board, color)
    super
    @code = color == "white" ? "♛" : "♕"
  end

  def move_dirs
    moves(BISHOP_STEP + ROOK_STEP)
  end


end

class Queen < SlidingPieces
  def initialize(position, board, color)
    super
  end

  def move_dirs
    moves(BISHOP_STEP + ROOK_STEP)
  end


end

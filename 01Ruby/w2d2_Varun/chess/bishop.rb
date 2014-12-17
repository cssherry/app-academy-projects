class Bishop < SlidingPieces

  def initialize(position, board, color)
    super
  end

  def move_dirs
    moves(BISHOP_STEP)
  end
end

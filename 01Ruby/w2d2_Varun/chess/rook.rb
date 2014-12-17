class Rook < SlidingPieces
  def initialize(position, board, color)
    super
  end

  def move_dirs
    moves(ROOK_STEP)
  end
end

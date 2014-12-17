class Knight < SteppingPieces
  def initialize(position, board, color)
    super
  end

  def move_dirs
    moves(KNIGHT_STEP)
  end
end

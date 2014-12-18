class Knight < SteppingPieces
  def initialize(position, board, color)
    super
    @code = color == "white" ? "♞" : "♘"
  end

  def move_dirs
    moves(KNIGHT_STEP)
  end
end

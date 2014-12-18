# Create rook piece
class Rook < SlidingPieces
  def initialize(position, board, color)
    super
    @code = color == 'white' ? '♜' : '♖'
  end

  def move_dirs
    moves(ROOK_STEP)
  end
end

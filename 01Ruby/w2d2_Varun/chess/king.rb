require_relative("sliding_pieces.rb")

class King < SlidingPieces

  def initialize(position, board, color)
    super
  end

  def move_dirs
    moves(ROOK_STEP + BISHOP_STEP)
  end


end

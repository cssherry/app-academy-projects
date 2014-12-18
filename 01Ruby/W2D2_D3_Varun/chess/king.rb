require_relative("sliding_pieces.rb")

class King < SteppingPieces
  attr_accessor :position, :board, :color
  attr_reader :code

  def initialize(position, board, color)
    super
    @code = color == "white" ? "♚" : "♔"
  end

  def move_dirs
    moves(ROOK_STEP + BISHOP_STEP)
  end


end

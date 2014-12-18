class Pawn < SteppingPieces

  attr_accessor :first_turn

  MOVES = {"white" => 1, "black" => -1}

  def initialize(position, board, color)
    super
    @first_turn = true
    @code = color == "white" ? "♟" : "♙"
  end

  def move_dirs
    forward_moves(MOVES[color]) + diagonal_moves((MOVES[color]))
  end

  def forward_moves(multiplier)
    results = moves([[-1 * multiplier, 0]]).select { |move| !opponent_piece?(move) }
    if first_turn == true
      results += moves([[-2 * multiplier, 0]]).select { |move| !opponent_piece?(move) } unless results.empty?
    end
    results
  end

  def diagonal_moves(multiplier)
    moves([[-1 * multiplier, 1], [-1 * multiplier, -1]]).select { |move| opponent_piece?(move) }
  end
end

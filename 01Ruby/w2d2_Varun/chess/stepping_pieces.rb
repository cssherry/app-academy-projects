class SteppingPieces < Piece
  def initialize(position, board, color)
    super
  end

  def moves(direction_array)
    results = []
    directions_array.each do |direction|
      x, y = position[0] + direction[0], position[1] + direction[1]
      break if team_piece?(pos)
      results << [x, y]
      break if opponent_piece?(pos)
      x, y = x + direction[0], y + direction[1]
    end
    results
  end
end

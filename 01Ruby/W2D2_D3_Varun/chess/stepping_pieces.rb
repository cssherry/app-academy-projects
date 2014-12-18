class SteppingPieces < Piece
  def initialize(position, board, color)
    super
  end

  def moves(direction_array)
    results = []
    direction_array.each do |direction|
      x, y = position[0] + direction[0], position[1] + direction[1]
      pos = [x, y]
      next if !within_grid?(pos) || team_piece?(pos)
      results << [x, y]
    end
    results
  end
end

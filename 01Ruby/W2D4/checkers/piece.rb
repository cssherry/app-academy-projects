require 'byebug'

class InvalidMoveError < StandardError
  # puts "Invalid Move Sequence"
end

# Define pieces
class Piece
  attr_accessor :board, :position, :king, :symbol
  attr_reader :color

  DIAG_UP = [[-1, 1], [-1, -1]]
  DIAG_DOWN = [[1, 1], [1, -1]]

  def initialize(position, board, color)
    @position, @board, @color = position, board, color
    @king = false
    # remove @symbol variable method and just use method, remove as many states as possible
    board[position] = self # This changes all instances of the board because all the pieces point to the same instance of board
  end

  def inspect
    { position: position, color: color }
  end

  def perform_moves!(sequence_array)
    if valid_move_seq?(sequence_array)
      (sequence_array.length - 1).times do |num|
        start_pos = sequence_array[num]
        end_pos = sequence_array[num + 1]
        if move_diff[end_pos] == :perform_slide
          board.move(start_pos, end_pos, color) if num == 0
        elsif move_diff[end_pos] == :perform_jump
          board.move(start_pos, end_pos, color)
        end
      end
    else
      false
    end
  end

  def valid_move_seq?(sequence_array)
    begin
      test_board = board.copy_board
      (sequence_array.length - 1).times do |num|
        test_board.move(sequence_array[num], sequence_array[num + 1], color)
      end
    rescue WrongEndPosition => w
      false
    rescue NilStartPosition => n
      false
    rescue WrongTeam => t
      false
    end
  end

  def move!(pos)
    possible_moves = move_diff
    send(possible_moves[pos], pos)
  end

  def move_diff
    if king
      create_moves(DIAG_UP + DIAG_DOWN).delete_if
    else
      color == 'black' ? create_moves(DIAG_UP) : create_moves(DIAG_DOWN)
    end
  end

  def create_moves(directions)
    if capture_positions(directions) != {}
      pos_hash = capture_positions(directions)
      pos_hash.delete_if { | pos, _type | !board.within_board?(pos) }
    else
      pos_hash = abs_positions_from_array(directions, :perform_slide)
      pos_hash.delete_if { | pos, _type | !board.within_board?(pos) }
    end
  end

  def abs_positions_from_array(directions, type) #abs position from relative directions
    positions_hash = {}
    directions.collect do |dir|
      pos = [dir[0] + position[0], dir[1] + position[1]]
      positions_hash[pos] = type
    end
    positions_hash
  end

  def perform_slide(destination)
    board[position], board[destination] = nil, board[position]
    @position = destination
  end

  def perform_jump(destination)
    x_change = (destination[0] - position[0]) / 2
    y_change = (destination[1] - position[1]) / 2
    x1, y1 = position[0] + x_change, position[1] + y_change
    board[[x1, y1]] = nil
    board[position], board[destination] = nil, board[position]
    @position = destination
  end

  # could just used logic in perform jump to delete intermediate piece. Don't need make move step

  def capture_positions(directions) #renamed to directions
    valid_directions = directions.select do |dir|
      capturable_piece?(dir)
    end
    valid_moves = {}

    # For some reason, this array has been mutated to include other valid position. So save changed directions as new variable.
    valid_directions.each do |dir|
      direction = [dir[0] + dir[0], dir[1] + dir[1]]
      valid_moves = valid_moves.merge(abs_positions_from_array([direction], :perform_jump))
    end
    valid_moves
  end

  def capturable_piece?(direction) #rename to capturable piece
    pos = abs_positions_from_array([direction], :perform_jump).keys.first
    !board[pos].nil? && board[pos].color != color
  end

  def generate_symbol
    if king == true
      @color == 'black' ? '⬤' : '◯'
    else
      @color == 'black' ? '◉' : '◎'
    end
  end

end

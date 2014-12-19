require_relative('piece.rb')
require 'byebug'

# Define error if cannot move to new position
class WrongEndPosition < StandardError
  # puts 'Your final position is incorrect'
end

class NilStartPosition < StandardError
  # puts 'Your start position is incorrect'
end

class OutsideBoard < StandardError
  # puts "You're trying to move outside the board"
end

class WrongTeam < StandardError
  # puts "You're playing the wrong team"
end

# Colorize background
class String
  def bg_black
    "\033[40m#{self}\033[0m"
  end

  def bg_red
    "\033[41m#{self}\033[0m"
  end
end

class Board
  attr_accessor :grid, :size

  def initialize(size, populate = true)
    @size = size
    @grid = Array.new(size){ Array.new(size) }
    populate_board if populate == true
  end

  # Run at the beginning to make board
  def populate_board
    rows_of_pieces = (size - 2) / 2
    make_pieces([0, 1], 'red', rows_of_pieces, 1)
    make_pieces([size - 1, 0], 'black', rows_of_pieces, -1)
  end

  # Makes pieces based on how many columns/rows are in the board
  def make_pieces(first_position, color, rows, direction)
    switch = Hash[1, 0, 0, 1]
    start_column = first_position[1]
    start_row = first_position[0]
    num_pieces = size/2
    rows.times do |row_num|
      num_pieces.times do |col_num|
        col_num *= 2
        position = [start_row + (row_num * direction), start_column + col_num]
        Piece.new(position, self, color)
      end
      start_column = switch[start_column]
    end
  end


  # Bracket to position reader and writer methods
  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  # Define how to make  move
  def move(position_from, position_to, color)
    if valid?(position_from, position_to, color)
      self[position_from].move!(position_to)
    end
  end

  def valid?(position_from, position_to, color)
    possible_moves = self[position_from].move_diff
    possible_moves = possible_moves.keys
    raise WrongEndPosition if self[position_from].nil?
    raise WrongEndPosition unless possible_moves.include?(position_to)
    raise NilStartPosition if self[position_from].nil?
    raise WrongTeam unless self[position_from].color == color
    true
  end

  def within_board?(position)
    x, y = position
    if x >= 0 && x < size && y >= 0 && y < size
      true
    else
      false
    end
  end

  # copies board
  def copy_board
    new_board = Board.new(size, false)
    grid.each_with_index do |row, x|
      size.times do |y|
        unless row[y].nil?
          row[y].class.new([x,y], new_board, row[y].color)
        end
      end
    end
    new_board
  end

  # All methods to make board look pretty
  def render
    index
    grid.each_with_index do |row, i|
      join(row, i)
    end
    index
  end

  def index
    print '   '
    size.times { |y| print"#{y}  "}
    puts
  end

  def join(row, i)
    print "#{i} "
    row.each_with_index do |element, y|
      if element.nil?
        print '   '.bg_red if (i + y).even?
        print '   '.bg_black if (i + y).odd?
      else
        print " #{element.generate_symbol} ".bg_red if (i + y).even?
        print " #{element.generate_symbol} ".bg_black if (i + y).odd?
      end
    end
    puts " #{i}"
  end
end

# b = Board.new(6)
# b.render
# b[[1,4]].perform_moves!([[1,4], [2,3], [3,2]])
# b.render
# b[[0,5]].perform_moves!([[0,5], [1,4]])
# b.render
# b[[2,3]].perform_moves!([[2,3], [3,2]])
# b.render
# # # b.move([2,5], [3,4], 'red')
# # # b.render
# b[[4,1]].perform_moves!([[4,1], [2,3], [0,5]])
# b.render

require_relative("pieces.rb")
require 'byebug'
require 'colorize'

class WrongStartPositionError < ArgumentError
end
class WrongEndPositionError < ArgumentError
end
class InCheckError < ArgumentError
end

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\033[0m" end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end

OPPOSITES = {'white' => 'black', 'black' => 'white'}

class Board
  # DO NOT USE CLASS CONSTANT OR IT WILL GET DUPLICATED AND MUTATED DURING DUP: GRID = Array.new(8){Array.new(8)}
  attr_accessor :board

  def initialize(populate = true)
    @board = Array.new(8){Array.new(8)}
    if populate
      populate_board
    end
  end

  def populate_board
    create_pawn_row(6, 'white')
    create_army_row(7, 'white')
    create_pawn_row(1, 'black')
    create_army_row(0, 'black')
  end

  def create_pawn_row(row, color)
    8.times do |n|
      board[row][n] = Pawn.new([row, n], self, color)
    end
  end

  def create_army_row(row, color)
    board[row][0] = Rook.new([row, 0], self, color)
    board[row][7] = Rook.new([row, 7], self, color)
    board[row][1] = Knight.new([row, 1], self, color)
    board[row][6] = Knight.new([row, 6], self, color)
    board[row][2] = Bishop.new([row, 2], self, color)
    board[row][5] = Bishop.new([row, 5], self, color)
    board[row][3] = Queen.new([row, 3], self, color)
    board[row][4] = King.new([row, 4], self, color)
  end

  def [](value)
    x,y = value
    board[x][y]
  end

  def []=(pos, value)
    x,y = pos
    board[x][y] = value
  end

  def move(start_position, end_position, player_color)
    x_s, y_s = start_position
    x_e, y_e = end_position

    raise WrongStartPositionError if board[x_s][y_s].nil? || board[x_s][y_s].color != player_color
    raise WrongEndPositionError unless board[x_s][y_s].move_dirs.include?(end_position)
    raise InCheckError if in_check?(start_position, end_position, player_color)

    board[x_e][y_e], board[x_s][y_s] = board[x_s][y_s], nil
    board[x_e][y_e].position = [x_e, y_e]
  end

  def in_check?(start_position, end_position, piece_color)
    temp = board_dup
    temp[start_position], temp[end_position] = temp[end_position], temp[start_position]
    temp[end_position].position = end_position

    king_pos = flatten(piece_color).select{|piece| piece.class == King}
    opponent_pos = flatten(OPPOSITES[piece_color])
    opponent_pos.any? { |piece| piece.move_dirs.include?(king_pos[0].position)}
  end

  # after moving, need to call all possible moves for each piece of the opposite color, then make the move on a dupe board, and do in check again.
  def checkmate?(piece_color)
    current_team = flatten(OPPOSITES[piece_color])
    current_team.all? do |piece|
      piece.move_dirs.all? { |position| in_check?(piece.position, position, OPPOSITES[piece_color]) }
    end
  end

  def flatten(piece_color)
    board.flatten.compact.select{|piece| piece.color == piece_color}
  end

  def board_dup
    new_board = Board.new(false)

    8.times do |x|
      8.times do |y|
        piece = board[x][y]
        unless piece.nil?
          new_board[[x,y]] = piece.class.new([x,y], new_board, piece.color)
          if piece.class == Pawn
            new_board[[x,y]].first_turn = piece.first_turn
          end
        end
      end
    end

    new_board
  end

  def render
    puts "   a  b  c  d  e  f  g  h"
    board.each_with_index do |row, i|
      print "#{8 - i} "
      row.each_with_index do |element, i2|
        if element.nil?
          if (i + i2) % 2 == 0
            print "   ".bg_red
          else
            print "   ".bg_black
          end
        else
          if (i + i2) % 2 == 0
            print " #{element.code} ".bg_red
          else
            print " #{element.code} ".bg_black
          end
        end
      end
      puts " #{8 - i}"
    end
    puts "   a  b  c  d  e  f  g  h"
  end

  def join_rows(row, offset)

  end

end

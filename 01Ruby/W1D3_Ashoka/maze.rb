
class Maze

  attr_accessor :start_index, :current_path, :grid, :end_index, :solved

  def initialize(new_maze)
    @grid = read_grid(new_maze)
    @start_index = find_pos('S')
    @end_index = find_pos('E')
    @current_path = []
    @solved = false
  end

  def find_pos(point)
    @grid.each_with_index do |row, index1|
      row.each_with_index do |cell, index2|
        return [index1, index2] if cell == point
      end
    end
  end

  def read_grid(f)
    File.readlines(f).map(&:chomp).map do |line|
      line.split('')
    end
  end

  def deep_dupe(arr)
    new_array = []
    arr.each do |item|
        new_array << item
    end
    new_array
  end

  def find_path(pos, curr_path)
    x, y = pos
    return nil if curr_path.include? pos
    curr = deep_dupe(curr_path)
    curr << pos
    return nil if grid[x][y] == '*' || grid[x][y] == 'X'
    return @current_path = curr if grid[x][y] == 'E'
    find_path([x, y + 1], curr)
    find_path([x, y - 1], curr)
    find_path([x - 1, y], curr)
    find_path([x + 1, y], curr)
  end

  def route
    find_path(@start_index, @current_path)
  end
end


maze = Maze.new('./maze1.txt')
print maze.route
print maze.current_path

class Maze
  attr_accessor :position, :maze

  def initialize(file_name)
    @maze = File.open(file_name).readlines
    @maze_start = find(@maze, "S")
    @maze_end = find(@maze, "E")
    @position = maze_start
  end

  def solve_maze
    if @position == @maze_end
      puts @maze.each { |line| puts line }
      puts "You win!"
    else
      while condition
        if @maze[@position[0]+1][@position[1]+1] != "*"
        elsif @maze[@position[0]+1][@position[1]-1] != "*"
      end
    end
  end

  def find(maze, letter)
    maze.each_with_index do |array, y|
      if x = array.index(letter)
        return [x, y]
      end
    end
  end
end

maze.each { |line| puts line }
p find(maze, "S")

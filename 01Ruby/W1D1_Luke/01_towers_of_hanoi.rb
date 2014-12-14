def game
  puts "How many disks do you want to try?"
  difficulty = gets.chomp.to_i

  while difficulty < 3
    puts "Please select a number greater than 3!"
    difficulty = gets.chomp.to_i
  end

  solution = (1..difficulty).to_a.reverse
  poles = {
    "1" => (1..difficulty).to_a.reverse,
    "2" => [],
    "3" => []
  }

  while poles["3"] != solution

    status(poles["1"], poles["2"], poles["3"])

    moving_disk = 0

    while moving_disk == 0
      puts "Where do you want to move the disk from? Say 1, 2, or 3"
      pole_from = gets.chomp
      moving_disk = poles[pole_from].pop if %w(1 2 3).include?(pole_from)
    #   case pole_from
    #   when "1"
    #     moving_disk = pole_one.pop
    #   when "2"
    #     moving_disk = pole_two.pop
    #   when "3"
    #     moving_disk = pole_three.pop
    #   else
    #     puts "Invalid selection"
    #   end
    end

    status(poles["1"], poles["2"], poles["3"])
    puts "Disk #{moving_disk} is selected"

    while moving_disk != 0
      puts "Where do you want to move the disk to? Say 1, 2, or 3"
      pole_to = gets.chomp
      pole_to_pole = poles[pole_to]
      if pole_to_pole.empty? || pole_to_pole.last > moving_disk
        pole_to_pole.push(moving_disk)
        moving_disk = 0
      end
    end

  end

  puts "You win!"
end

def status(pole_one, pole_two, pole_three)
  puts "Pole 1 has #{pole_one.join(', ')} disks. Pole 2 has #{pole_two.join(', ')} disks. Pole 3 has #{pole_three.join(', ')} disks"
end

game

# Solution
# class TowersOfHanoiGame
#   def self.disks
#     # can always make the game harder by changing max value :-)
#     (1..3).to_a.reverse
#   end
#   def self.default_stacks
#     [TowersOfHanoiGame.disks, [], []]
#   end
#   attr_reader :stacks
#   def initialize(stacks = TowersOfHanoiGame.default_stacks)
#     @stacks = stacks
#   end
#   def render
#     max_height = @stacks.map(&:count).max
#     (max_height - 1).downto(0).map do |height|
#       @stacks.map do |stack|
#         # this || trick says that if stack[height] is `nil` (that is,
#         # the stack isn't that high), print `" "` instead of `nil`,
#         # because we need a blank space.
#         stack[height] || " "
#       end.join("\t")
#     end.join("\n")
#   end
#   def display
#     puts render
#   end
#   def move(from_stack_num, to_stack_num)
#     # `values_at` is pretty sweet; check out the RubyDoc; here I use
#     # it alongside destructuring.
#     from_stack, to_stack =
#     @stacks.values_at(from_stack_num, to_stack_num)
#     raise "cannot move from empty stack" if from_stack.empty?
#     unless (to_stack.empty? || to_stack.last > from_stack.last)
#       raise "cannot move onto smaller disk"
#     end
#     to_stack.push(from_stack.pop)
#     # what should `move` return? Perhaps `nil`, since we only call
#     # `move` for its side-effect. But returning `self` is also common
#     # with side-effect methods, this let's us *chain* calls to `move`:
#     # `towers.move(1, 2).move(0, 1).move(3, 0)`.
#     self
#   end
#   def won?
#     # move everything from first stack to some other stack.
#     @stacks[0].empty? && @stacks[1..2].any?(&:empty?)
#   end
#   def run_game
#     # I wrote this last; I often write the user input last, so I can
#     # first test the game in IRB.
#     until won?
#       display
#       # this uses *array destructuring*
#       from_stack_num, to_stack_num = get_move
#       move(from_stack_num, to_stack_num)
#     end
#     puts "You did it!"
#   end
#   private
#   def get_move
#     from_stack_num = get_stack("Move from: ")
#     to_stack_num = get_stack("Move to: ")
#     # returning two things is normally done via array
#     [from_stack_num, to_stack_num]
#   end
#   def get_stack(prompt)
#     move_hash = {
#       "a" => 0,
#       "b" => 1,
#       "c" => 2
#     }
#     loop do
#       print prompt
#       stack_num = move_hash[gets.chomp]
#       return stack_num unless stack_num.nil?
#       # otherwise, try again
#       puts "Invalid move!"
#     end
#   end
# end

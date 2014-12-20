class TowersOfHanoi
  attr_accessor :piles, :player

  def initialize(player)
    @piles = [[3, 2, 1], [], []]
    @player = player
  end

  def input

    return player.input.split(" ").map { |el| el.to_i }
  end

  def move(user_input)
    move_from = user_input[0]
    move_to = user_input[1]
    return false if @piles[move_to].last != nil && @piles[move_from].last > @piles[move_to].last
    moving_disk = @piles[move_from].pop
    @piles[move_to] << moving_disk
    true
  end

  def won?
    return true if piles.last == [3,2,1]
    false
  end

  def render
    pile_str = []
    piles.each do |pile|
      str = ""
      (0..2).each do |id|
        str += ((pile[id].nil?) ? " " : pile[id].to_s)
      end
      pile_str << str
    end
    "#{pile_str[0][2]}#{pile_str[1][2]}#{pile_str[2][2]}\n" +
    "#{pile_str[0][1]}#{pile_str[1][1]}#{pile_str[2][1]}\n" +
    "#{pile_str[0][0]}#{pile_str[1][0]}#{pile_str[2][0]}"
  end


end

# class Player
#
#   def input
#   print "Please enter an input: "
#    gets.chomp
#   end
#
# end

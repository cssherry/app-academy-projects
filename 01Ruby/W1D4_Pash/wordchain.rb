require 'set'

class WordChain

  attr_accessor :dictionary

  def initialize(dictionary_file_name)
    @dictionary = File.readlines("dictionary.txt").map(:&chomp)
  end

end

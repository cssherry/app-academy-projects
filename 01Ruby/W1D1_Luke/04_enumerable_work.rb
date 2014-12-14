def times_two(array)
  array.collect { |element| element * 2}
end


class Array
  def my_each(&block)
    i = 0
    while i < self.count
      block.call(self[i])
      i += 1
    end
    self
  end

  def median
    sorted_array = self.sort
    size = self.length
    if size.even?
      return (sorted_array[size / 2] + sorted_array[size / 2 - 1]) / 2
    else
      return sorted_array[size / 2]
    end
  end
end

puts [1, 2, 6, 4, 5].median


def concatenate(array)
  array.inject("") { |result, word| result + word }
end

puts concatenate(["Yay ", "woo ", "what up"])

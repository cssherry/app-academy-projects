def is_prime?(num)
  (2...num).all? { |number| num % number != 0}
end

def primes(count)
  i = 0
  number = 2
  answer = []
  while i < count
    if is_prime?(number)
      answer << number
      i += 1
    end
    number += 1
  end
  answer
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [1] if num == 1
  new_number = factorials_rec(num - 1).last * num
  factorials_rec(num - 1) + [new_number]
end

def factorials(num)
  return [] if num == 0
  answer = [1]
  while answer.length < num
    new_factorial = answer.last * (answer.length+1)
    answer << new_factorial
  end
  return answer
end

class Array
  def dups
    answer = Hash.new { |hash, key| hash[key] = []}
    self.each_with_index do |number, i|
      answer[number] << i
    end
    answer.select do |key, value|
      value.length > 1
    end
  end
end

class String
  def symmetric_substrings
    substrings = self.split_substrings
    substrings.select do |substring|
      a = true
      i = 0
      while i < (substring.length / 2)
        a = false if substring[i] != substring[0 - 1 - i]
        i += 1
      end
      a
    end
  end

  def split_substrings
    collection = []
    (0...self.length - 1).each do |first_number|
      (first_number + 1...self.length).each do |second_number|
        collection << self[first_number..second_number]
      end
    end
    collection
  end
end

#Tons of problem with this one
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { | first_number, second_number| first_number <=> second_number}
    return [] if self.empty?
    return self if self.length == 1
    half = self.length / 2
    merge(self[0...half].merge_sort(&prc), self[half...self.length].merge_sort(&prc), &prc)
  end

  def merge(left_array, right_array, &prc)
    sorted = []
    until left_array.empty? || right_array.empty?
      if prc.call(left_array[0], right_array[0]) == 1
        sorted << right_array.shift
      else
        sorted << left_array.shift
      end
    end
    sorted + left_array + right_array
  end
end

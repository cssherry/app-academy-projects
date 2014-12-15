def is_prime?(num)
  prime = true
  (2...num).each{ |divisor| prime = false if num % divisor == 0 }
  prime
end

def primes(count)
  answers = []
  number = 2
  until count <= 0
    if is_prime?(number)
      answers << number
      count -= 1
    end
    number += 1
  end
  answers
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  if num == 1
    [1]
  else
    factorials_rec(num - 1) + [factorials(num)]
  end
end

def factorials(num)
  if num == 1
    1
  else
    num * factorials(num - 1)
  end
end

class Array
  def dups
    answer = Hash.new { |hash, key| hash[key] = []}
    self.each_with_index { |value, index| answer[value] << index}
    answer.delete_if{ |key, value| value.length <= 1 }
    answer
  end
end

class String
  def symmetric_substrings
    self.split_substrings.select! do |word|
      (0..word.length/2).all?do |index|
        word[index] == word[0-(index+1)]
      end
    end
  end

  def split_substrings
    substrings = []
    (0...self.length-1).each do |first_number|
      (first_number+1...self.length).each do |second_number|
        substrings << self[first_number..second_number]
      end
    end
    substrings
  end
end

#Tons of problem with this one
class Array

  def merge_sort(&prc)
    prc = Proc.new {|element1, element2| element1 <=> element2 } unless prc #This is how to set a default prc block
    array = self.dup
    sorted = false
    while sorted == false
      sorted = true
      array.each_with_index do |element, i|
        if i+1 < array.length && prc.call(element, array[i+1]) == 1
          array[i], array[i+1] = array[i+1], array[i]
          sorted = false
        end
      end
    end
    array
  end
end

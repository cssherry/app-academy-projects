def is_prime?(num)
  (2...num).all? {|index| num % index != 0}
end

def primes(count)
  number_primes = 0
  number_testing = 2
  answer = []
  until number_primes == count
    if is_prime?(number_testing)
      answer << number_testing
      number_primes += 1
    end
    number_testing += 1
  end
  answer
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [1] if num == 1
  number = num * factorials_rec(num - 1).last
  factorials_rec(num - 1) + [number]
end

def factorials(num)
  factorial = 1
  number = 1
  answer = []
  while number <= num
    answer << factorial
    factorial *= number + 1
    number += 1
  end
  answer
end

class Array
  def dups
    repeated_numbers = Hash.new{|hash, key| hash[key] = []}
    self.each_with_index {|number, index| repeated_numbers[number] << index}
    repeated_numbers.select { |key, value| value.length > 1}
  end
end

class String
  def symmetric_substrings
    substrings = self.split_substrings
    substrings.select do |substring|
      i = 0
      match = true
      while i < substring.length/2
        match = false if substring[i] != substring[0-(i+1)]
        i += 1
      end
      match
    end
  end

  def split_substrings
    substrings = []
    (0...self.length - 1).each do |first_number|
      (first_number + 1...self.length).each do |second_number|
        substrings += [self[first_number..second_number]]
      end
    end
    substrings
  end
end

#Tons of problem with this one
class Array
  def merge_sort(&prc)
    prc ||= Proc.new{|num1, num2| num1 <=> num2}
    return self if self.length <= 1
    array = self.dup
    half = array.length/2
    left_array = array[0...half]
    right_array = array[half..-1]
    merge(left_array.merge_sort(&prc), right_array.merge_sort(&prc), &prc)
  end

  def merge(left_array, right_array, &prc)
    sorted = []
    until left_array.empty? || right_array.empty?
      if prc.call(left_array[0], right_array[0]) == 1
        sorted << right_array.shift #Gah, SHIFT removes from beginning! pop removes from end. Was using pop... 
      else
        sorted << left_array.shift
      end
    end
    sorted + left_array + right_array
  end
end

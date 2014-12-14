#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  new_array = array.dup
  return new_array.first if new_array.length == 1
  return 0 if new_array.empty?
  new_array.pop + sum_recur(new_array)
end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  new_array = array.dup
  return false if array.empty?
  return true if new_array.pop == target
  includes?(new_array, target)
end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
  new_array = array.dup
  return 0 if new_array.empty?
  matches = 0
  if new_array.pop == target
    matches = 1
  end
  matches + num_occur(new_array, target)
end


#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  new_array = array.dup
  return false if array.length == 1 || array.length == 0
  return true if new_array.shift + new_array[0] == 12
  add_to_twelve?(new_array)
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  new_array = array.dup
  return [] if array.empty?
  return true if array.length == 1
  if new_array.shift < new_array[0]
    sorted?(new_array)
    return true
  end
  false
end


#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number)
  number_string = number.to_s
  return number if number_string.length == 1
  first = number_string[0]
  rest_number = number_string[1..-1]
  ("#{reverse(rest_number.to_i)}#{first}").to_i
end

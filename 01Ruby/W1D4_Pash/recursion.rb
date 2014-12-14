require 'byebug'

  def recursive_range(start_number, end_number)
    if end_number < start_number
      []
    elsif start_number == end_number
      [end_number]
    else
      [start_number] + recursive_range(start_number + 1, end_number)
    end
  end

  # def range(min, max)
  #   return [] if max <= min
  #   range(min, max - 1) << max - 1
  # end

def sum_of_arrays_recursive(array)
  if array.length == 1
    array[0]
  else
    array.shift + sum_of_arrays_recursive(array)
  end
end

def sum_of_arrays_iterative(array)
  sum = 0
  (0...array.length).each do |index|
    sum += array[index]
  end
  sum
end

def exponentiation_v1(num, exponent)
  if exponent == 0
    1
  else
    num * exponentiation_v1(num, exponent-1)
  end
end

# Much shorter:
# def exp1(base, power)
#   (power == 0) ? 1 : (base * exp1(base, power - 1))
# end

def exponentiation_v2(num, exponent)
  if exponent == 0
    1
  elsif exponent == 1
    num
  else
    (exponentiation_v2(num, exponent/2) * exponentiation_v2(num, exponent/2)) if exponent % 2 == 0
    num * ((exponentiation_v2(num, (exponent - 1)/2)) * (exponentiation_v2(num, (exponent - 1)/2)))
  end
end

def deep_dup(array)
  if array.class != Array
    array
  else
    copy_array = Array.new
    array.each do |element|
      copy_array << deep_dup(element)
    end
    copy_array
  end
end

# Why using tap?
# class Array
#   def deep_dup
#     # Argh! Mario and Kriti beat me with a one line version?? Must
#     # have used `inject`...
#     [].tap do |new_array|
#       self.each do |el|
#         new_array << (el.is_a?(Array) ? el.deep_dup : el)
#       end
#     end
#   end

# The renowned one-line inject version of deep_dup
# Beware inject!
# def dd_inject
#   inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.dd_inject : el) }
# end

# Beware map! The ultimate one-liner.
# def dd_map
#   map { |el| el.is_a?(Array) ? el.dd_map : el }
# end
# end

def fibonacci(n)
  if n == 1 || n == 2
    1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# def fibs_iter(n)
#   return [] if n == 0
#   return [0] if n == 1
#   fibs = [0, 1]
#   while fibs.count < n
#     fibs << fibs[-2] + fibs[-1]
#   end
#   fibs
# end
# def fibs_rec(n)
#   if n <= 2
#     [0, 1].take(n)
#   else
#     fibs = fibs_rec(n - 1)
#     fibs << fibs[-2] + fibs[-1]
#   end
# end

def binary_search(array, target)
  # array.sort!
  pivot = array.length / 2

  case array[pivot] <=> target
  when 1
    binary_search(array[0...pivot], target)
  when 0
    pivot
  when -1
    pivot + binary_search(array[pivot...array.count], target)
  end
end



# def bsearch(nums, target)
#   # nil if not found; can't find anything in an empty array
#   return nil if nums.count == 0
#   probe_index = nums.length / 2
#   case target <=> nums[probe_index]
#   when -1
#     # search in left
#     bsearch(nums.take(probe_index), target)
#   when 0
#     probe_index # found it!
#   when 1
#     # search in the right; don't forget that the right subarray starts
#     # at `probe_index + 1`, so we need to offset by that amount.
#     sub_answer = bsearch(nums.drop(probe_index + 1), target)
#     (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
#   end
#   # Note that the array size is always decreasing through each
#   # recursive call, so we'll either find the item, or eventually end
#   # up with an empty array.
# end

def make_change(change_amount, change_options)
  if change_amount != 0
    coin_used = change_options.last
    while change_amount < change_options.last
      coin_used = change_options.pop
    end
    number_coins = change_amount / coin_used
    change_left = change_amount % coin_used
    Array.new(number_coins, coin_used) + make_change(change_left, change_options)
  else
    []
  end
end

# def make_change(target, coins = [25, 10, 5, 1])
#   # Don't need any coins to make 0 cents change
#   return [] if target == 0
#   # Can't make change if all the coins are too big. This is in case
#   # the coins are so weird that there isn't a 1 cent piece.
#   return nil if coins.none? { |coin| coin <= target }
#   # Optimization: make sure coins are always sorted descending in
#   # size. We'll see why later.
#   coins = coins.sort.reverse
#   best_change = nil
#   coins.each_with_index do |coin, index|
#     # can't use this coin, it's too big
#     next if coin > target
#     # use this coin
#     remainder = target - coin
#     # Find the best way to make change with the remainder (recursive
#     # call). Why `coins.drop(index)`? This is an optimization. Because
#     # we want to avoid double counting; imagine two ways to make
#     # change for 6 cents:
#     # (1) first use a nickle, then a penny
#     # (2) first use a penny, then a nickle
#     # To avoid double counting, we should require that we use *larger
#     # coins first*. This is what `coins.drop(index)` enforces; if we
#     # use a smaller coin, we can never go back to using larger coins
#     # later.
#     best_remainder = make_change(remainder, coins.drop(index))
#     # We may not be able to make the remaining amount of change (e.g.,
#     # if coins doesn't have a 1cent piece), in which case we shouldn't
#     # use this coin.
#     next if best_remainder.nil?
#     # Otherwise, the best way to make the change **using this coin**,
#     # is the best way to make the remainder, plus this one coin.
#     this_change = [coin] + best_remainder
#     # Is this better than anything we've seen so far?
#     if (best_change.nil? || (this_change.count < best_change.count))
#       best_change = this_change
#     end
#   end
#   best_change
# end

def merge(array1, array2, merged = [])
  start1 = array1[0]
  start2 = array2[0]
  if start1 == nil
    merged = merged + array2
  elsif start2 == nil
    merged = merged + array1
  else
    if start1 < start2
      merged << array1.shift
      merge(array1, array2, merged)
    else
      merged << array2.shift
      merge(array1, array2, merged)
    end
  end
end

def merge_sort(array)
  array = array.each_slice(1).to_a unless array[0].class == Array
  if array.length == 0 || array.length == 1
    array
  else
    array.push(merge(array.shift, array.shift))
    merge_sort(array)
  end
end

def subsets(array)
  if array.length == 0
    []
  elsif array.length == 1
    [array]
  else
    last_plus_array = subsets(array[0..-2]).map{|array_previous| array_previous + [array.last]}
    subsets(array[0..-2]) + [[array.last]] + last_plus_array
  end
end


# class Array
#   def subsets
#     return [[]] if empty?
#     subs = take(count - 1).subsets
#     subs.concat(subs.map { |sub| sub + [last] })
#   end
# end

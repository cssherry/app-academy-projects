class Array
  def my_uniq
    temp_storage = []
    self.each do |e|
      temp_storage << e unless temp_storage.keys.include?(e)
    end
    temp_storage
  end

  def two_sum
    result = []
    len = self.length
    self.each_index do |i|
      for second_index in (i + 1)..(len - 1)
        first_num = self[i]
        second_num = self[second_index]
        if first_num + second_num == 0
          result.push([i, second_index])
        end
      end
    end

    result
  end
end

# Solution
# def two_sum(array)
#   pairs = []
#   array.count.times do |i1|
#     (i1 + 1).upto(array.count - 1) do |i2|
#       pairs << [i1, i2] if array[i1] + array[i2] == 0
#     end
#   end
#   pairs
# end

def my_transpose(matrix)
  results = []

  for i in 0..(matrix[0].length - 1)
    temp = []
    matrix.each do |sub_array|
      temp << sub_array[i]
    end
    results << temp
  end

  results
end

# Solution, but only does it for matrixes with the same number of rows and colums
# def my_transpose(rows)
#   dimension = rows.first.count
#   cols = Array.new(dimension) { Array.new(dimension) }
#   dimension.times do |i|
#     dimension.times do |j|
#       cols[j][i] = rows[i][j]
#     end
#   end
#   cols
# end

def stock_picker(array)
  buy_i = 0
  sell_i = 0
  most_profit = 0

  array.each_with_index do |day_value, i|
    sell_date = i + 1
    while sell_date < array.size
      if most_profit < array[sell_date] - day_value
        most_profit = array[sell_date] - day_value
        buy_i = i
        sell_i = sell_date
      end
      sell_date += 1
    end
  end

  p "You should buy #{buy_i} and sell #{sell_i}"
end

# Solutions
# def pick_stocks(prices)
#   # can always make zero dollars by not buying/selling
#   best_pair = nil
#   best_profit = 0
#   prices.each_index do |buy_date|
#     prices.each_index do |sell_date|
#       # can't sell before buy
#       next if sell_date < buy_date
#       profit = prices[sell_date] - prices[buy_date]
#       if profit > best_profit
#         # Choose best days. Greed is good.
#         best_pair, best_profit = [buy_date, sell_date], profit
#       end
#     end
#   end
#   best_pair
# end

def factors(number)
  factors = []

  (1..number / 2).each do |i|
    factors << i if number % i == 0
  end

  factors
end

#Solution
# def factors(num)
#   (1..num).select { |i| num % i == 0 }
# end

p factors(100)

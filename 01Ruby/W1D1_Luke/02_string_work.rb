def num_to_s(num, base)
  storage = ('0'..'9').to_a + ('A'..'F').to_a
  if num == 0
    return ""
  else
    return num_to_s(num / base, base) + storage[num % base]
  end
end


def caesar(string, shift)
  string.split("").inject("") do |result, letter|
    if letter.ord + shift < 123
      result += (letter.ord + shift).chr
    else
      result += (letter.ord + shift - 26).chr
    end
  end
end

p caesar("zoo", 3) # => "khoor"

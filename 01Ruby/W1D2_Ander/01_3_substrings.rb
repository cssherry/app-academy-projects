def substrings(string)
  max_length = string.length
  results = []

  while max_length >= 0

    (0..(string.length - max_length - 1)).each do |i|
      substring = string[i..i + max_length]
      results << substring unless results.include?(substring)
    end

    max_length -= 1
  end

  results
end

def subwords(string)
  substrings_words = substrings(string)
  substrings_words.select { |word| is_word?("#{ word }\n") }
end

def is_word?(word)
  dictionary = File.readlines("dictionary.txt")
  dictionary.include?(word)
end


p subwords("cats")

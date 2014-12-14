def remix(alcohol_mixer)
  alcohols, mixers = [], []

  alcohol_mixer.each do |drink|
    alcohols << drink.first
    mixers << drink.last
  end

  alcohols.shuffle!
  mixers.shuffle!

  results = []

  (0...alcohols.length).each do |i|
    results << [alcohols[i], mixers[i]]
  end

  results
end

p remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])

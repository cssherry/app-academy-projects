class Array
  def my_uniq
    results = []
    self.each { |number| results << number unless results.include?(number) }
    results
  end

  def two_sum
    pairs = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j|
        pairs << [i,j] if self[i] + self[j] == 0
      end
    end
    pairs
  end

end

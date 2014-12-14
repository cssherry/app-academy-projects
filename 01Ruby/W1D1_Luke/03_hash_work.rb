class MyHashSet
  def initialize
    @store = {}
  end

  def insert(el)
    @store[el] = true
  end

  def include?(el)
    @store.keys.include?(el)
  end

  # Alternative
  # def include?(el)
  #   store.has_key?(el)
  # end

  def delete(el)
    if include?(el)
      @store.delete(el)
      return true
    else
      return false
    end
  end

  def to_a
    @store.keys
  end

  def union(set2)
    result = self
    set2.to_a.each do |key|
      result.insert(key)
    end
    result
  end

  def intersect(set2)
    result = MyHashSet.new
    self.to_a.each do |set1_key|
      result.insert(set1_key) if set2.include?(set1_key)
    end
    result
  end

  def minus(set2)
    result = MyHashSet.new
    self.to_a.each do |set1|
      result.insert(set1) unless set2.include?(set1)
    end
    result
  end
end




my_set = MyHashSet.new

my_set.insert("a")
my_set.insert("b")

my_set2 = MyHashSet.new
my_set2.insert("a")
my_set2.insert("c")
# puts "Union: "
# puts mySet.union(mySet2).to_a
puts "minus: "
puts my_set.minus(my_set2).to_a

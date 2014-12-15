require 'rspec'
require 'assessment01-try2'

describe "#primes" do
  # `primes(num)` returns an array of the first `num` primes

  it "returns first five primes in order" do
    expect(primes(5)).to eq([2, 3, 5, 7, 11])
  end

  it "returns an empty array when asked for zero primes" do
    expect(primes(0)).to eq([])
  end
end

describe "#factorials_rec" do
  # write a **recursive** implementation of a method that returns the
  # first `n` factorial numbers.

  it "returns first factorial number" do
    expect(factorials_rec(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials_rec(2)).to eq([1, 2]) # = [1!, 2!]
  end

  it "returns many factorials numbers" do
    expect(factorials_rec(5)).to eq([1, 2, 6, 24, 120])
    # == [1!, 2!, 3!, 4!, 5!]
  end

  it "calls itself recursively" do
    # this should enforce you calling your method recursively.

    expect(self).to receive(:factorials_rec).at_least(:twice).and_call_original
    factorials_rec(6)
  end
end

describe "#factorials" do

  it "returns first factorial number" do
    expect(factorials(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials(2)).to eq([1, 2]) # = [1!, 2!]
  end

  it "returns many factorials numbers" do
    expect(factorials(5)).to eq([1, 2, 6, 24, 120])
    # == [1!, 2!, 3!, 4!, 5!]
  end

end

describe "#dups" do
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.

  it "solves a simple example" do
    expect([1, 3, 0, 1].dups).to eq({ 1 => [0, 3] })
  end

  it "finds two dups" do
    expect([1, 3, 0, 3, 1].dups).to eq({ 1 => [0, 4], 3 => [1, 3] })
  end

  it "finds multi-dups" do
    expect([1, 3, 4, 3, 0, 3].dups).to eq({ 3 => [1, 3, 5] })
  end

  it "returns {} when no dups found" do
    expect([1, 3, 4, 5].dups).to eq({})
  end
end

describe "#symmetric_substrings" do
  # Write a `String#symmetric_substrings` method that takes a returns
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  it "handles a simple example" do
    expect("aba".symmetric_substrings).to match_array(["aba"])
  end

  it "handles two substrings" do
    expect("aba1cdc".symmetric_substrings).to match_array(["aba", "cdc"])
  end

  it "handles nested substrings" do
    expect("xabax".symmetric_substrings).to match_array(["aba", "xabax"])
  end
end

describe "#merge_sort" do
  # write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but creates a new sorted array.

  it "works with an empty array" do
    expect([].merge_sort).to eq([])
  end

  it "works with an array of one item" do
    expect([1].merge_sort).to eq([1])
  end

  it "sorts numbers" do
    expect([5, 4, 3, 2, 1].merge_sort).to eq([1, 2, 3, 4, 5])
  end

  it "will use block if given" do
    reversed = [1, 2, 3, 4, 5].merge_sort do |num1, num2|
      # reverse order
      num2 <=> num1
    end
    expect(reversed).to eq([5, 4, 3, 2, 1])
  end

  it "does not modify original" do
    original = [5, 4, 3, 2, 1]
    duped_original = original.dup
    duped_original.merge_sort
    expect(duped_original).to eq(original)
  end
end

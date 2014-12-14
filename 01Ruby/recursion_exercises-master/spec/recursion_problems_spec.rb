require 'rspec'
require 'recursion_problems'

describe "#sum_recur" do
  #Problem 1: You have array of integers. Write a recursive solution to find
  #the sum of the integers.
  
  it "returns 0 if blank array" do
    expect(sum_recur([])).to eq(0)
  end

  it "returns the sum of all numbers in array" do
    expect(sum_recur([1, 3, 5, 7, 9, 2, 4, 6, 8])).to eq(45)
  end

  it "should not modify original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    sum_recur(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do
    # this should enforce you calling your method recursively.
    
    should_receive(:sum_recur).at_least(:twice).and_call_original
    sum_recur([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#includes?" do
  #Problem 2: You have array of integers. Write a recursive solution to
  #determine whether or not the array contains a specific value.

  it "returns false if target isn't found" do
    expect(includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 11)).to be(false)
  end

  it "returns true if target is found" do
    expect(includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)).to be(true)
  end

  it "should not modify original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    includes?(original, 9)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do    
    should_receive(:includes?).at_least(:twice).and_call_original
    includes?([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)
  end
end

describe "#num_occur" do
  #Problem 3: You have an unsorted array of integers. Write a recursive
  #solution to count the number of occurrences of a specific value.

  it "returns number of times the target occurs in the array" do
    expect(num_occur([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6], 5)).to eq(4)
  end

  it "returns zero if target doesn't occur" do
    expect(num_occur([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6], 13)).to eq(0)
  end

  it "should not modify original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    num_occur(original, 9)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do    
    should_receive(:num_occur).at_least(:twice).and_call_original
    num_occur([1, 3, 5, 7, 9, 2, 4, 6, 8], 9)
  end
end

describe "#add_to_twelve?" do
  #Problem 4: You have array of integers. Write a recursive solution to
  #determine whether or not two adjacent elements of the array add to 12.

  it "returns true if two adjacent numbers add to twelve" do
    expect(add_to_twelve?([1, 1, 2, 3, 4, 5, 7, 4, 5, 6, 7, 6, 5, 6])).to be(true)
  end

  it "returns false if target doesn't occur" do
    expect(add_to_twelve?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6])).to be(false)
  end

  it "should not modify original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    add_to_twelve?(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do    
    should_receive(:add_to_twelve?).at_least(:twice).and_call_original
    add_to_twelve?([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#sorted?" do
  #Problem 5: You have array of integers. Write a recursive solution to
  #determine if the array is sorted.

  it "returns true if array has only one value" do
    expect(sorted?([1])).to be(true)
  end
  
  it "returns [] if array is empty" do
    expect(sorted?([])).to eq([])
  end
  
  it "returns true if array is sorted" do
    expect(sorted?([1, 2, 3, 4, 4, 5, 6, 7])).to be(true)
  end

  it "returns false if array is not sorted" do
    expect(sorted?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6])).to be(false)
  end

  it "should not modify original array" do
    original = [1, 3, 5, 7, 9, 2, 4, 6, 8]
    sorted?(original)
    expect(original).to eq([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end

  it "calls itself recursively" do    
    should_receive(:sorted?).at_least(:twice).and_call_original
    sorted?([1, 3, 5, 7, 9, 2, 4, 6, 8])
  end
end

describe "#reverse" do
  #Problem 6: Write the code to give the value of a number after it is
  #reversed. (Don't use any #reverse methods!)

  it "returns same number if only one digit" do
    expect(reverse(1)).to eq(1)
  end

  it "returns reversed number if more than one digit" do
    expect(reverse(12345)).to eq(54321)
  end

  it "should not modify original number" do
    original = 123456
    reverse(original)
    expect(original).to eq(123456)
  end

  it "calls itself recursively" do    
    should_receive(:reverse).at_least(:twice).and_call_original
    reverse(123456)
  end
end
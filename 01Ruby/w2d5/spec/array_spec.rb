require 'rspec'
require 'array'

describe '#my_uniq' do
subject(:array){[1, 2, 1, 3, 3]}
  it "removes duplicate elements" do
    expect(array.my_uniq).to eq([1, 2, 3])
  end

  it 'should not modify the original array' do
    array.my_uniq
    expect(array).to eq([1, 2, 1, 3, 3])
  end
end

describe "#two_sum" do
  subject(:array) {[-1, 0, 2, -2, 1]}
  let(:other_array) {[-2, 0, 4, -4, 2]}


  it "finds all pairs of positions where the elements sum to zero" do
    expect(array.two_sum).to eql([[0,4], [2,3]])
  end

  # it "sorts each pair dictionary-wise" do
  #   expect(array.two_sum).to eql(other_array.two_sum)
  # end
end

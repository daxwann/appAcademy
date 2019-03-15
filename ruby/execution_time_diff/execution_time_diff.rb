require "rspec"

def my_min(arr)
  smallest = arr.first
  arr.each do |num|
    smallest = num if num < smallest
  end
  return smallest
end

# rspec

describe '#my_min' do
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  it "finds the smallest number in the list" do
    expect(my_min(list)).to eq(-5)
  end
end

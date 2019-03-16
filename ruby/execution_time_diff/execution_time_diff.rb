require "rspec"

def my_min(arr)
  smallest = arr.first
  arr.each do |num|
    smallest = num if num < smallest
  end
  return smallest
end

def largest_contiguous_subsum(arr)
  largest = current = arr.first
 
  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest 
  end

  largest
end

# rspec

describe '#my_min' do
  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

  it "finds the smallest number in the list" do
    expect(my_min(list)).to eq(-5)
  end
end

describe '#largest_contiguous_subsum' do
  list_1 = [5, 3, -7]
  list_2 = [2, 3, -6, 7, -6, 7]
  list_3 = [-5, -1, -3]

  it { expect(largest_contiguous_subsum(list_1)).to eq(8) }
  it { expect(largest_contiguous_subsum(list_2)).to eq(8) }
  it { expect(largest_contiguous_subsum(list_3)).to eq(-1) }
end

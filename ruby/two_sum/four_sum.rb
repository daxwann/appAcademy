require 'rspec'

def four_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] = 1
  end

  arr.each_with_index do |num, idx|
    three_sum = target_sum - num
    arr.each_with_index do |num2, idx2|
      next if idx2 == idx
      two_sum_target = three_sum - num2
    end
  end
end
# rspec

describe "four_sum?" do
  arr = [0, 1, 5, 7, 9, 13, 17]

  it { expect(two_sum?(arr, 42)).to eq(true) }
  it { expect(two_sum?(arr, 10)).to eq(false) }
end

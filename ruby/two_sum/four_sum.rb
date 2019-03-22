require 'rspec'

def four_sum?(arr, target_sum)
  hash = Hash.new
  two_sum_hash = Hash.new
  three_sum_hash = Hash.new

  arr.each do |num|
    # check if number is the last component of target sum
    return true if three_sum_hash[target_sum - num]
    # collect sums of three numbers
    two_sum_hash.each_key do |key|
      three_sum_hash[key + num] = true
    end
    # collect sums of two numbers
    hash.each_key do |key|
      two_sum_hash[key + num] = true
    end
    # collect first component of target sum
    hash[num] = true
  end
  false
end

# rspec

describe "four_sum?" do
  arr = [0, 1, 5, 7, 9, 13, 17]

  it { expect(four_sum?(arr, 42)).to eq(true) }
  it { expect(four_sum?(arr, 10)).to eq(false) }
end

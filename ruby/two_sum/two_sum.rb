require "rspec"
require "byebug"

# Brute force method. Time: O(n^2). Space: O(1)
def bad_two_sum?(arr, target_sum) 
  arr.each_with_index do |num, idx|
    arr.each_with_index do |num2, idx2|
      next if idx2 == idx
      return true if num2 + num == target_sum
    end
  end
  false
end

#Sorting method. Time: O(n log(n)). Space: O(n*log(n))
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  sorted.each_with_index do |num, idx|
    num2 = target_sum - num
    next if num2 == num
    return true if b_search(sorted, num2) 
  end
  false
end

def b_search(sorted_arr, target)
  return false if sorted_arr.empty?
  mid = (sorted_arr.count / 2).floor
  if target > sorted_arr[mid]
    return b_search(sorted_arr[(mid + 1)..-1], target)
  elsif target < sorted_arr[mid]
    return b_search(sorted_arr[0...mid], target)
  else
    return true
  end
end

# hash map method. Time: O(n). Space: O(n).
def two_sum?(arr, target_sum) 
  hash = Hash.new(0)
  arr.each do |num|
    hash[num] = 1 
  end 

  arr.each do |num|
    num2 = target_sum - num
    next if num2 == num
    next if hash[num2].nil?
    return true if hash[num2] == 1
  end
  false
end

# rspec

describe "two_sum?" do
  arr = [0, 1, 5, 7]
  describe "#bad_two_sum?" do
    it { expect(bad_two_sum?(arr, 6)).to eq(true) }
    it { expect(bad_two_sum?(arr, 10)).to eq(false) }
  end

  describe "#okay_two_sum?" do
    it { expect(okay_two_sum?(arr, 6)).to eq(true) }
    it { expect(okay_two_sum?(arr, 10)).to eq(false) }
  end

  describe "#two_sum?" do
    it { expect(two_sum?(arr, 6)).to eq(true) }
    it { expect(two_sum?(arr, 10)).to eq(false) }
  end

end

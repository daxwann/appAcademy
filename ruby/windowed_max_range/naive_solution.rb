require 'rspec'

#time complexity: O(n^2). space complexity: O(n^2)
def windowed_max_range(arr, window)
  current_max_range = nil
  length = arr.count
  arr.each_with_index do |num, idx|
    break if idx + window > length
    window_arr = arr[idx...(idx + window)]
    range = find_range(window_arr)
    current_max_range = range if current_max_range.nil? || \
      range > current_max_range
  end
  return current_max_range
end

def find_range(arr)
  min = arr.first
  max = arr.first
  arr.each do |num|
    if num > max
      max = num
    elsif num < min
      min = num
    end
  end
  return max - min
end

# rspec

describe '#windowed_max_range' do
  arr1 = [1, 0, 2, 5, 4, 8]
  arr2 = [1, 3, 2, 5, 4, 8]

  it { expect(windowed_max_range(arr1, 2)).to eq(4) }
  it { expect(windowed_max_range(arr1, 3)).to eq(5) }
  it { expect(windowed_max_range(arr1, 4)).to eq(6) }
  it { expect(windowed_max_range(arr2, 5)).to eq(6) }
end

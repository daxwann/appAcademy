require 'rspec'
require_relative 'min_max_stack_queue'

def max_windowed_range(arr, window)
  current_max_range = nil
  stack = MinMaxStackQueue.new
  arr.each do |num|
    stack.enqueue(num)
    if stack.size == window
      range = stack.max - stack.min
      current_max_range = range if current_max_range.nil? || \
        current_max_range < range
      stack.dequeue
    end
  end
  return current_max_range
end

# rspec

describe '#max_windowed_range' do
  arr1 = [1, 0, 2, 5, 4, 8]
  arr2 = [1, 3, 2, 5, 4, 8]

  it { expect(max_windowed_range(arr1, 2)).to eq(4) }
  it { expect(max_windowed_range(arr1, 3)).to eq(5) }
  it { expect(max_windowed_range(arr1, 4)).to eq(6) }
  it { expect(max_windowed_range(arr2, 5)).to eq(6) }
end

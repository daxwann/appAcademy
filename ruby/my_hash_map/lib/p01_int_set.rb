# In this version of a set, we can only store integers that live in 
# a predefined range. So I tell you the maximum integer I'll ever want
# to store, and you give me a set that can store it and any smaller non-negative number.

class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1, false)
  end

  # time: O(1). space: O(max)
  def insert(num)
    is_valid?(num)
    raise ArgumentError if @store[num]
    @store[num] = true
  end

  # time: O(1). space: O(max)
  def remove(num)
    is_valid?(num)
    raise ArgumentError unless @store[num]
    @store[num] = false
  end

  # time: O(1). space: O(max)
  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise ArgumentError, "Out of bounds" if num < 0 || num > @max    
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    raise ArgumentError if self[num].include?(num)
    self[num] << num
  end

  def remove(num)
    raise ArgumentError unless self[num].include?(num)
    self[num].each_with_index do |ele, i|
      self[num].slice!(i) if ele == num
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

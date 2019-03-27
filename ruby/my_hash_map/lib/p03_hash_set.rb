class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(ele)
    return if self.include?(ele)
    resize! if num_buckets == count
    self[ele] << ele
    @count += 1
  end

  def include?(ele)
    self[ele].include?(ele)
  end

  def remove(ele)
    self[ele].each_with_index do |el, i|
      self[ele].slice!(i) if el == ele
      @count -= 1
    end
  end

  private

  def [](ele)
    # optional but useful; return the bucket corresponding to `num`
    @store[ele.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_set = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_set.each do |ele|
      insert(ele)
    end
  end
end

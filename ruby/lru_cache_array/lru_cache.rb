require 'rspec'

class LRUCache
  def initialize(size = 5)
    @max_size = size
    @cache = Array.new
  end

  # time complexity O(n)
  def count
    @cache.size
  end

  # time complexity O(n)
  def add(el)
    # if element already in cache
    @cache.each_with_index do |val, idx|
      if val == el
        @cache.slice!(idx)
        @cache.push(el)
        return
      end
    end

    # remove LRU element and insert new element
    @cache.shift if count == @max_size
    @cache.push(el)
  end

  def show
    puts @cache
  end
end

# rspec

describe "LRUCache" do
  subject(:cache) { LRUCache.new(4) }
  
  it "returns number of elements currently in cache" do
    cache.add("I walk the line")
    cache.add(5)

    expect(cache.count).to eq(2)
  end

  it "shows the items in the cache, with the LRU item first" do
    cache.add("I walk the line")
    cache.add(5)
    cache.add([1,2,3])
    cache.add(5)
    cache.add(-5)
    cache.add({a: 1, b:2, c: 3})
    cache.add([1,2,3,4])
    cache.add("I walk the line")
    cache.add(:ring_of_fire)
    cache.add("I walk the line")
    cache.add({a: 1, b: 2, c: 3})

    expect(STDOUT).to receive(:puts).with([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]) 
    cache.show
  end
end

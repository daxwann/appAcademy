require "rspec"
require "byebug"

class Octopus
  def sluggish_find(fishes)
    fishes.each_with_index do |fish, idx|
      len = fish.length
      longest = true
      fishes.each_with_index do |fish2, idx2|
        next if idx2 == idx
        longest = true
        if len < fish2.length
          longest = false
          break
        end
      end
      return fish if longest == true
    end 
  end

  def dominant_find(fishes)
    sorted = fishes.merge_sort { |x, y| y.length <=> x.length }
    return sorted.first
  end
end

class Array
  def merge_sort(&prc)
    len = self.count
    prc ||= lambda { |x, y| x <=> y }
    # base case
    return self if len <= 1
    # induction
    pivot = (len / 2).floor
    left = self[0...pivot].merge_sort(&prc)
    right = self[pivot..-1].merge_sort(&prc)
    sorted = []
    until left.empty?
      if right.empty?
        sorted += left
        return sorted 
      end
      if prc.call(left.first, right.first) == -1
        sorted << left.shift
      elsif prc.call(left.first, right.first) == 1 
        sorted << right.shift
      else
        sorted << left.shift
        sorted << right.shift
      end
    end
    unless right.empty?
      sorted += right
    end
    return sorted
  end
end

# rspec

describe Octopus do
  subject(:octopus) { Octopus.new }
  fishes =  ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  describe "#sluggish_find" do
    it "Find the longest fish in O(n^2) time" do
      expect(octopus.sluggish_find(fishes)).to eq('fiiiissshhhhhh')
    end
  end

  describe "#dominant_find" do
    it "Find the longest fish in O(n log n) time" do
      expect(octopus.dominant_find(fishes)).to eq('fiiiissshhhhhh')
    end
  end
end

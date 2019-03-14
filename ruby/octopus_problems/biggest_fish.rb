require "rspec"
require "byebug"

class Octopus
  attr_reader :tiles_array, :tiles_hash

  def initialize
    @tiles_array = ["up", "right-up", "right", "right-down",  
                    "down", "left-down", "left",  "left-up" ]
    @tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right" => 2, 
      "right-down" => 3,  
      "down" => 4, 
      "left-down" => 5, 
      "left" => 6,
      "left-up" => 7 
    }
  end

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

  def clever_find(fishes)
    longest_len = 0
    longest_idx = 0
    fishes.each_with_index do |fish, idx|
      len = fish.length
      if len > longest_len
        longest_len = len
        longest_idx = idx
      end
    end
    return fishes[longest_idx]
  end

  def slow_dance(direction, tiles)
    tiles.each_with_index do |tile, idx|
      return idx if tile == direction
    end
    nil
  end

  def fast_dance(direction, tiles)
    tiles[direction] 
  end
end

class Array
  def merge_sort(&prc)
    len = self.count
    # default proc
    prc ||= lambda { |x, y| x <=> y }
    # base case
    return self if len <= 1
    # induction
    pivot = (len / 2).floor
    left = self[0...pivot].merge_sort(&prc)
    right = self[pivot..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
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

  describe "#clever_find" do
    it "Find the longest fish in O(n) time" do
      expect(octopus.clever_find(fishes)).to eq('fiiiissshhhhhh')
    end
  end

  describe "#slow_dance" do
    it "Given a tile direction, returns the tile index" do
      expect(octopus.slow_dance("up", octopus.tiles_array)).to eq(0)
    end
  end

  describe "#fast_dance" do
    it "returns the tile index in O(1) time using dictionary ADT" do
      expect(octopus.fast_dance("up", octopus.tiles_hash)).to eq(0)
    end
  end
end

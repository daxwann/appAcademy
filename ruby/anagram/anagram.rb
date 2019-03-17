require 'rspec'
require 'byebug'

# time complexity O(n!), space complexity O(n!)
def first_anagram?(word_1, word_2)
  return false unless word_1.length == word_2.length
  combos = find_combos(word_1)
  return true if combos.include?(word_2)
  false
end

# time complexity O(n^2), space complexity O(1)
def second_anagram?(word_1, word_2)
  return false unless word_1.length == word_2.length
  word_1.each_char do |char|
    idx = word_2.index(char)
    if idx
      word_2.slice!(idx) 
    else
      return false
    end
  end
  true
end

# time complexity: O(n log(n)). space complexity: O(n)
def third_anagram?(word_1, word_2)
  return true if word_1.split("").sort == word_2.split("").sort
  false
end

# time complexity: O(n). Space complexity: O(n)
def fourth_anagram?(word_1, word_2)
  hash = Hash.new
  word_1.each_char do |char|
    if hash[char]
      hash[char] += 1
    else
      hash[char] = 1
    end
  end

  word_2.each_char do |char|
    if hash[char]
      hash[char] -= 1
    else
      return false
    end
  end

  return false if hash.values.any? {|val| val != 0}
  true
end

private

# generate and store all the possible anagrams of a word
def find_combos(word)
  return [word] if word.length == 1
  combos = []
  word.each_char.with_index do |char, idx|
    word_dup = word.dup
    word_dup.slice!(idx)
    find_combos(word_dup).each do |combo|
      combos << char + combo
    end
  end
  return combos
end

# rspec

describe "#first_anagram" do
  it { expect(first_anagram?("gizmo", "sally")).to eq(false) }
  it { expect(first_anagram?("elvis", "lives")).to eq(true) }
end

describe "#second_anagram" do
  it { expect(second_anagram?("gizmo", "sally")).to eq(false) }
  it { expect(second_anagram?("elvis", "lives")).to eq(true) }
end

describe "#third_anagram" do
  it { expect(third_anagram?("gizmo", "sally")).to eq(false) }
  it { expect(third_anagram?("elvis", "lives")).to eq(true) }
end

describe "#fourth_anagram" do
  it { expect(fourth_anagram?("gizmo", "sally")).to eq(false) }
  it { expect(fourth_anagram?("elvis", "lives")).to eq(true) }
end

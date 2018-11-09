#  Write a method anagrams? that takes in two words and returns a boolean indicating 
#  whether or not the words are anagrams. Anagrams are words that contain the same 
#  characters but not necessarily in the same order. Solve this without using .sort

def anagrams?(word1, word2)
  return count_letters(word1) == count_letters(word2)
end

def count_letters(word)
  letterCount = Hash.new(0)
  word.each_char { |char| letterCount[char] += 1 }
  return letterCount
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false


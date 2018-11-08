#  Write a method consonant_cancel that takes in a sentence and returns a new sentence where 
#  every word begins with it's first vowel.

def consonant_cancel(sentence)
  words = sentence.split(" ")
  arr = words.map { |word| vowel_start(word)}
  return arr.join(" ")
end

def vowel_start(word)
  vowels = "aeiou"
  newWord = ""
  word.each_char.with_index do |char, idx|
    if vowels.include?(char)
      return word[idx..-1]
    end
  end
  return word
end

puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"

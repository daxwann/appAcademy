#  Write a method vowel_cipher that takes in a string and returns a new string 
#  where every vowel becomes the next vowel in the alphabet.

def vowel_cipher(string)
  vowels = "aeiou"
  cipher = ""
  string.each_char do |char|
    if vowels.include?(char)
      idx = vowels.index(char)
      char = vowels[(idx + 1) % 5]
    end
    cipher += char
  end
  return cipher
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap


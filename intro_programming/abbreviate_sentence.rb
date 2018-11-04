#	Write a method abbreviate_sentence that takes in a sentence string and 
#	returns a new sentence where every word longer than 4 characters has all
# 	of it's vowels removed.

def abbreviate_sentence(sent)
  new_sent = []
  arr = sent.split(" ")
  arr.each do |word|
  	if word.length > 4
      new_sent << abbreviate(word)
    else
      new_sent << word
    end
  end
  return new_sent.join(" ")
end

def abbreviate(word)
  str = ""
  vowels = "aeiou"
  word.each_char do | letter |
    if !vowels.include?(letter)
      str << letter
    end
  end
  return str
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"

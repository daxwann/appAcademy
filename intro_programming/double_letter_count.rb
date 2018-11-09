#  Write a method that takes in a string and returns the number of times that 
#  the same letter repeats twice in a row.

def double_letter_count(string)
  count = 0
  lastChar = ''
  string.each_char do |char|
    if char == lastChar
      count += 1
    end
    lastChar = char
  end
  return count
end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1

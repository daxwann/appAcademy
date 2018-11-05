#  Write a method frequent_letters that takes in a string and returns 
#  an array containing the characters that appeared more than twice in 
#  the string.

def frequent_letters(string)
  arr = []
  counter = Hash.new(0)
  string.each_char do |char|
    counter[char] += 1
  end
  counter.each do |key, value|
    if value > 2
      arr << key
    end
  end
  return arr
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts


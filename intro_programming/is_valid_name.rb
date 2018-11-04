# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
  arr = str.split(" ")
  if arr.length == 1
  	return false
  end
  arr.each do |word|
    if word[0] == word[0].upcase && word[1..-1] != word[1..-1].downcase
      return false
    end
  end
  return true
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false

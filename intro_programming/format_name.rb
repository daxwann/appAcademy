#Write a method format_name that takes in a name string and returns the name properly capitalized.

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  	arr = []
	words = str.split(" ")
    words.each { |word| arr << capitalize(word) }
  	return arr.join(" ")
end

def capitalize(word)
  str = ""
  str << word[0].upcase
  str << word[1..-1].downcase
  return str
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

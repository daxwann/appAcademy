#	Write a method to_initials that takes in a person's name 
#	string and returns a string representing their initials.

def to_initials(name)
  str = ""
  name.split(" ").each { |ele| str += ele[0] }
  return str
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

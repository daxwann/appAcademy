#  The fibonacci sequence is a sequence of numbers whose first and second elements are 1. To generate 
#  further elements of the sequence we take the sum of the previous two elements. For example the first 
#  6 fibonacci numbers are 1, 1, 2, 3, 5, 8. Write a method fibonacci that takes in a number length and 
#  returns the fibonacci sequence up to the given length.

def fibonacci(length)
  sequence = []
  prev1 = 1
  prev2 = 0
  while sequence.length < length
    if sequence.length == 1
      sequence << prev1
    else
      sequence << prev1 + prev2
      prev2 = prev1
      prev1 = sequence[-1]
    end
  end
  return sequence
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts


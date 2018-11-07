#  Write a method prime_factors that takes in a number and returns 
#  an array containing all of the prime factors of the given number.

def prime_factors(num)
  return (2...num).select { |i| num % i == 0 && is_prime?(i) }
end

def is_prime?(num)
  if num < 2
    return false
  end
  i = 2
  while i <= num / i
    if num % i == 0
      return false
    end
    i += 1
  end
  return true
end

puts is_prime?(15)
print prime_factors(24) #=> [2, 3]
puts
print prime_factors(60) #=> [2, 3, 5]
puts


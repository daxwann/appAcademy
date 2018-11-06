#  Write a method pick_primes that takes in an array of numbers and 
#  returns a new array containing only the prime numbers.

def pick_primes(numbers)
  return numbers.select { |num| is_prime?(num) }
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

print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts


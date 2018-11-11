# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.chars.each do |char|
    if ("a".."z").include?(char)
      str.delete!(char)
    end
  end
  return str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length.odd?
    return str[str.length / 2]
  else
    return str.slice(str.length / 2 - 1, 2)
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  counter = 0
  str.each_char do |char|
    if VOWELS.include?(char)
      counter += 1
    end
  end
  return counter
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  num.downto(1).each { |i| product *= i }
  return product
end

# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""
  arr.each_with_index do |ele, idx|
    if idx == 0
      str << ele.to_s
    else
      str << separator + ele.to_s
    end
  end
  return str
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  str.each_char.with_index do |char, idx|
    if idx % 2 == 0
      str[idx] = char.downcase
    else
      str[idx] = char.upcase
    end
  end
  return str
end


# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = []
  str.split(" ").each do |word|
    if word.length >= 5
     arr << word.reverse
    else
     arr << word
    end
  end
  return arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).map do |num|
    if num % 3 == 0 && num % 5 == 0
      arr << "fizzbuzz"
    elsif num % 3 == 0
      arr << "fizz"
    elsif num % 5 == 0
      arr << "buzz"
    else
      arr << num
    end
  end
  return arr
end

# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  return arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num < 2
    return false
  end
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  return true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = []
  if num < 1
    return [0]
  end
  (1..num).each do |nb|
    if num % nb == 0
      arr << nb
    end
  end
  return arr
end


# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  arr = factors(num)
  return arr.select { |nb| prime?(nb) }
end


# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  arr = prime_factors(num)
  return arr.length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  odd = arr.select { |int| int % 2 == 1 }
  even = arr.select { |int| int % 2 == 0 }
  if odd.length == 1
    return odd[0]
  else
    return even[0]
  end
end

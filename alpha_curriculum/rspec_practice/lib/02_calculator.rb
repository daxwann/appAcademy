#addition
def add(n1, n2)
  return n1 + n2
end

#subtraction
def subtract(n1, n2)
  return n1 - n2
end

#sum of array
def sum(arr)
  sum = 0
  arr.each { |num| sum += num }
  return sum
end

#multiplication
def multiply(n1, n2)
  return n1 * n2
end

#power
def power(n1, n2)
  return n1 ** n2
end

#factorial
def factorial(num)
  if num == 0
    return 0
  end
  result = 1
  num.downto(1).each { |i| result *= i }
  return result
end

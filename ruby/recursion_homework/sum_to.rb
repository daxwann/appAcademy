#Write a function sum_to(n) that uses recursion to calculate the sum from 1 to
#n (inclusive of n).

def sum_to(num)
  return nil if num < 1
  return 1 if num == 1
  return num + sum_to(num - 1)
end

# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the 
# first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should 
# be able to do this just passing a single argument for the number 
# of Fibonacci numbers requested.

def fibo_recur(n)
  arr = []
  if n == 0
    arr += [0]
  elsif n == 1
    arr += [0, 1]
  else
    arr = fibo_recur(n - 1)
    arr << arr[-2] + arr[-1]
  end
  return arr
end

def fibo_iter(n)
  arr = []
  if n == 0
    arr += [0]
  elsif n == 1
    arr += [0,1]
  else
    arr = [0,1]
    for i in (2..n)
      arr << arr[i - 2] + arr[i - 1]
    end
  end
  return arr
end
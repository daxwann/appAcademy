# Write both a recursive and iterative version of sum of an array.

def sum_recursion(arr)
  return nil if arr.empty?
  return arr.first if arr.count == 1
  arr.first + recursion(arr[1..-1])
end

def sum_iteration(arr)
  return nil if arr.empty?
  sum = 0
  for i in 0..(arr.count - 1) do
    sum += arr[i]
  end
  return sum
end

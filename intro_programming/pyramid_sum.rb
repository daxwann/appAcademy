#  Write a method pyramid_sum that takes in an array of numbers representing the 
#  base of a pyramid. The function should return a 2D array representing a complete 
#  pyramid with the given base. To construct a level of the pyramid, we take the sum 
#  of adjacent elements of the level below.
#
# For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  pyramid = [base]
  while base.length != 1
    base = adjacent_sum(base)
    pyramid.unshift(base)
  end
  return pyramid
end

def adjacent_sum(base)
  sum = []
  base.each_with_index do |num, idx|
    if base[idx + 1]
      sum << num + base[idx + 1]
    end
  end
  return sum
end



print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts


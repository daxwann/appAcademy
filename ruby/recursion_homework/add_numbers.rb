#Write a function add_numbers(nums_array) that takes in an array of Fixnums
#and returns the sum of those numbers. Write this method recursively.

def add_numbers(num_arr)
  return nil if num_arr.empty?
  return num_arr.first if num_arr.size == 1
  return num_arr.shift + add_numbers(num_arr)
end

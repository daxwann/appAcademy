#Write a function reverse(string) that takes in a string and returns it
#reversed.

def reverse(str)
  return str if str.length <= 1
  return reverse(str[1..-1]) + str[0] 
end

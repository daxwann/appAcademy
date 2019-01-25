require "byebug"

# Using recursion and the is_a? method, write an Array#deep_dup 
# method that will perform a "deep" duplication of the interior arrays.

class Array
  def deep_dup
    new_arr = Array.new()
    self.each do |ele|
      if ele.is_a? Array
        new_arr << ele.deep_dup
      else
        new_arr << ele
      end
    end
    return new_arr
  end
end
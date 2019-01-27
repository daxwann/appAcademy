class Array

  # Extend the Array class to include a method named my_each that takes a block, 
  # calls the block on every element of the array, and returns the original array. 
  # Do not use Enumerable's each method.

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    return self
  end

  # Now extend the Array class to include my_select that takes a block and returns 
  # a new array containing only elements that satisfy the block. Use your my_each method!

  def my_select(&prc)
    selection = []
    i = 0
    while i < self.length
      if prc.call(self[i])
        selection << self[i]
      end
      i += 1
    end
    return selection
  end

  # Write my_reject to take a block and return a new array excluding elements that satisfy the block.

  def my_reject(&prc)
    rejection = []
    i = 0
    while i < self.length
      if !prc.call(self[i])
        rejection << self[i]
      end
      i += 1
    end
    return rejection
  end

  # Write my_any? to return true if any elements of the array satisfy the block and my_all? to 
  # return true only if all elements satisfy the block.

  def my_any?(&prc)
    i = 0
    while i < self.length
      if prc.call(self[i]) == true
        return true
      end
      i += 1
    end
    return false
  end

  # my_flatten should return all elements of the array into a new, one-dimensional array. 
  # Hint: use recursion!

  def my_flatten
    arr = []
    i = 0
    while i < self.length
      if self[i].is_a? Array
        arr += self[i].my_flatten
      else
        arr << self[i]
      end
      i += 1
    end
    return arr
  end

  # Write my_zip to take any number of arguments. It should return a new array containing self.length 
  # elements. Each element of the new array should be an array with a length of the input arguments + 1 
  # and contain the merged elements at that index. If the size of any argument is less than self, nil is 
  # returned for that location.

  def my_zip(*arrays)
    i = 0
    zipped = []
    while i < self.length
      nest = [self[i]]
      arrays.my_each do |arr|
        if i < arr.length
          nest << arr[i]
        else
          nest << nil
        end
      end
      zipped << nest
      i += 1
    end
    return zipped
  end

  # Write a method my_rotate that returns self rotated. By default, the array should rotate by 
  # one element. If a negative value is given, the array is rotated in the opposite direction.

  def my_rotate(pos=1)
    pos.times do
      self.push(self.shift)
    end
    return self
  end

  # my_join returns a single string containing all the elements of the array, separated by the 
  # given string separator. If no separator is given, an empty string is used.

  def my_join(link="")
    str = ""
    i = 0
    while i < self.length
      if i != 0
        str += link
      end
      str += self[i].to_s
      i += 1
    end
    return str
  end

  # Write a method that returns a new array containing all the elements of the original array in 
  # reverse order.

  def my_reverse
    reverse = []
    i = self.length - 1
    while i >= 0
      reverse << self[i]
      i -= 1
    end
    return reverse
  end
end

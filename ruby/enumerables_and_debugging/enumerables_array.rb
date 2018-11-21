class Array
  #enumerables
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    return self
  end

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

  #array
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

  def my_rotate
end

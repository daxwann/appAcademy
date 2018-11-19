# Monkey-Patch Ruby's existing Array class to add your own custom methods

require 'byebug'

class Array
  def span
    if self.length == 0 || self.any? {|ele| (ele.is_a? Numeric) == false}
      return nil
    end
    self.max - self.min
  end

  def average
    if self.length == 0 || self.any? {|ele| (ele.is_a? Numeric) == false}
      return nil
    end
    self.reduce(:+).to_f / self.length
  end

  def median
    if self.length == 0 || self.any? {|ele| (ele.is_a? Numeric) == false}
      return nil
    end
    len = self.length
    sorted = self.sort
    if len % 2 == 0
      (sorted[len / 2] + sorted[len / 2 - 1]) / 2.0
    else
      sorted[len / 2]
    end
  end

  def counts
    count = Hash.new(0)
    self.each do |ele|
      count[ele] += 1
    end
    return count
  end

  def my_count(value)
    count = 0
    self.each do |ele|
      if ele == value
        count += 1
      end
    end
    return count
  end

  def my_index(value)
    self.each_with_index do |ele, i|
      if ele == value
        return i
      end
    end
    return nil
  end

  def my_uniq
    repeat = Hash.new(false)
    uniq_arr = []
    self.each do |ele|
      if repeat[ele] == false
        uniq_arr << ele
        repeat[ele] = true
      end
    end
    return uniq_arr
  end

  def my_transpose
    new_arr = []
    self.each_with_index do |ele1, i1|
      ele1.each_with_index do |ele2, i2|
        if new_arr[i2] == nil
          new_arr[i2] = [ele2]
        else
          new_arr[i2] << ele2
        end
      end
    end
    return new_arr
  end
end

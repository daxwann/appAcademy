require 'rspec'
require_relative 'my_stack'

class MinMaxStack < MyStack
  def initialize(store = [])
    super(store)
  end

  def peek
    @store.last[:value] unless self.empty?
  end

  def max
    @store.last[:max] unless self.empty?
  end

  def min
    @store.last[:min] unless self.empty?
  end

  def pop
    @store.pop[:value] unless self.empty?
  end

  # push a hash instead of value to preserve state e.g. min and max of object
  def push(val)
    @store.push({
      max: new_max(val),
      min: new_min(val),
      value: val
    })
  end

  private

  def new_max(val)
    self.empty? ? val : [self.max, val].max
  end

  def new_min(val)
    self.empty? ? val : [self.min, val].min
  end
end

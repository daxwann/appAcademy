require 'rspec'

class MyQueue
  def initialize(store = [])
    @store = store 
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def enqueue(val)
    @store.push(val)
  end

  def dequeue
    @store.shift
  end
end

class MinMaxStack
  attr_reader :max, :min
  def initialize(store = [])
    @store = store
    @max = store.empty? ? nil : store.max
    @min = store.empty? ? nil : store.min
  end
  
  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def pop
    popped = @store.pop
    @max = @store.max if popped == max
    @min = @store.min if popped == min
  end

  def push(val)
    @store.push(val)
    update_min_max(val)
  end    

  private

  def update_min_max(val)
    @max = val if @max.nil? || val > @max
    @min = val if @min.nil? || val < @min 
  end
end

class StackQueue
  def initialize
    @enq_stack = MyStack.new
    @deq_stack = MyStack.new
  end

  def size
    @enq_stack.size + @deq_stack.size
  end

  def empty?
    @enq_stack.empty? && @deq_stack.empty?
  end

  def enqueue(val)
    @enq_stack.push(val)
  end

  def dequeue
    if @deq_stack.empty?
      @deq_stack.push(@enq_stack.pop) until @enq_stack.empty?
    end

    @deq_stack.pop
  end
end

class 
# rspec

describe '#windowed_max_range' do
  arr1 = [1, 0, 2, 5, 4, 8]
  arr2 = [1, 3, 2, 5, 4, 8]

  it { expect(windowed_max_range(arr1, 2)).to eq(4) }
  it { expect(windowed_max_range(arr1, 3)).to eq(5) }
  it { expect(windowed_max_range(arr1, 4)).to eq(6) }
  it { expect(windowed_max_range(arr2, 5)).to eq(6) }
end

require 'rspec'

class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.count
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

class MyStack
  def initialize
    @store = []
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
    @store.pop
  end

  def push
    @store.push
  end    
end

class StackQueue
  def initialize
    @enqStack = Stack.new
    @deqStack = Stack.new
  end

  def enqueue(val)
    @enqStack.push(val)
  end

  def dequeue
  end
end
# rspec

describe '#windowed_max_range' do
  arr1 = [1, 0, 2, 5, 4, 8]
  arr2 = [1, 3, 2, 5, 4, 8]

  it { expect(windowed_max_range(arr1, 2)).to eq(4) }
  it { expect(windowed_max_range(arr1, 3)).to eq(5) }
  it { expect(windowed_max_range(arr1, 4)).to eq(6) }
  it { expect(windowed_max_range(arr2, 5)).to eq(6) }
end

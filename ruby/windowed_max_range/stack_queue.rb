require 'rspec'
require_relative 'my_stack'

class StackQueue
  def initialize(store = [])
    @enq_stack = MyStack.new(store)
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
    # dump values from enq_stack into deq_stack in reverse order
    # O(n) for the first dequeue. O(1) after
    if @deq_stack.empty?
      @deq_stack.push(@enq_stack.pop) until @enq_stack.empty?
    end

    @deq_stack.pop
  end
end

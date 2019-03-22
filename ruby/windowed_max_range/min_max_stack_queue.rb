require 'rspec'
require_relative 'min_max_stack'

class MinMaxStackQueue
  def initialize(store = [])
    @enq_stack = MinMaxStack.new(store)
    @deq_stack = MinMaxStack.new
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
    # dump values from enq_stack to deq_stack in reverse. refresh states.
    if @deq_stack.empty?
      @deq_stack.push(@enq_stack.pop) until @enq_stack.empty?
    end

    @deq_stack.pop
  end

  def max
    maxes = []
    maxes << @deq_stack.max unless @deq_stack.empty?
    maxes << @enq_stack.max unless @enq_stack.empty?
    maxes.max
  end

  def min
    mins = []
    mins << @deq_stack.min unless @deq_stack.empty?
    mins << @enq_stack.min unless @enq_stack.empty?
    mins.min
  end
end

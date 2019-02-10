class Queue
    def initialize
        @queue = Array.new
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop unless @queue.empty?
    end

    def peek
        @queue.last unless @queue.empty?
    end

end
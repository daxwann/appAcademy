class Stack
    def initialize
        @stack = Array.new
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack.pop unless @stack.empty?
    end

    def peek
        @stack.last unless @stack.empty?
    end
end
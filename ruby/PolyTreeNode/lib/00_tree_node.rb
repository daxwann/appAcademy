class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = Array.new
        @value = value
    end

    def children
        @children
    end

    def parent
        @parent
    end

    def value
        @value
    end

    def parent=(parent)
        unless @parent.nil?
            @parent.children -= [self]
        end
        @parent = parent
        unless @parent.nil? || @parent.children.include?(self)
            @parent.children << self
        end
    end

    def inspect
        @value.inspect
    end
end
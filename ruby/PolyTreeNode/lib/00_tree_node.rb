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
            @parent.children.reject!{|child| child == self}
        end
        @parent = parent
        unless @parent.nil? || @parent.children.include?(self)
            @parent.children << self
        end
    end

    def inspect
        @value.inspect
    end

    def add_child(child_node)
        child_node.parent = self unless child_node.nil?
    end

    def remove_child(child_node)
        return if child_node.nil?
        if self.children.include?(child_node)
            child_node.parent = nil
        else
            raise "Node not a child"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            ele = queue.shift
            return ele if ele.value == target_value
            ele.children.each {|child| queue << child}
        end
        nil
    end
end
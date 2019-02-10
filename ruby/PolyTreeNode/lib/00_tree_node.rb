module Searchable
    def dfs(target_value=nil, &prc)
        prc ||= Proc.new { |node| node.value == target_value }

        return self if prc.call(self)

        self.children.each do |child|
            search_result = child.dfs(&prc)
            return search_result unless search_result.nil?
        end
        nil
    end 

    def bfs(target_value=nil, &prc)
        prc ||= Proc.new { |node| node.value == target_value }

        queue = [self]
        until queue.empty?
            ele = queue.shift
            return ele if prc.call(ele)
            queue.concat(ele.children)
        end
        nil
    end
end

class PolyTreeNode
    include Searchable

    attr_accessor :value
    attr_reader :parent


    def initialize(value)
        @parent = nil
        @children = Array.new
        @value = value
    end

    def children
        @children.dup
    end

    def parent=(parent)
        unless self.parent.nil?
            self.parent._children.delete(self)
        end

        @parent = parent
        unless self.parent.nil? || self.parent._children.include?(self)
            self.parent._children << self
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

    protected

    def _children
        @children
    end    
end
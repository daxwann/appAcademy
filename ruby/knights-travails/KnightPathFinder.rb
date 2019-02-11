require_relative "PolyTreeNode"
require "byebug"

class KnightPathFinder

    attr_reader :root, :considered
    
    DELTAS = [
        [-1, 2],
        [1, 2],
        [-2, 1],
        [2, 1],
        [-2, -1],
        [2, -1],
        [-1, -2],
        [1, -2]
    ].freeze

    def initialize(start)
        @root = PolyTreeNode.new(start)
        @considered = Array.new(start)
    end

    def find_path(end_pos)
        queue = [self.root]
        path = Array.new
        until queue.empty?
            current = queue.shift
            return build_path(current) if current.value == end_pos
            queue.concat(self.valid_moves(current))
        end
        nil
    end

    def build_path(current)
        path = Array.new
        until current.parent.nil?
            path.unshift(current.value)
            current = current.parent
        end
        path.unshift(current.value)
        return path
    end

    def valid_moves(current_node)
        DELTAS.each do |delta|
            x, y = current_node.value
            x += delta[0]
            y += delta[1]
            next if (x < 0 || x > 7) || (y < 0 || y > 7)
            next if self.considered.include?([x,y])
            child = PolyTreeNode.new([x, y])
            current_node.add_child(child)
        end
        return current_node.children
    end
end
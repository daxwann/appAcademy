require_relative "PolyTreeNode"

class KnightPathFinder
    DELTAS = [
        [-1, 2],
        [1, 2],
        [-2, 1],
        [2, 1],
        [-2, -1],
        [2, -1],
        [-1, -2],
        [1, -2]
    ].freeze!

    def initialize(start)
        @start = start
        @root = PolyTreeNode.new(start)
    end

    def find_path(end)
        
    end

    def find_next_steps(current_pos)
        x, y = current_pos
        next_steps = Array.new
        DELTAS.each do |delta|
            x += delta[0]
            y += delta[1]
            if (x >= 0 && x < 8) && (y >= 0 && y < 8)
                next_steps << [x, y]
            end
        end
        return next_steps
    end
end
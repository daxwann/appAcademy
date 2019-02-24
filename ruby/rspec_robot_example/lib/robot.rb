class Robot
    attr_reader :position, :items, :items_weight

    def initialize
        @position = [0,0]
        @items = []
    end

    def move_left
        @position = [position[0] - 1, position[1]]
    end

    def move_right
        @position = [position[0] + 1, position[1]]
    end

    def move_up
        @position = [position[0], position[1] + 1]
    end

    def move_down
        @position = [position[0], position[1] - 1]
    end

    def pick_up(item)
        if items_weight + item.weight > 250
            raise ArgumentError, "Will pass maximum weight of 250"
        else
            @items << item
        end
    end

    def items_weight
        items.inject(0) do |sum, item|
            sum + item.weight
        end
    end
end

class Item
    attr_reader :name, :weight

    def initialize(name, weight)
        @name = name
        @weight = weight
    end
end

class Bolts
end

class Weapon
end

class Laser
end

class PlasmaCannon
end
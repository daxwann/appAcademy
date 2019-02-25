class Robot
    attr_reader :position, :items, :items_weight, :health
    attr_accessor :equipped_weapon

    def initialize
        @position = [0,0]
        @items = []
        @health = 100
        @equipped_weapon = nil
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

    def wound(amount)
        if health - amount < 0
            @health = 0
        else
            @health = health - amount
        end
    end

    def heal(amount)
        if health + amount > 100
            @health = 100
        else
            @health = health + amount
        end
    end

    def attack(robot_enemy)
        if equipped_weapon.nil?
            robot_enemy.wound(5)
        else
            equipped_weapon.hit(robot_enemy)
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

class Bolts < Item
    def initialize
        super("bolts", 25)
    end

    def feed(robot_injured)
        robot_injured.heal(25)
    end
end

class Weapon < Item
    attr_reader :damage

    def initialize(name, weight, damage)
        super(name, weight)
        @damage = damage
    end

    def hit(robot_enemy)
        robot_enemy.wound(damage)
    end
end

class Laser < Weapon
    def initialize
        super("laser", 125, 25)
    end
end

class PlasmaCannon < Weapon
    def initialize
        super("plasma_cannon", 200, 55)
    end
end
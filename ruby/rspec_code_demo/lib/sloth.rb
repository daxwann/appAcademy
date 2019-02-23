class Sloth
    attr_reader :name, :foods, :drinks
    DIRECTIONS = %w(north south west east).freeze

    def initialize(name)
        @name = name
        @foods = Array.new
        @drinks = {}
    end

    def eat(food)
        @foods << food
    end

    def drink(beverage, amount)
        @drinks[beverage] = amount
    end

    def run(direction)
        raise ArgumentError unless DIRECTIONS.include?(direction.downcase)
        "I'm running to the #{direction}!"
    end
end
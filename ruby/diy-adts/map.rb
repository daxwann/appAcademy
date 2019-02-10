class Map
    def initialize
        @map = Array.new
    end

    def set(key, value=true)
        @map << [key, value] if self.get(key).nil?
    end

    def get(key)
        @map.each do |pair|
            return pair if pair[0] == key
        end
        nil
    end

    def delete(key)
        @map.select! do |pair|
            pair[0] != key
        end
    end

    def show
        p @map
    end
end
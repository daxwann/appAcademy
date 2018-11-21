class Board
  attr_reader :size
  def initialize(size)
    @grid = []
    size.times do
      @subarray = []
      size.times {@subarray << :N}
      @grid << @subarray
    end
    @size = size ** 2
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |value|
        count += 1 if value == :S
      end
    end
    return count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    while num_ships < self.size / 4 do
      pos = [rand(0...@grid.length), rand(0...@grid.length)]
      self[pos] = :S if self[pos] != :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |value|
        if value == :S
          :N
        else
          value
        end
      end
    end
  end

  def self.print_grid(grid)
   grid.each do |row|
     row.each_with_index do |v, i|
       print " " if i != 0
       print "#{v}"
     end
     puts
   end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end

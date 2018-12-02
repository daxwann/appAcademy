class Board

  attr_reader :grid
  attr_writer :grid

  def initiate
    @grid = Array.new(5) {[]}
  end

  def populate

  end

  def [](pos)
    x, y = pos
    @grid[y][x]
  end

  def []=(pos, val)
    x, y = pos
    @grid[y][x] = val
  end
end

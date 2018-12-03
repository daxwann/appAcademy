require_relative "./deck"
require_relative "./card"

class Board

  attr_reader :grid

  def initialize(size)
    @rows, @cols = size
    @grid = Array.new(rows)
    @deck = Deck.new(4)
  end

  def populate
    @grid.each do |row|
      cols.times {row << @deck.draw}
    end
  end

  def [](pos)
    x, y = pos
    @grid[y][x]
  end

  def []=(pos, val)
    x, y = pos
    @grid[y][x] = val
  end

  def won?
    @grid.flatten.all? { |card| card.face_up? == true }
  end
end

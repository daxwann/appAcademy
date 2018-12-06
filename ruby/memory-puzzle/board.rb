require_relative "./deck"
require_relative "./card"

class Board

  attr_reader :grid

  def initialize(size)
    @grid = Array.new(size) {Array.new(size)}
    @deck = Deck.new(size)
  end

  def populate
    @deck.shuffle
    @grid.each do |row|
      row.map! do |card|
        @deck.draw
      end
    end
  end

  def render
    @grid.each do |row|
      row.each_with_index do |card, idx|
        print " " if idx > 0
        if card.face_up == false
          print "X"
        else
          print card.reveal
        end
      end
      puts
    end
  end

  def reveal(pos)
    self[pos].reveal
  end

  def hide(pos)
    self[pos].hide
  end

  def [](pos)
    x, y = pos
    @grid[y][x]
  end

  def []=(pos, val)
    x, y = pos
    @grid[y][x].face_up = val
  end

  def won?
    @grid.flatten.all? { |card| card.face_up == true }
  end
end

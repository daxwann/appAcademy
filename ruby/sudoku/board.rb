class Board
  def initialize(filename)
    @board = Array.new(9) {Array.new(9)}
    @file = open filename
  end

  def populate

  end

end

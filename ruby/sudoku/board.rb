class Board
  def initialize(filename)
    @board = Array.new(9) {Array.new}
    @filename = filename
  end

  def populate
    file = File.open(@filename, "r")
    file.each do |line|
      row = 0
      line.each do |val|
        num = val.to_i
        @board[row] << Tile.new(num, num == 0 ? false : true)
      end
      row += 1
    end
    file.close
  end

end

require_relative './tile'

class Board
  attr_reader :file, :board

  def initialize(filename)
    @board = Array.new(9) {Array.new}
    @filename = filename
    @file = File.readlines(filename)
    @cols = Array.new(9) {Array.new}
    @squares = Array.new(9) {Array.new}
  end

  def throw_error
    raise "Invalid board. Please check #{@filename}."
  end

  def convert_file
    self.throw_error if @file.length != 9
    @file.map! do |line|
      line.chomp!
      self.throw_error if line.length != 9
      line.split("").map! do |val|
        self.throw_error unless val >= '0' && val <= '9'
        val.to_i
      end
    end
    return @file
  end

  def populate
    self.convert_file
    (0...9).each do |row|
      (0...9).each do |col|
        @board[row] << Tile.new(@file[row][col])
      end
    end
    return @board
  end

  def render
    @board.each do |row|
      row.each do |tile|
        print tile.to_s
      end
      puts
    end
  end

  def [](pos)
    x, y = pos
    @board[y][x].value
  end

  def []=(pos, val)
    x, y = pos
    if @board[y][x].given == true
      puts "Cannot change value at a given position"
      return false
    end
    @board[y][x].change(val)
  end

  def solved?
    return true if self.rows_ok? && self.cols_ok? && self.squares_ok?
    return false
  end

  def reset_cols
    @cols = Array.new(9) {Array.new}
  end

  def rows_ok?
    self.reset_cols
    self.reset_squares
    @board.each do |row|
      num_set = Hash.new(0)
      row.each_with_index do |tile, idx|
        return false if tile.value == 0
        num_set[tile.value] += 1
        if num_set[tile.value] > 1
          return false
        end
        @cols[idx] << tile.value
      end
    end
    return true
  end

  def col_ok?

  end

end

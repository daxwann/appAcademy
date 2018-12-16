require_relative './tile'
require 'byebug'
require 'colorize'

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
    puts
    puts "   1 2 3 4 5 6 7 8 9"
    puts "   - - - - - - - - -"
    @board.each.with_index do |row, i|
      print "#{i + 1} |"
      row.each.with_index do |tile, k|
        print " " if k > 0
        if tile.given == true
          print tile.to_s.colorize(:green)
        else
          print tile.to_s
        end
      end
      print "|"
      puts
    end
    puts "   - - - - - - - - -"
    return
  end

  def [](pos)
    x, y = pos
    @board[y][x].value
  end

  def []=(pos, val)
    x, y = pos
    if @board[y][x].given == true
      puts "Cannot change value at a given position"
      sleep(2)
      return false
    end
    @board[y][x].change(val)
  end

  def move_ok?(pos)
    x, y = pos
    x_min = self.find_min(x)
    y_min = self.find_min(y)
    return pos_row_ok?(y) && pos_col_ok?(x) && pos_square_ok?(x_min, y_min)
  end

  def pos_row_ok?(y)
    num_set = Hash.new(0)
    @board[y].each do |tile|
      return false if tile.value == 0
      num_set[tile.value] += 1
      return false if num_set[tile.value] > 1
    end
    return true
  end

  def pos_col_ok?(x)
    num_set = Hash.new(0)
    @board.each do |row|
      return false if row[x].value == 0
      num_set[row[x].value] += 1
      return false if num_set[row[x].value] > 1
    end
    return true
  end

  def find_min(coordinate)
    case coordinate
    when 0..2
      return 0
    when 3..5
      return 3
    when 6..8
      return 6
    else
      raise "Invalid coordinate"
    end
  end

  def pos_square_ok?(x_min, y_min)
    num_set = Hash.new(0)
    (y_min..(y_min + 2)).each do |row|
      (x_min..(x_min + 2)).each do |col|
        return false if @board[row][col].value == 0
        num_set[@board[row][col].value] += 1
        return false if num_set[@board[row][col].value] > 1
      end
    end
    return true
  end

  def solved?
    return false unless self.all_rows_ok?
    return false unless self.all_cols_ok?
    return false unless self.all_squares_ok?
    return true
  end

  def all_rows_ok?
    (0...9).each do |row|
      return false unless self.pos_row_ok?(row)
    end
    return true
  end

  def all_cols_ok?
    (0...9).each do |col|
      return false unless self.pos_col_ok?(col)
    end
    return true
  end

  def all_squares_ok?
    min_coordinate = [0, 3, 6]
    min_coordinate.each do |x_min|
      min_coordinate.each do |y_min|
        return false unless self.pos_square_ok?(x_min, y_min)
      end
    end
    return true
  end
end

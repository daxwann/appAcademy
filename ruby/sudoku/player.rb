class Player
  attr_reader :pos, :val

  def initialize
    @pos = []
    @val = 0
  end

  def input_pos
    x = self.pick_coordinate("column")
    y = self.pick_coordinate("row")
    @pos = [x, y]
  end

  def input_value
    loop do
      puts "enter value"
      input = gets.chomp
      num = input.to_i
      return num if (0..9).include?(num) && num.to_s == input
      puts "Number not valid. Try again."
    end
  end

  def pick_coordinate(coordinate)
    loop do
      puts "enter #{coordinate} number (1 to 9)"
      num = gets.chomp.to_i - 1
      return num if (0..8).include?(num)
      puts "Number not valid. Try again."
    end
  end

end

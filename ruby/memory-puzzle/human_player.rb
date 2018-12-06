class HumanPlayer
  attr_reader :guess

  def initialize
    @x = 0
    @y = 0
    @guess = []
  end

  def get_input
    puts "Enter position to flip card."
    loop do
      print "row: "
      @y = gets.chomp.to_i - 1
      break if valid_num?(@y)
    end
    loop do
      print "column: "
      @x = gets.chomp.to_i - 1
      break if valid_num?(@x)
    end
    puts
    @guess = [@x, @y]
  end

  def valid_num?(nb)
    if nb < 0 || nb >= 4
      puts "number out of bounds. Try again."
      return false
    end
    return true
  end

end

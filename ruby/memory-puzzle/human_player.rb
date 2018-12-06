class HumanPlayer
  attr_reader :guess

  def initialize(size)
    @guess = []
  end

  def prompt
    puts "Enter position to flip card."
    y = self.get_input("row")
    x = self.get_input("column")
    puts
    @guess = [x, y]
  end

  def get_input(prompt)
    loop do
      print "#{prompt}: "
      coordinate = gets.chomp.to_i - 1
      break if valid_num?(coordinate)
    end
    return coordinate
  end

  def valid_num?(nb)
    if nb < 0 || nb >= size
      puts "number out of bounds. Try again."
      return false
    end
    return true
  end

end

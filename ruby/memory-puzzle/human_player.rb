class HumanPlayer
  attr_reader :guess

  def initialize(size)
    @guess = []
    @size = size
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
      return coordinate if valid_num?(coordinate)
    end
  end

  def valid_num?(nb)
    if nb < 0 || nb >= @size
      puts "number out of bounds. Try again."
      return false
    end
    return true
  end

  def receive_revealed_card(value)
    return
  end

  def receive_match(pos1, pos2)
    return
  end

end

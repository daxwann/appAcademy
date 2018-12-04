class Player
  def initialize
    @guess = []
  end

  def prompt
    puts "Enter position to flip card."
    print "row: "
    y = gets.chomp.to_i
    puts
    print "column: "
    x = gets.chomp.to_i

  end
end

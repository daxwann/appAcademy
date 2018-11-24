class Player

  attr_reader :names

  def initialize(names)
    @names = names
  end

  def guess
    puts
    puts "#{@names[0]}, enter a letter:"
    guess = gets.chomp
  end

  def alert_invalid_guess
    puts "invalid guess. try again."
  end
end

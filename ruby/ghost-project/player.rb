class Player
  def initialize(*names)
    @players = names
  end

  def guess
    guess = gets.chomp
  end

  def alert_invalid_guess
    puts "invalid guess. try again."
  end
end

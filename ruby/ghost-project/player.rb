require_relative "./aiplayer"

class Player

  attr_reader :names

  def initialize(names)
    @names = names
    @ai = false
  end

  def ai?
    if @names.length == 1
      @aiplayer = AiPlayer.new
      @names << @aiplayer.name
      return
    end
    loop do
      puts "Do you want to add AI player? y/N"
      input = gets.chomp
      if input.downcase == "y"
        @ai = true
        break
      elsif input.upcase == "N"
        break
      end
    end
    if @ai == true
      @aiplayer = AiPlayer.new
      @names << @aiplayer.name
      return
    else
      return
    end
  end

  def guess(dictionary, fragment)
    puts
    puts "#{@names[0]}, enter a letter:"
    if @ai == true && @names[0] == @aiplayer.name
      guess = @aiplayer.guess(dictionary, fragment, @names.length  - 1)
      puts guess
    else
      guess = gets.chomp
    end
    return guess
  end

  def alert_invalid_guess
    puts "invalid guess. try again."
  end
end

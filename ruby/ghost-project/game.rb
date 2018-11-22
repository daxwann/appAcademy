#require_relative "./player.rb"

class Game
  attr_reader :dictionary, :fragment
  def initialize
    #@player1 = Player.new(player1)
    #@player2 = Player.new(player2)
    @fragment = "zo"
    @dictionary = File.read('dictionary.txt').split("\n")
  end

#  def play_round
#  end

#  def current_player
#  end

  #def previous_player
  #end

#  def next_player!
#  end

 # def take_turn(player)
#  end

  def valid_play?(letter)
    if !(letter.is_a? String) && letter.length != 1
      return false
    end
    play = @fragment + letter
    if @dictionary.include?(@fragment + letter)
      @fragment += letter
      return true
    else
      return false
    end
  end
end

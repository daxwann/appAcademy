require_relative "player.rb"
require_relative "board.rb"

class Game
  def initialize
    @board = Board.new
    @player = Player.new
  end
end

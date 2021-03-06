require_relative "player.rb"
require_relative "board.rb"

class Game
  attr_reader :board, :player
  
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def play(bd, p1)
    until won?(bd) do
      begin
        bd.display
        move = p1.make_move
        bd.move(move)
      rescue ArgumentError => e
        puts e.message
        sleep(2)
        retry
      end
    end
    puts "You did it!"
    return true
  end

  def won?(bd)
    return false if bd.cols[0..1].any? { |col| !col.empty? }
    return false if bd.cols[2] != [3, 2, 1] 
    true 
  end
end

if __FILE__ == $PROGRAM_NAME
  gm = Game.new
  gm.play(gm.board, gm.player)
end

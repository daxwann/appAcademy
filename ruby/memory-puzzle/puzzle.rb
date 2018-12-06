require_relative "./board"
require_relative "./player"

class Puzzle
  def initialize(size)
    @board = Board.new(size)
    @player = HumanPlayer.new(size)
    @board.populate
    @prev_pos = []
    @current_pos = []
  end

  def over?
    @board.won?
  end

  def play
    until self.over?
      system("clear")
      @board.render
      @current_pos = @player.prompt
      if self.valid_guess?
        @player.receive_revealed_card(@board[@current_pos])
        self.make_guess
      end
    end
    self.win
  end

  def valid_guess?
    if @board[@current_pos].face_up == true
      puts "Card already picked. Try again."
      sleep(2)
      return false
    end
    return true
  end

  def make_guess
    if @prev_pos.empty?
      @board.reveal(@current_pos)
      @prev_pos = @current_pos
      return
    end

    if self.match?
      @board.reveal(@current_pos)
      @player.receive_match(@current_pos, @prev_pos)
    else
      self.wrong_match
    end
    self.clear_prev
  end

  def clear_prev
    @prev_pos = []
  end

  def wrong_match
    @board.reveal(@current_pos)
    system("clear")
    puts "cards don't match"
    @board.render
    sleep(2)
    @board[@prev_pos].hide
    @board[@current_pos].hide
  end

  def match?
    @board[@prev_pos].value == @board[@current_pos].value
  end

  def win
    system("clear")
    puts "You win!"
    @board.render
  end
end

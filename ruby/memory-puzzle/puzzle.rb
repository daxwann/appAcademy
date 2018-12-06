require_relative "./board"
require_relative "./human_player"
require_relative "./computer_player"
require "byebug"

class Puzzle

  def self.choose_level
    puts "Enter level of difficulty (1, 2, or 3):"
    puts "1. Easy"
    puts "2. Intermediate"
    puts "3. Hard"
    loop do
      lvl = gets.chomp.to_i
      case lvl
      when 1
        return 2
      when 2
        return 4
      when 3
        return 6
      else
        puts "Wrong number. Pick again."
      end
    end
  end

  def initialize(size)
    @board = Board.new(size)
    @player = ComputerPlayer.new(size)
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
        @player.receive_revealed_card(@board[@current_pos].value)
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

if __FILE__ == $PROGRAM_NAME
  lvl = Puzzle.choose_level
  pz1 = Puzzle.new(lvl)
  pz1.play
end

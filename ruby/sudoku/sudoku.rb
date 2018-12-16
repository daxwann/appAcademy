require_relative "./board.rb"
require_relative "./player.rb"

class Sudoku
  def initialize(file)
    @player = Player.new
    @board = Board.new(file)
    @board.populate
  end

  def select_puzzle
    puts "Enter path of puzzle (.txt) file"
    loop do
      file = gets.chomp
      return file if File.exist?(file)
      puts "File does not exist. Please try again."
    end
  end

  def play
    until self.over?
      loop do
        system("clear")
        @board.render
        pos = @player.input_pos
        val = @player.input_value
        @board[pos] = val
        break if @board.move_ok?(pos)
      end
    end
    self.win
  end

  def over?
    @board.solved?
  end

  def win
    system("clear")
    puts "You win!!!"
    puts
    @board.render
  end
end

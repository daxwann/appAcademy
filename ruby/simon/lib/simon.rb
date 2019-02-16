class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end

  def play
    loop do
      self.take_turn
      break if self.game_over
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless self.game_over
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color    
  end

  def require_sequence
    input = gets.chomp
    user_seq = input.split(" ")
    self.game_over = true unless user_seq == self.seq
  end

  def add_random_color
    new_seq = self.seq.dup
    new_seq << COLORS.sample
    self.seq = new_seq
  end

  def round_success_message
    puts "Round success"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = Array.new
  end
end

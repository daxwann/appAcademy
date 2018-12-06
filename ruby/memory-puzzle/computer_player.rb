require "byebug"

class ComputerPlayer
  attr_reader :guess

  def initialize(size)
    @guess = []
    @first_pick = []
    @size = size
    @known_cards = Hash.new(0)
    @unmatched_cards = fill_cards(size)
  end

  def prompt
    puts "Enter position to flip card."
    @guess = self.choose
    puts "#{@guess[0] + 1}, #{@guess[1] + 1}"
    sleep(2)
    return (@guess)
  end

  def fill_cards(size)
    array = []
    (0...@size).each do |x|
      (0...@size).each do |y|
        array << [x, y]
      end
    end
    return array
  end

  def choose
    if @first_pick.empty?
      pos = self.pick
      @first_pick << pos
    else
      pos = self.pick
      @first_pick = []
    end
    return pos
  end

  def pick
    if self.pick_matched == false
      self.random_unknown
    else
      self.pick_matched
    end
  end

  def pick_matched
    card_values = @known_cards.values
    @known_cards.each do |pos, val|
      if card_values.count(val) > 1 && @unmatched_cards.include?(pos) && !@first_pick.include?(pos)
        return pos
      end
    end
    return false
  end

  def random_unknown
    known_pos = @known_cards.keys
    unknown_pos = @unmatched_cards - known_pos
    return unknown_pos.sample
  end

  def receive_revealed_card(value)
    @known_cards[@guess] = value
  end

  def receive_match(pos1, pos2)
    @unmatched_cards.reject! do |pos|
      pos == pos1 || pos == pos2
    end
  end

end

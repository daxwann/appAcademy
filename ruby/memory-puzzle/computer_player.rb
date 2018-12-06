class ComputerPlayer
  attr_reader :guess

  def initialize(size)
    @guess = []
    @size = size
    @known_cards = Hash.new(0)
    @unmatched_cards = fill_cards(size)
  end

  def prompt
    puts "Enter position to flip card."

    puts "#{@guess[0] + 1}, #{@guess[1] + 1}"
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
    if matching_exist?

    end
  end

  def matching_exist?

  end

  def random
    @unmatched_cards.sample
  end

  def receive_revealed_card(value)
    @known_cards[@guess] = value

  end

  def receive_match(pos1, pos2)
    @unmatched_cards.reject! do |pos|
      pos == pos1 || pos == pos2
    end
    @known_cards.reject! do |pos, val|
      pos == pos1 || pos == pos2
    end
  end

end

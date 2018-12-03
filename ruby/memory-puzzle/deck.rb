require_relative "./card"

class Deck
attr_reader :count, :cards

def initialize(size)
  @deck = fill_deck(size)
end

def shuffle
  @deck.shuffle!
end

def draw
  @deck.pop
end

private

def fill_deck(size)
  max_value = (size ** 2) / 2
  deck = []
  (1..max_value).each do |value|
    2.times {deck << Card.new(value)}
  end
  return deck
end

end

class AiPlayer

  attr_reader :name

  def initialize
    @name = "AI player"
  end

  def guess(dictionary, fragment, num_opponents)
    picks = self.possible_picks(dictionary, fragment)
    return self.moves(picks, num_opponents)
  end

  def moves(choices, num_opponents)
    choices.each do |word, remain|
      if remain != 1 && remain - 1 <= num_opponents
        return word[-remain]
      end
    end
    total = choices.keys.length
    random_choice = choices.keys[rand(0...total)]
    remain = choices[random_choice]
    return random_choice[-remain]
  end

  def possible_picks(dictionary, fragment)
    picks = Hash.new(0)
    dictionary.each do |word|
      if /^#{fragment}/ === word
        picks[word] = word.length - fragment.length
      end
    end
    return picks
  end
end

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.all? {|peg| POSSIBLE_PEGS.has_key?(peg.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Not valid pegs"
    end
  end

  def self.random(length)
    pegs = []
    set = POSSIBLE_PEGS.keys
    length.times do
      pegs << set[rand(0...set.length)]
    end
    return Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.upcase.chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    @pegs.each.with_index do |peg, i|
      if peg == guess.pegs[i]
        matches += 1
      end
    end
    return matches
  end

  def num_near_matches(guess)
    matches = 0
    unmatched = @pegs.select.with_index do |peg, i|
      peg != guess.pegs[i]
    end
    guess.pegs.each.with_index do |peg, i|
      if peg != @pegs[i] && unmatched.include?(peg)
        matches += 1
      end
    end
    return matches
  end

  def ==(other_code)
    if other_code.length != self.length
      return false
    end
    self.length == num_exact_matches(other_code)
  end

end

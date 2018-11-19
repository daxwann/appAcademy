class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.chars.map { "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(c)
    @attempted_chars.include?(c)
  end

  def get_matching_indices(c)
    indices = []
    @secret_word.each_char.with_index do |char, idx|
      if char == c
        indices << idx
      end
    end
    return indices
  end

  def fill_indices(char, indices)
    indices.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(guess)
    if already_attempted?(guess)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << guess
    matching = get_matching_indices(guess)
    if matching.empty?
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(guess, matching)
    end
    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @secret_word == @guess_word.join
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
end

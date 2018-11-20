require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(other_code)
    puts "exact matches: " + @secret_code.num_exact_matches(other_code).to_s
    puts "near matches: " + @secret_code.num_near_matches(other_code).to_s
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess = Code.from_string(gets.chomp)
    print_matches(guess)
    return @secret_code == guess
  end
end

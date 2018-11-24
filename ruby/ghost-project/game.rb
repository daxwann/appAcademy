require_relative "./player.rb"
require "set"

class Game
  attr_reader :dictionary, :fragment, :players
  def initialize(*players)
    @players = Player.new(players)
    @fragment = ""
    @dictionary = File.read('dictionary.txt').split("\n").to_set
    @score = {}
    @ghost = "GHOST"
    @round = 1
  end

  def run_game
    @players.names.each do |player|
      @score[player] = 0
    end
    until @players.names.length == 1
      puts "---------------"
      puts "Round #{@round}"
      puts "---------------"
      puts
      self.play_round
      @score.each do |name, score|
        if score == 5
          puts "#{name} is eliminated"
          @players.names.reject! {|player| player == name}
        end
      end
      @round += 1
    end
    puts "#{@players.names[0]} wins"
  end

  def play_round
    while self.take_turn
      self.next_player!
    end
    @score[self.current_player] += 1
    puts "#{self.current_player} has #{@ghost[0...@score[self.current_player]]}"
    @fragment = ""
  end

  def current_player
   @players.names[0]
  end

  def next_player!
   @players.names.rotate!
  end

  def take_turn
    guess = @players.guess
    until valid_play?(guess) do
      @players.alert_invalid_guess
      guess = @players.guess
    end
    @fragment += guess
    if @dictionary.include?(@fragment)
      puts "#{@fragment} is a word"
      return false
    end
    puts "current fragment: #{@fragment}"
    return true
  end

  def valid_play?(letter)
    #check input is a letter
    if !(letter.is_a? String) || letter.length != 1
      return false
    end
    play = @fragment + letter
    #check if play is a word
    @dictionary.each do |word|
      if /^#{play}/ === word
        return true
      end
    end
    return false
  end

  def display_score
    @score.each do |player, score|
      if score == 0
        puts "#{player}: none"
      elsif score < 6
        puts "#{player}: #{@ghost[0...score]}"
      end
    end
  end
end

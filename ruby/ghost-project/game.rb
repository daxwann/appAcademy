require_relative "./player.rb"
require "set"

class Game
  attr_reader :dictionary, :fragment, :players

  def self.get_players
    players = []
    puts "enter number of players"
    total = gets.chomp.to_i
    (1..total).each do |count|
      puts "Enter player #{count} name. Press Enter to continue."
      entry = gets.chomp
      players << entry
    end
    return players
  end

  def initialize(players)
    @players = Player.new(players)
    @fragment = ""
    @dictionary = File.read('dictionary.txt').split("\n").to_set
    @score = {}
    @ghost = "GHOST"
    @round = 1
  end

  def run_game
    @players.ai?
    @players.names.each do |player|
      @score[player] = 0
    end
    until @players.names.length == 1
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
    if @round > 1
      self.display_score
    end
    puts
    puts "---------------"
    puts "Round #{@round}"
    puts "---------------"
    puts
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
    guess = @players.guess(@dictionary, @fragment)
    until valid_play?(guess) do
      @players.alert_invalid_guess
      guess = @players.guess(@dictionary, @fragment)
    end
    @fragment += guess
    if @dictionary.include?(@fragment)
      puts
      puts "#{@fragment} is a word"
      return false
    end
    puts
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
    puts
    puts "   Score     "
    puts "-------------"
    @score.each do |player, score|
      if score == 0
        puts "#{player}: none"
      elsif score < 6
        puts "#{player}: #{@ghost[0...score]}"
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  players = Game.get_players
  game1 = Game.new(players)
  game1.run_game
end

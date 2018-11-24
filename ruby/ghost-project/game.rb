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
  end

  def run_game
    @players.each do |player|
      @score[player] = 0
    end
  end

  def play_round
    while take_turn(self.current_player)
      self.next_player!
    end
    self.current_player["penalty"] += 1
    @fragment = ""
  end

  def current_player
   @players[0]
  end

  def previous_player
   @players[-1]
  end

  def next_player!
   @players.rotate!
  end

  def take_turn(player)
    guess = player.guess
    until valid_play?(guess) do
      player.alert__invalid_guess
      guess = player.guess
    end
    @fragment += guess
    if @dictionary.include?(@fragment)
      return false
    end
    return true
  end

  def valid_play?(letter)
    #check input is a letter
    if !(letter.is_a? String) && letter.length != 1
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
    @players.each do |player|
      puts "#{player[name]}: #{@score[0..player[penalty]]}"
    end
  end
end

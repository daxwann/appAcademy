require_relative "./stack"

class Game

  attr_reader :stacks

  def initialize
    @stacks = Stack.new
  end

  def over?
    @stacks.cols[0].empty? && @stacks.cols[1..2].any?(&:empty?)
  end

  def start
    until self.over?
      @stacks.display
      @stacks.move_disks
    end
    puts "You did it!"
  end
end

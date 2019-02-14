require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over?
      winner = self.board.winner
      return false if winner == evaluator || winner == nil
      return true
    end
    if evaluator == self.next_mover_mark
      return self.children.all? {|child| child.losing_node?(evaluator)}
    else
      return self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if self.board.over?
      winner = self.board.winner
      return false if winner != evaluator
      return true
    end
    if evaluator == self.next_mover_mark
      return self.children.any? {|child| child.winning_node?(evaluator)}
    else
      return self.children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = Array.new
    (0..2).each do |row|
      (0..2).each do |col|
        if board.empty?([row, col])
          new_board = self.board.dup
          new_board[[row, col]] = self.next_mover_mark
          alternate_mark = ((self.next_mover_mark == :x) ? :o : :x)
          children << self.class.new(new_board, alternate_mark, [row, col])
        end
      end
    end
    return children
  end
end

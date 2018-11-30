class Stack

  attr_reader :cols, :disks

  def initialize
    @disks = (1..3).to_a.reverse!
    @cols = [@disks, [], []]
  end

  def display
    max_height = @cols.map(&:count).max
    render_string = (max_height - 1).downto(0).map do |height|
      @cols.map do |stack|
        stack[height] || " "
      end.join("\t")
    end.join("\n")
    puts "_\t_\t_"
    puts render_string
    puts "^\t^\t^"
    puts "a\tb\tc"
  end

  def get_stack(prompt)
    move_hash = { "a" => 0, "b" => 1, "c" => 2 }
    while true
      print prompt
      stack_num = move_hash[gets.chomp]
      return stack_num unless stack_num.nil?
      puts "Invalid move!"
    end
  end

  def move_disks
    from_stack_num = self.get_stack("Move from: ")
    to_stack_num = self.get_stack("Move to: ")
    from_stack, to_stack = @cols.values_at(from_stack_num, to_stack_num)
    if from_stack.empty?
      puts "cannot move from empty stack"
      return
    end
    unless (to_stack.empty? || to_stack.last > from_stack.last)
      puts "cannot move onto smaller disk"
      return
    end
    to_stack.push(from_stack.pop)
  end
end

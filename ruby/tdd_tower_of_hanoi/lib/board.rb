class Board
  attr_reader :cols

  def initialize
    @cols = [
      [3, 2, 1],
      [],
      []
    ]
  end

  def move(mv)
    fro, to = mv
    if fro < 0 || fro > 2 || to < 0 || to > 2
      raise ArgumentError, "Column number out of limit"
    end
    raise ArgumentError, "Cannot move disk from empty column" if cols[fro].empty?
    if cols[to].empty? || cols[fro].last < cols[to].last
      disk = cols[fro].pop
      cols[to].push(disk)
    else
      raise ArgumentError, "Cannot put bigger disk on smaller disk"
    end
  end

  def display
    system("clear")
    max_height = cols.map(&:count).max
    puts "_\t_\t_"
    (max_height - 1).downto(0).each do |idx|
      cols.each do |col|
        if col[idx]
          print col[idx]
        else
          print " "
        end 
        print "\t"
      end
      print "\n"
    end
    puts "^\t^\t^"
    puts "a\tb\tc"
  end
end

class Player
  def get_col(prompt)
    move_hash = {
      "a" => 0,
      "b" => 1,
      "c" => 2
    }
    begin
      print prompt
      col_num = move_hash[gets.chomp]
      raise "Invalid move! Pick a, b, or c." if col_num.nil?
    rescue StandardError => e
      puts e.message 
      retry
    end
    return col_num
  end

  def make_move
    from_col = get_col("Move disk from: ") 
    to_col = get_col("Move disk to: ")
    return [from_col, to_col]
  end
end

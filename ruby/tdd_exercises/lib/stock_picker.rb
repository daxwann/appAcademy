class Array
  def pick_stock
    highest = 0
    lowest = 1
    max_profit = self[1] - self[0]
    self.each_with_index do |price, day|
      next if day < 2
      
    end
  end
end
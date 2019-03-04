class Array
  def pick_stock
    return nil if self.count < 2
    max_profit = 0
    lowest_day = 0
    buy_sell = []
    self.each_with_index do |sell_price, day|
      next if day == 0
      next unless sell_price > self[day - 1]
      if buy_sell.empty?
        buy_sell = [day - 1, day]
        lowest_day = day - 1
        max_profit = sell_price - self[day - 1]
        next
      end
      if self[day - 1] < self[lowest_day]
        lowest_day = day - 1
      end
      profit = self[day] - self[lowest_day]
      if profit > max_profit
        buy_sell = [lowest_day, day]
        max_profit = profit
      end
    end
    return buy_sell unless buy_sell.empty?
    nil
  end
end
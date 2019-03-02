class Array
  def pick_stock
    return nil if self.count < 2
    max_profit = nil
    lowest_day = nil
    buy_sell = []
    self.each_with_index do |sell_price, day|
      next if day == 0
      buy_price = self[day - 1]
      next unless sell_price > buy_price
      if lowest_day.nil?
        lowest_day = day - 1
      else
        lowest_day = day - 1 if buy_price < self[lowest_day]
      end
      if max_profit.nil?
        buy_sell << lowest_day
        buy_sell << day
      elsif max_profit < sell_price - self[lowest_day]
        buy_sell[0] = lowest_day
        buy_sell[1] = day
      end
    end
    return buy_sell unless buy_sell.empty?
    nil
  end
end
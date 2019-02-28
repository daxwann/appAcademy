require "stock_picker"
require "rspec"

describe "Array#pick_stock" do
  subject(:stock) { Array.new }

  context "array with one pair of most profitable days" do
    stock = [10, 100, 5, 70, 50, 0, 60]
    it "returns most profitable pair of days" do
      expect(stock.pick_stock).to eq([0, 1])
    end
  end

  context "array with more than one pair of most profitable days" do
    stock = [10, 100, 5, 70, 0, 90, 60]
    it "returns the pair with earliest day to buy" do
      expect(stock.pick_stock).to eq([0, 1])
    end
  end
end
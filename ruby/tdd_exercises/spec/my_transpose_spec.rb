require "rspec"
require "my_transpose"

describe "Array#my_transpose" do
  subject(:arr) { Array.new }
  context "when array is not a matrix" do
    arr = [1, 2, 3]
    it "raises TypeError" do
      expect {arr.my_transpose}.to raise_error(TypeError)
    end
  end

  context "when matrix has various length arrays" do
    arr = [[1] , [1, 2, 3], [4, 5, 6]]
    it "raises IndexError" do
      expect {arr.my_transpose}.to raise_error(IndexError)
    end
  end

  context "when matrix has same length arrays" do
    arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    it "transposes rows into columns" do
      expect(arr.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end
  end
end
require 'rspec'
require 'two_sum'

describe 'Array#two_sum' do
  subject(:arr) { Array.new }
  context "when there are pairs of elements whose sum is zero" do
    arr = [1, 2, -1, -2, 4, 5]
    it "returns element pairs whose sum is zero" do
      expect(arr.two_sum).to eq([[0, 2], [1, 3]])
    end
  end

  context "when there are pairs of elements whose sum is zero" do
    arr = [1, 2, 2, -1, -2, 4, -2, 5]
    it "sorts all unique permutations of element pairs whose sum is zero" do
      expect(arr.two_sum).to eq([[0, 3], [1, 4], [1, 6], [2, 4], [2, 6]])
    end
  end

  context "when there are no pairs of elements whose sum is zero" do
    arr = [1, 2, 3, 'a', 'b']
    it "returns nil" do
      expect(arr.two_sum).to eq(nil)
    end
  end    
    
end
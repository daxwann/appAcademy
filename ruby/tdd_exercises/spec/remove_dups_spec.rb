require 'rspec'
require 'remove_dups'

describe "Array#my_uniq" do
    subject(:arr) { Array.new }

    context "when passing in numbers" do
        arr = [1, 2, 1, 3, 3]
        it "removes duplicate numbers" do
            expect(arr.my_uniq).to eq([1, 2, 3])
        end
    end

    context "when passing in strings" do
        arr = ["aa", "bb", "cc", "bb", "aa"]
        it "removes duplicate strings" do
            expect(arr.my_uniq).to eq(["aa", "bb", "cc"])
        end
    end

    context "when passing in arrays" do
        arr = [0, [1, 2], [1, 2], 3, 3, 4, 4, [5, [6, 7]], [5, [6, 7]]]
        it "removes duplicate arrays" do
            expect(arr.my_uniq).to eq([0, [1, 2], 3, 4, [5, [6, 7]]])
        end
    end
end
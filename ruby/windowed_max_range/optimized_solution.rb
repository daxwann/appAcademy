require 'rspec'

class MyQueue
  def initialize
    @store = []
  end
end

# rspec

describe '#windowed_max_range' do
  arr1 = [1, 0, 2, 5, 4, 8]
  arr2 = [1, 3, 2, 5, 4, 8]

  it { expect(windowed_max_range(arr1, 2)).to eq(4) }
  it { expect(windowed_max_range(arr1, 3)).to eq(5) }
  it { expect(windowed_max_range(arr1, 4)).to eq(6) }
  it { expect(windowed_max_range(arr2, 5)).to eq(6) }
end

require "board"

describe 'Board' do
  subject(:board) { Board.new }

  describe '#initialize' do
    it 'starts with three columns' do
      expect(board.cols.count).to eq(3)  
    end

    it 'has all disks stacked in the right order in column 1' do
      expect(board.cols[0]).to eq([3, 2, 1])
    end

    it 'has no disks in columns 2 and 3' do
      expect(board.cols[1]).to be_empty
      expect(board.cols[2]).to be_empty
    end
  end

  describe '#move' do
    it ' 
  end

end
































H

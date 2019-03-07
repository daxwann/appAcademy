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
    it 'moves a disk from one column to another' do
      board.move(0, 1)
      expect(board.cols[0]).to eq([3, 2])
      expect(board.cols[1]).to eq([1])
      expect(board.cols[2]).to be_empty    
    end

    it 'throws error if a disk is moved from an empty column' do
      expect {board.move(3, 1)}.to raise_error(ArgumentError)
    end

    it 'throws error if a larger disk is moved onto a smaller disk' do
      expect {board.move(0, 1)}.to raise_error(ArgumentError)
    end
  end
end

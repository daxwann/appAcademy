require "game"

describe 'Game' do
  subject(:game) { Game.new }

  describe '#initialize' do
    let(:board) { double("board") }

    it "starts with a new board" do
      expect(game.stack).to_not eq(nil)
    end
  end

  describe '#won?' do
    context 'all disks have been moved to third column' do
      let(:board) { double(:cols => [[], [], [3, 2, 1]]) }

      it "returns true" do
        expect(game.won?).to eq(true)
      end
    end

    context 'not all disks have been moved to third column' do
      let(:board) { double(:cols => [[], [3], [2, 1]]) }

      it "returns false" do
        expect(game.won?).to eq(false)
      end
    end
  end

  describe '#play' do
    let(:board) { double(:cols => [[], [], [3, 2, 1]]) }

    it "displays 'You did it!'" do
      expect(STDOUT).to_receive(:puts).with('You did it!')
    end
  end
end
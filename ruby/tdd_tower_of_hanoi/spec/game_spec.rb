require "game"

describe 'Game' do
  describe '#initialize' do
    it "starts with a new board" do
      expect(Board).to receive(:new)
      game = Game.new
    end

    it "starts with a new player" do
      expect(Player).to receive(:new)
      game = Game.new
    end
  end

  describe '#won?' do
    context 'all disks have been moved to third column' do

      it "returns true" do
        expect(game.won?).to eq(true)
      end
    end

    context 'not all disks have been moved to third column' do

      it "returns false" do
        expect(game.won?).to eq(false)
      end
    end
  end

  describe '#play' do

    it "displays 'You did it!'" do
      expect(STDOUT).to_receive(:puts).with('You did it!')
    end
  end
end

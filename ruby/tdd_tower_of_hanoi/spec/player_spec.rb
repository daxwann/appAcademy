require "player"
require "stringio"

describe Player do
  subject(:player) { Player.new }

  describe '#make_move' do
    before do
      $stdin = StringIO.new("0, 1")
    end

    after do
      $stdin = STDIN
    end

    it "returns from and to col number in an array" do
      expect(player.make_move).to eq([0, 1])
    end 
  end
end

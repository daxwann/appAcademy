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

  describe '#won?(board)' do
    context 'all disks have been moved to third column' do
      let(:bd) { double(:cols => [[], [], [3, 2, 1]]) }
      subject(:game) { Game.new }

      it "returns true" do
        expect(game.won?(bd)).to eq(true)
      end
    end

    context 'not all disks have been moved to third column' do
      subject(:game) { Game.new }
      let(:bd) { double(:cols => [[3], [2], [1]]) }

      it "returns false" do
        expect(game.won?(bd)).to eq(false)
      end
    end
  end

  describe '#play' do
    def silence
        # Store the original stderr and stdout in order to restore them later
        @original_stderr = $stderr
        @original_stdout = $stdout

        # Redirect stderr and stdout
        $stderr = $stdout = StringIO.new

        yield

        $stderr = @original_stderr
        $stdout = @original_stdout
        @original_stderr = nil
        @original_stdout = nil
    end


    context "game not won" do
      let(:bd) { double(:cols => [[3, 2, 1], [], []]) }
      let(:p1) { double(:make_move => [0, 1]) }
      subject(:game) { Game.new }

      it "displays board" do
        expect(bd).to receive(:display)
        allow(bd).to receive(:move).with([0, 1])
        allow(game).to receive(:won?).and_return(false, true)
        silence do 
          game.play(bd, p1)
        end
      end

      it "calls Player#make_move" do
        expect(p1).to receive(:make_move).and_return([0, 1])
        allow(bd).to receive(:move).with([0, 1])
        allow(game).to receive(:won?).and_return(false, true)
        silence do 
          game.play(bd, p1)
        end

      end

      it "sends move to board" do
        expect(bd).to receive(:move).with([0, 1])
        allow(game).to receive(:won?).and_return(false, true)
        silence do 
          game.play(bd, p1)
        end

      end
    end

    context "game won" do 
      let(:bd) { double(:cols => [[], [], [3, 2, 1]]) }
      let(:p1) { double("p1") }
      subject(:game) { Game.new }

      it "returns true" do
        silence do
          expect(game.play(bd, p1)).to eq(true)
        end
      end
    end
  end
end

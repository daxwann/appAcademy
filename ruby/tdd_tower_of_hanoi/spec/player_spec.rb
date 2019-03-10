require "player"
require "stringio"

describe Player do
  subject(:player) { Player.new }

  describe '#get_col' do
    def silence
      # Store the original stderr and stdout in order to restore them later
      @original_stdout = $stdout

      # Redirect stderr and stdout
      $stdout = StringIO.new

      yield

      $stdout = @original_stdout
      @original_stdout = nil
    end
   
    context 'right input' do
        before do
          $stdin = StringIO.new("b")
        end

        after do
          $stdin = STDIN
        end

        it "returns column number" do
          silence do
            expect(player.get_col("Move disk from: ")).to eq(1)
          end
        end
    end
  end

  describe '#make_move' do

    it "returns from and to col number in an array" do
      allow(player).to receive(:get_col).and_return(0, 1) 
      expect(player.make_move).to eq([0, 1])
    end 
  end
end

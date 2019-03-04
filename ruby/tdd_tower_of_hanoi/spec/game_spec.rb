require "game"

describe 'Game' do
  subject(:game) { Game.new }

  describe '#initialize' do
    let(:stack) { double(:count => 3) }

    it "start with a new stack of three columns" do
      expect(game.stack.count).to eq(3)
    end
  end

  describe '#won?' do
  end

  describe '#move' do
  end
end
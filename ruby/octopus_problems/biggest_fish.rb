require "rspec"

class Octopus
  def sluggish_find(fishes)
    fishes.each_with_index do |fish, idx|
      len = fish.length
      fishes.each_with_index do |fish2, idx2|
        next if idx2 == idx
        break if len < fish2.len
      end
    end 
  end
end

# rspec

describe "Octopus" do
  subject(:octopus) { Octopus.new }
  describe "#sluggish_find" do
    fishes =  ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

    expect(octopus.sluggish_find(fishes)).to eq('fiiiissshhhhhh')
  end
end

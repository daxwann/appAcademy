require 'sloth'

describe Sloth do
    subject(:sloth) {Sloth.new('Herbert')}

    describe '#initialize' do
        it 'assigns a name' do
            expect(sloth.name).to eq('Herbert')
        end

        it 'starts with an empty array of food' do
            expect(sloth.foods).to be_empty
        end
    end

    describe '#eat' do
        it 'adds new food to foods array' do
            expect(sloth.foods).to_not include('leaves')
            sloth.eat('leaves')
            expect(sloth.foods).to include('leaves')
        end
    end

    describe '#drink' do
        before(:each) { sloth.drink('lemonade', 10) }

        it 'adds new drink as key in drinks hash' do
            expect(sloth.drinks).to have_key('lemonade') 
        end

        it 'adds amount as value in drinks hash' do
            expect(sloth.drinks['lemonade']).to eq(10) 
        end 
    end

    describe '#run' do 
        it 'returns a string that includes the direction' do
            expect(sloth.run('west')).to include('west')
        end

        it 'raises an ArgumentError if the direction is invalid' do
            expect { sloth.run('all over the place')}.to raise_error(ArgumentError)
        end
    end
end
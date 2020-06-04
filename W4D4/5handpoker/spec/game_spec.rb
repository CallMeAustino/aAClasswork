require 'game'
require 'player'

describe 'game#initialize' do
    let(:game1) { nil }
    it 'should accept number of players' do
        expect(Game.new(7)).to_not raise_error
        expect(Game.new(8,8)).to raise_error(ArgumentError)
        expect(Game.new("8")).to raise_error
    end

    it 'should have an array that includes all players' do
        newgame = Game.new(7)
        expect(newgame.players.count).to eq(7)
    end

    it 'should call Game#createplayers' do
        expect(game1).to receive(:createplayers)
        game1 = Game.new(4)
    end

    
end
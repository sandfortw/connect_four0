require './lib/piece'
require './lib/cell'
require './lib/board'
require './lib/game'

Rspec.describe Game do 
  describe "#initialize" do 
    it 'will exist' do 
      game = Game.new
      
      expect(game).to be_a(Game)
    end 
  end 
end 
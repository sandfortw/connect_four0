require './lib/piece'
require './lib/cell'
require './lib/board'
require './lib/game'

RSpec.describe Game do 
  describe "#initialize" do 
    it 'will exist' do 
      game = Game.new
      
      expect(game).to be_a(Game)
    end 

    it 'will have an opening message' do 
      game = Game.new

      expect(game.opening_message).to eq("Print successful.")
    end 
    
    it 'have a readable turn counter' do
      game = Game.new

      expect(game.turn_counter).to eq(0)

    end
  end 
end 
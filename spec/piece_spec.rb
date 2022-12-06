require './lib/piece'

RSpec.describe Piece do
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      piece = Piece.new(:user)

      expect(piece).to be_a(Piece)
      expect(piece.symbol).to eq('X')
      
      piece_2 = Piece.new(:computer)

      expect(piece_2).to be_a(Piece)
      expect(piece_2.symbol).to eq('O')
    end 
  end 
end 

require './lib/piece'

RSpec.describe Piece do
  describe '#initialize' do 
    it 'will exist and have attributes' do 
      piece = Piece.new

      expect(piece).to be_a(Piece)
      expect(piece.user).to eq('X')
      expect(piece.computer).to eq('O')
    end 
  end 
end 

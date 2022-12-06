require 'rspec'
require './lib/piece'
require './lib/cell'


RSpec.describe Cell do
  it "exists" do
    cell = Cell.new(0, 0)

    expect(cell).to be_a(Cell)
  end

  it "has readable attributes" do
   cell = Cell.new(0, 0)

    expect(cell.row).to eq(0)
    expect(cell.column).to eq(0)
    expect(cell.piece).to eq(nil)

    cell1 = Cell.new(1, 1)

    expect(cell1.row).to eq(1)
    expect(cell1.column).to eq(1)
    expect(cell1.piece).to eq(nil)
  end

  it "will check to see if cell is empty" do
    cell = Cell.new(0, 0)

    expect(cell.empty?).to eq(true)
  end

  it "will place a piece on the cell for user" do 
    cell = Cell.new(0,0) 
    piece = Piece.new(:user)
    cell.place_piece(piece)
    
    expect(cell.empty?).to eq(false)
  end 

  it 'will render the cell' do 
    cell = Cell.new(0,0) 
    cell1 = Cell.new(1, 1)
    cell2 = Cell.new(2, 2)
    piece = Piece.new(:user)
    piece2 = Piece.new(:computer)
    cell.place_piece(piece)
    cell1.place_piece(piece2)

    expect(cell.render).to eq('X')
    expect(cell1.render).to eq('O')
    expect(cell2.render).to eq('.')
  end 
end
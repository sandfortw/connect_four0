require 'rspec'
require './lib/piece'
require './lib/cell'


RSpec.describe Cell do
  it "exists" do
    cell = Cell.new(0, 0)

    expect(cell).to be_a(Cell)
  end

  it "has readable attributes" do
   cell = cell.new(0, 0)


    expect(cell.row).to eq(0)
    expect(cell.column).to eq(0)
    expect(cell.health).to eq(1)

    cell1 = Cell.new(1, 1)

    expect(cell1.row).to eq(1)
    expect(cell1.column).to eq(1)
    expect(cell1.health).to eq(1)
  end

  it "will check to see if cell is empty" do
    piece = Piece.new(0, 0)

    expect(piece.empty?).to eq(true)
  end


  



end
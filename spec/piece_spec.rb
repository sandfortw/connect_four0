require 'rspec'
require './lib/piece'


RSpec.describe Piece do
  it "exists" do
    piece = Piece.new

    expect(piece).to be_a(Piece)
  end

  it "has readable attributes" do
    piece = Piece.new(0, 0, :x)


    expect(piece.row).to eq(0)
    expect(piece.column).to eq(0)
    expect(piece.type).to eq(:x)

    piece1 = Piece.new(5, 2, :o)

    expect(piece1.row).to eq(5)
    expect(piece1.column).to eq(2)
    expect(piece1.type).to eq(:o)
  end

  it "has a default type of --> . <-- " do

    piece = Piece.new(0, 0)
    expect(piece.type).to eq(:dot)
  end



end
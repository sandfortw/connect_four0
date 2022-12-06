require 'rspec'
require './lib/board'

RSpec.describe Board do
  @piece0 = Piece.new(0, 0)
  @piece1 = Piece.new(1, 0)
  @piece2 = Piece.new(2, 0)
  @piece3 = Piece.new(3, 0)
  @piece4 = Piece.new(4, 0)
  @piece5 = Piece.new(5, 0)
  @piece6 = Piece.new(6, 0)
  @piece7 = Piece.new(0, 1)
  @piece8 = Piece.new(1, 1)
  @piece9 = Piece.new(2, 1)
  @piece10 = Piece.new(3, 1)
  @piece11 = Piece.new(4, 1)
  @piece12 = Piece.new(5, 1)
  @piece13 = Piece.new(6, 1)
  @piece14 = Piece.new(0, 2)
  @piece15 = Piece.new(1, 2)
  @piece16 = Piece.new(2, 2)
  @piece17 = Piece.new(3, 2)
  @piece18 = Piece.new(4, 2)
  @piece19 = Piece.new(5, 2)
  @piece20 = Piece.new(6, 2)
  @piece21 = Piece.new(0, 3)
  @piece22 = Piece.new(1, 3)
  @piece23 = Piece.new(2, 3)
  @piece24 = Piece.new(3, 3)
  @piece25 = Piece.new(4, 3)
  @piece26 = Piece.new(5, 3)
  @piece27 = Piece.new(6, 3)
  @piece28 = Piece.new(0, 4)
  @piece29 = Piece.new(1, 4)
  @piece30 = Piece.new(2, 4)
  @piece31 = Piece.new(3, 4)
  @piece32 = Piece.new(4, 4)
  @piece33 = Piece.new(5, 4)
  @piece34 = Piece.new(6, 4)
  @piece35 = Piece.new(0, 5)
  @piece36 = Piece.new(1, 5)
  @piece37 = Piece.new(2, 5)
  @piece38 = Piece.new(3, 5)
  @piece39 = Piece.new(4, 5)
  @piece40 = Piece.new(5, 5)
  @piece41 = Piece.new(6, 5)

  it "exists" do
# can call board class

    board = Board.new
    expect(board) to be_a(Board)
  end



  it "has readable attributes" do
# if I call a row, it will output a row with 7 piece elements
# There should be 6 row arrays that go from 0 to 5





    expect(board.row(0)).to eq([[0, :dot], [1, :dot], [2, :dot], [3, :dot], [4, :dot], [5, :dot], [6, :dot]])
  end

  it "can print" do
    # If there is a print method called, it will print the whole board


    expect(board.print).to eq
    (".......
      .......
      .......
      .......
      .......
      .......")

    expect(board.print).to eq
    ("X.....O
      .......
      .......
      .......
      .......
      O.....X")
  end
end

require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/piece'
require 'matrix'
require 'pry'

RSpec.describe Board do
 
  it "exists" do
    board = Board.new
    expect(board).to be_a(Board)
  end



  it "has readable attributes" do
    # if I call a row, it will output a row with 7 piece elements
    # There should be 6 row arrays that go from 0 to 5
    board = Board.new




    expect(board.row(0)).to be_an(Array)
    expect(board.board).to be_a(Hash)
    expect(board.matrix).to be_a(Matrix)

  end

  it "can print" do
    # If there is a print method called, it will print the whole board
    board = Board.new

    expect(board.render).to eq("Print successful.")

  end

 
  it "user can place piece" do

  board = Board.new
  board.user_place_piece(0)

  expect(board.board["cell35"].piece.symbol).to eq('X')
  board.user_place_piece(0)
  expect(board.board["cell28"].piece.symbol).to eq('X')
  binding.pry

  end

end

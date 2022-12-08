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

 
  it "user can place piece using a letter" do

  board = Board.new
  board.user_place_piece("a")

  expect(board.board["cell35"].piece.symbol).to eq('X')
  board.user_place_piece("A")
  expect(board.board["cell28"].piece.symbol).to eq('X')

  

  end

  it "computer can place piece" do 

    board = Board.new
    board.computer_place_piece

   board.render

    board.computer_place_piece
    board.render

  end 

  it 'will check for a horizontal win for user' do 

    board = Board.new
    expect(board.horizontal_user_win?).to be(false)

    board.user_place_piece("A")
    board.user_place_piece("B")
    board.user_place_piece("C")
    board.user_place_piece("D")

    expect(board.horizontal_user_win?).to be(true)
  end 

  it 'will check for a vertical win for user' do 

    board = Board.new
    expect(board.vertical_user_win?).to be(false)

    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")

    expect(board.vertical_user_win?).to be(true)

  end

  it 'will check for a diagonal win for user' do
    board = Board.new

    # expect(board.diagonal_user_win?).to be(fa
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("A")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("D")
    board.user_place_piece("D")
    board.user_place_piece("D")
    expect(board.diagonal_user_win?).to be(true)
  end
end

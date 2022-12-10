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
    board = Board.new

    expect(board.board).to be_a(Hash)

  end

  it "can print" do
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
    board.computer_place_piece(1)

    board.render

    board.computer_place_piece(2)
    board.render

    random_number = [0, 1 , 2 ,3 ,4 ,5, 6].shuffle.first
    board.computer_place_piece(random_number)
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

  it 'will check for a downward diagonal win for user' do
    board = Board.new

    expect(board.diagonal_win?(0, 'X')).to be(false)
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
    expect(board.diagonal_win?(0, 'X')).to be(true)
  end

  it 'will check for an upwards diagonal win for user' do
    board = Board.new
    board.user_place_piece("A")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("D")
    board.user_place_piece("D")
    board.user_place_piece("D")
    board.user_place_piece("D")
    expect(board.diagonal_win?(5, 'X')).to be(true)
  end

  it "will check if user won any diagonal" do
    board = Board.new
    expect(board.diagonal_user_win_any?).to be(false)
    board.user_place_piece("A")
    board.user_place_piece("B")
    board.user_place_piece("B")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("C")
    board.user_place_piece("D")
    board.user_place_piece("D")
    board.user_place_piece("D")
    board.user_place_piece("D")
    expect(board.diagonal_user_win_any?).to be(true)
    
  end

end

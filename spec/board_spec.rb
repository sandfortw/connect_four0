require 'rspec'
require './lib/board'
require './lib/cell'
require './lib/piece'
require 'pry'

RSpec.describe Board do
 
  it "exists" do
# can call board class

    board = Board.new
    binding.pry
    expect(board).to be_a(Board)
  end



  xit "has readable attributes" do
# if I call a row, it will output a row with 7 piece elements
# There should be 6 row arrays that go from 0 to 5





    expect(board.row(0)).to eq([[0, :dot], [1, :dot], [2, :dot], [3, :dot], [4, :dot], [5, :dot], [6, :dot]])
  end

  xit "can print" do
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

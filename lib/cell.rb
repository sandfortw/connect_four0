class Cell
  attr_reader :row, :column, :piece

  def initialize(column, row)
    @row = row
    @column = column
    @piece = nil
  end 

  def empty?
    @piece == nil
  end 

  def place_piece(piece)
    @piece = piece
  end 

  def render
    if @piece == nil 
      '.'
    else 
      @piece.symbol
    end 
  end 
end 
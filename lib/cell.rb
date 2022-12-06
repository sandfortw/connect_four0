class Cell
  attr_reader :row, :column, :piece

  def initialize(row, column)
    @row = row
    @column = column
    @piece = nil
  end 

  def empty?
    if @piece == nil
      true
    else 
      false
    end 
  end 

  def place_piece(piece)
    @piece = piece
  end 
end 
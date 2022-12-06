class Cell
  attr_reader :row, :column, :health

  def initialize(row, column)
    @row = row
    @column = column
    @health = 1
  end 
end 
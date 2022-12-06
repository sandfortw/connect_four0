class Cell

  def initialize(coordinate_arr)
    @coordinate_arr = coordinate_arr

    @piece_type = nil
  end

  def empty?
    @piece_type == nil
  end

  def place_piece(x_or_o)
    @piece_type = x_or_o
  end

  def render_piece
    if empty? true
      "."
    elsif empty? == false || @piece_type == :o
      "O"
    elsif empty? == false || @piece_type == :x
      "X"
    end
  end
  
end
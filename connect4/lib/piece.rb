class Piece
  attr_reader :symbol

  def initialize(player_type)
    if player_type == :user
      @symbol = 'X'
    else
      player_type == :computer
      @symbol = 'O'
    end
  end
end

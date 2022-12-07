require 'matrix'
require 'pry'


class Board
  attr_reader :board, :matrix

  def initialize
   @board = {
    "cell0" => Cell.new(0, 0),
    "cell1" => Cell.new(1, 0),
    "cell2" => Cell.new(2, 0),
    "cell3" => Cell.new(3, 0),
    "cell4" => Cell.new(4, 0),
    "cell5" => Cell.new(5, 0),
    "cell6" => Cell.new(6, 0),
    "cell7" => Cell.new(0, 1),
    "cell8" => Cell.new(1, 1),
    "cell9" => Cell.new(2, 1),
    "cell10" => Cell.new(3, 1),
    "cell11" => Cell.new(4, 1),
    "cell12" => Cell.new(5, 1),
    "cell13" => Cell.new(6, 1),
    "cell14" => Cell.new(0, 2),
    "cell15" => Cell.new(1, 2),
    "cell16" => Cell.new(2, 2),
    "cell17" => Cell.new(3, 2),
    "cell18" => Cell.new(4, 2),
    "cell19" => Cell.new(5, 2),
    "cell20" => Cell.new(6, 2),
    "cell21" => Cell.new(0, 3),
    "cell22" => Cell.new(1, 3),
    "cell23" => Cell.new(2, 3),
    "cell24" => Cell.new(3, 3),
    "cell25" => Cell.new(4, 3),
    "cell26" => Cell.new(5, 3),
    "cell27" => Cell.new(6, 3),
    "cell28" => Cell.new(0, 4),
    "cell29" => Cell.new(1, 4),
    "cell30" => Cell.new(2, 4),
    "cell31" => Cell.new(3, 4),
    "cell32" => Cell.new(4, 4),
    "cell33" => Cell.new(5, 4),
    "cell34" => Cell.new(6, 4),
    "cell35" => Cell.new(0, 5),
    "cell36" => Cell.new(1, 5),
    "cell37" => Cell.new(2, 5),
    "cell38" => Cell.new(3, 5),
    "cell39" => Cell.new(4, 5),
    "cell40" => Cell.new(5, 5),
    "cell41" => Cell.new(6, 5)}

  @matrix = Matrix.rows([
    [@board["cell0"], @board["cell1"], @board["cell2"], @board["cell3"], @board["cell4"], @board["cell5"], @board["cell6"]],
    [@board["cell7"], @board["cell8"], @board["cell9"], @board["cell10"], @board["cell11"], @board["cell12"], @board["cell13"]],
    [@board["cell14"], @board["cell15"], @board["cell16"], @board["cell17"], @board["cell18"], @board["cell19"], @board["cell20"]],
    [@board["cell21"], @board["cell22"], @board["cell23"], @board["cell24"], @board["cell25"], @board["cell26"], @board["cell27"]],
    [@board["cell28"], @board["cell29"], @board["cell30"], @board["cell31"], @board["cell32"], @board["cell33"], @board["cell34"]],
    [@board["cell35"], @board["cell36"], @board["cell37"], @board["cell38"], @board["cell39"], @board["cell40"], @board["cell41"]]
    ])
  end
 
 def render
  puts "ABCDEFG"
  puts @matrix.row(0).to_a.map {|cell| cell.render}.join 
  puts @matrix.row(1).to_a.map {|cell| cell.render}.join
  puts @matrix.row(2).to_a.map {|cell| cell.render}.join
  puts @matrix.row(3).to_a.map {|cell| cell.render}.join
  puts @matrix.row(4).to_a.map {|cell| cell.render}.join
  puts @matrix.row(5).to_a.map {|cell| cell.render}.join
  return "Print successful."
 end
  
 def column(num)
  @matrix.column(num).to_a
 end

 def row(num)
  @matrix.row(num).to_a
 end

 def user_place_piece(letter)
  column_num_to_letter = { "A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6}
  @matrix.column(column_num_to_letter[letter.upcase]).to_a.reverse.find do |cell|
    if cell.empty?
     return cell.place_piece(Piece.new(:user))
      break
     end
    end
  end

  def computer_place_piece
    possible_placements = [0, 1 , 2 ,3 ,4 ,5, 6]
    @matrix.column(possible_placements.shuffle.first).to_a.reverse.find do |cell|
      if cell.empty?
        return cell.place_piece(Piece.new(:computer))
        break
      end
    end 
  end 


end
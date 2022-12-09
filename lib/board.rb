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

  def computer_place_piece(number)
    @matrix.column(number).to_a.reverse.find do |cell|
      if cell.empty?
        return cell.place_piece(Piece.new(:computer))
        break
      end
    end 
  end 

  def horizontal_user_win?
    check_wins = [
    [@matrix.row(0).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(1).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(2).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(3).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(4).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(5).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.row(6).to_a.map {|cell| cell.render}.join.scan(/XXXX/)]]
    
    if check_wins != ([[[]], [[]], [[]], [[]], [[]], [[]], [[]]])
      true
    else 
      false
    end 
  end

  def vertical_user_win?
    check_wins = [
    [@matrix.column(0).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.column(1).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.column(2).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.column(3).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.column(4).to_a.map {|cell| cell.render}.join.scan(/XXXX/)],
    [@matrix.column(5).to_a.map {|cell| cell.render}.join.scan(/XXXX/)]]
    
    if check_wins != ([[[]], [[]], [[]], [[]], [[]], [[]]])
      true
    else 
      false
    end 
  end

  def horizontal_computer_win?
    check_wins = [
    [@matrix.row(0).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(1).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(2).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(3).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(4).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(5).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.row(6).to_a.map {|cell| cell.render}.join.scan(/OOOO/)]]
    
    if check_wins != ([[[]], [[]], [[]], [[]], [[]], [[]], [[]]])
      true
    else 
      false
    end 
  end

  def vertical_computer_win?
    check_wins = [
    [@matrix.column(0).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.column(1).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.column(2).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.column(3).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.column(4).to_a.map {|cell| cell.render}.join.scan(/OOOO/)],
    [@matrix.column(5).to_a.map {|cell| cell.render}.join.scan(/OOOO/)]]
    
    if check_wins != ([[[]], [[]], [[]], [[]], [[]], [[]]])
      true
    else 
      false
    end 
  end

  def diagonal_user_win?(row_num)
    # row0[0],row1[1], row2[2],row3[3] #==> win downwards
    # row5[0], row4[1], row3[2], row2[1] #==> win upwards
    
    row_hash = {
    "row0" => @matrix.row(0).to_a.map {|cell| cell.render},
    "row1" => @matrix.row(1).to_a.map {|cell| cell.render},
    "row2" => @matrix.row(2).to_a.map {|cell| cell.render},
    "row3" => @matrix.row(3).to_a.map {|cell| cell.render},
    "row4" => @matrix.row(4).to_a.map {|cell| cell.render},
    "row5" => @matrix.row(5).to_a.map {|cell| cell.render}
    }

    column_counter = -1
    row_hash["row#{row_num}"].each do |character|
      column_counter += 1
      if character == 'X'
        if row_hash["row#{row_num + 1}"] != nil
          if row_hash["row#{row_num + 1}"][column_counter + 1] == 'X'
            if row_hash["row#{row_num + 2}"] != nil
              if row_hash["row#{row_num + 2}"][column_counter + 2] == 'X'
                if row_hash["row#{row_num + 3}"] != nil
                  if row_hash["row#{row_num + 3}"][column_counter + 3] == 'X'
                    return true
                    break
                  end
                end
              end
            end
          end
        end
      end
    end

    column_counter = -1
    row_hash["row#{row_num}"].each do |character|
      column_counter += 1
      if character == 'X'
        if row_hash["row#{row_num - 1}"] != nil
          if row_hash["row#{row_num - 1}"][column_counter + 1] == 'X'
            if row_hash["row#{row_num - 2}"] != nil
              if row_hash["row#{row_num - 2}"][column_counter + 2] == 'X'
                if row_hash["row#{row_num - 3}"] != nil
                  if row_hash["row#{row_num - 3}"][column_counter + 3] == 'X'
                    return true
                    break
                  end
                end
              end
            end
          end
        end
      end
    end

    return false
  end

  def diagonal_computer_win?(row_num)
    # row0[0],row1[1], row2[2],row3[3] #==> win downwards
    # row5[0], row4[1], row3[2], row2[1] #==> win upwards
    
    row_hash = {
    "row0" => @matrix.row(0).to_a.map {|cell| cell.render},
    "row1" => @matrix.row(1).to_a.map {|cell| cell.render},
    "row2" => @matrix.row(2).to_a.map {|cell| cell.render},
    "row3" => @matrix.row(3).to_a.map {|cell| cell.render},
    "row4" => @matrix.row(4).to_a.map {|cell| cell.render},
    "row5" => @matrix.row(5).to_a.map {|cell| cell.render}
    }

    column_counter = -1
    row_hash["row#{row_num}"].each do |character|
      column_counter += 1
      if character == 'X'
        if row_hash["row#{row_num + 1}"] != nil
          if row_hash["row#{row_num + 1}"][column_counter + 1] == 'O'
            if row_hash["row#{row_num + 2}"] != nil
              if row_hash["row#{row_num + 2}"][column_counter + 2] == 'O'
                if row_hash["row#{row_num + 3}"] != nil
                  if row_hash["row#{row_num + 3}"][column_counter + 3] == 'O'
                    return true
                    break
                  end
                end
              end
            end
          end
        end
      end
    end

    column_counter = -1
    row_hash["row#{row_num}"].each do |character|
      column_counter += 1
      if character == 'X'
        if row_hash["row#{row_num - 1}"] != nil
          if row_hash["row#{row_num - 1}"][column_counter + 1] == 'O'
            if row_hash["row#{row_num - 2}"] != nil
              if row_hash["row#{row_num - 2}"][column_counter + 2] == 'O'
                if row_hash["row#{row_num - 3}"] != nil
                  if row_hash["row#{row_num - 3}"][column_counter + 3] == 'O'
                    return true
                    break
                  end
                end
              end
            end
          end
        end
      end
    end

    return false
  end

  def diagonal_user_win_any?
   diagonal_user_win?(0)|| diagonal_user_win?(1) || diagonal_user_win?(2) || diagonal_user_win?(3) || diagonal_user_win?(4) || diagonal_user_win?(5)
  end

  def diagonal_computer_win_any?
    diagonal_computer_win?(0) || diagonal_computer_win?(1) || diagonal_computer_win?(2) || diagonal_computer_win?(3) || diagonal_computer_win?(4) || diagonal_computer_win?(5)
  end

  def user_win?
   diagonal_user_win_any? || horizontal_user_win? || vertical_user_win? 
  end

  def computer_win?
    diagonal_computer_win_any? || horizontal_computer_win? || vertical_computer_win?
  end

end
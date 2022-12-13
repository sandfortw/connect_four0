require 'matrix'

class Board
  attr_reader :board, 
              :matrix

  def initialize
    @board = {
      'cell0' => Cell.new(0, 0),
      'cell1' => Cell.new(1, 0),
      'cell2' => Cell.new(2, 0),
      'cell3' => Cell.new(3, 0),
      'cell4' => Cell.new(4, 0),
      'cell5' => Cell.new(5, 0),
      'cell6' => Cell.new(6, 0),
      'cell7' => Cell.new(0, 1),
      'cell8' => Cell.new(1, 1),
      'cell9' => Cell.new(2, 1),
      'cell10' => Cell.new(3, 1),
      'cell11' => Cell.new(4, 1),
      'cell12' => Cell.new(5, 1),
      'cell13' => Cell.new(6, 1),
      'cell14' => Cell.new(0, 2),
      'cell15' => Cell.new(1, 2),
      'cell16' => Cell.new(2, 2),
      'cell17' => Cell.new(3, 2),
      'cell18' => Cell.new(4, 2),
      'cell19' => Cell.new(5, 2),
      'cell20' => Cell.new(6, 2),
      'cell21' => Cell.new(0, 3),
      'cell22' => Cell.new(1, 3),
      'cell23' => Cell.new(2, 3),
      'cell24' => Cell.new(3, 3),
      'cell25' => Cell.new(4, 3),
      'cell26' => Cell.new(5, 3),
      'cell27' => Cell.new(6, 3),
      'cell28' => Cell.new(0, 4),
      'cell29' => Cell.new(1, 4),
      'cell30' => Cell.new(2, 4),
      'cell31' => Cell.new(3, 4),
      'cell32' => Cell.new(4, 4),
      'cell33' => Cell.new(5, 4),
      'cell34' => Cell.new(6, 4),
      'cell35' => Cell.new(0, 5),
      'cell36' => Cell.new(1, 5),
      'cell37' => Cell.new(2, 5),
      'cell38' => Cell.new(3, 5),
      'cell39' => Cell.new(4, 5),
      'cell40' => Cell.new(5, 5),
      'cell41' => Cell.new(6, 5)
    }

    @matrix = Matrix.rows([
      [@board['cell0'], @board['cell1'], @board['cell2'], @board['cell3'], @board['cell4'], @board['cell5'], @board['cell6']],
      [@board['cell7'], @board['cell8'], @board['cell9'], @board['cell10'], @board['cell11'], @board['cell12'], @board['cell13']],
      [@board['cell14'], @board['cell15'], @board['cell16'], @board['cell17'], @board['cell18'], @board['cell19'], @board['cell20']],
      [@board['cell21'], @board['cell22'], @board['cell23'], @board['cell24'], @board['cell25'], @board['cell26'], @board['cell27']],
      [@board['cell28'], @board['cell29'], @board['cell30'], @board['cell31'], @board['cell32'], @board['cell33'], @board['cell34']],
      [@board['cell35'], @board['cell36'], @board['cell37'], @board['cell38'], @board['cell39'], @board['cell40'], @board['cell41']]
      ])
  end

  def render
    puts ''
    puts '================================================================'
    puts 'ABCDEFG'
    puts @matrix.row(0).to_a.map { |cell| cell.render }.join
    puts @matrix.row(1).to_a.map { |cell| cell.render }.join
    puts @matrix.row(2).to_a.map { |cell| cell.render }.join
    puts @matrix.row(3).to_a.map { |cell| cell.render }.join
    puts @matrix.row(4).to_a.map { |cell| cell.render }.join
    puts @matrix.row(5).to_a.map { |cell| cell.render }.join
    'Print successful.'
  end

  def user_place_piece(letter)
    column_num_to_letter = { 'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6 }
    @matrix.column(column_num_to_letter[letter.upcase]).to_a.reverse.find do |cell|
      return cell.place_piece(Piece.new(:user)) if cell.empty?
    end
  end

  def computer_place_piece(number)
    @matrix.column(number).to_a.reverse.find do |cell|
      return cell.place_piece(Piece.new(:computer)) if cell.empty?
    end
  end

  def horizontal_user_win?
    if @matrix.row(0).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.row(1).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.row(2).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.row(3).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.row(4).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.row(5).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX']
      return true
    end

    false
  end

  def vertical_user_win?
    if @matrix.column(0).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.column(1).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.column(2).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.column(3).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.column(4).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX'] ||
       @matrix.column(5).to_a.map { |cell| cell.render }.join.scan(/XXXX/) == ['XXXX']
      return true
    end

    false
  end

  def horizontal_computer_win?
    if @matrix.row(0).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.row(1).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.row(2).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.row(3).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.row(4).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.row(5).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO']
      return true
    end

    false
  end

  def vertical_computer_win?
    if @matrix.column(0).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.column(1).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.column(2).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.column(3).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.column(4).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO'] ||
       @matrix.column(5).to_a.map { |cell| cell.render }.join.scan(/OOOO/) == ['OOOO']
      return true
    end

    false
  end

  def diagonal_win?(row_num, x_or_o)
    row_hash = {
      'row0' => @matrix.row(0).to_a.map { |cell| cell.render },
      'row1' => @matrix.row(1).to_a.map { |cell| cell.render },
      'row2' => @matrix.row(2).to_a.map { |cell| cell.render },
      'row3' => @matrix.row(3).to_a.map { |cell| cell.render },
      'row4' => @matrix.row(4).to_a.map { |cell| cell.render },
      'row5' => @matrix.row(5).to_a.map { |cell| cell.render }
    }

    column_counter = -1
    row_hash["row#{row_num}"].each do |character|
      column_counter += 1

      # Check diagonal down and right
      if (character == x_or_o) &&
         (row_hash["row#{row_num + 1}"] && row_hash["row#{row_num + 1}"][column_counter + 1] == x_or_o) &&
         (row_hash["row#{row_num + 2}"] && row_hash["row#{row_num + 2}"][column_counter + 2] == x_or_o) &&
         (row_hash["row#{row_num + 3}"] && row_hash["row#{row_num + 3}"][column_counter + 3] == x_or_o)
        return true

      # Check diagonal up and right
      elsif (character == x_or_o) &&
            (row_hash["row#{row_num - 1}"] && row_hash["row#{row_num - 1}"][column_counter + 1] == x_or_o) &&
            (row_hash["row#{row_num - 2}"] && row_hash["row#{row_num - 2}"][column_counter + 2] == x_or_o) &&
            (row_hash["row#{row_num - 3}"] && row_hash["row#{row_num - 3}"][column_counter + 3] == x_or_o)
        return true
      end
    end
    false
  end

  def diagonal_user_win_any?
    diagonal_win?(0,'X') || 
    diagonal_win?(1,'X') || 
    diagonal_win?(2,'X') || 
    diagonal_win?(3,'X') || 
    diagonal_win?(4,'X') || 
    diagonal_win?(5,'X')
  end

  def diagonal_computer_win_any?
    diagonal_win?(0,'O') || 
    diagonal_win?(1,'O') || 
    diagonal_win?(2,'O') || 
    diagonal_win?(3,'O') || 
    diagonal_win?(4,'O') || 
    diagonal_win?(5,'O')
  end

  def user_win?
    diagonal_user_win_any? || horizontal_user_win? || vertical_user_win?
  end

  def computer_win?
    diagonal_computer_win_any? || horizontal_computer_win? || vertical_computer_win?
  end
end

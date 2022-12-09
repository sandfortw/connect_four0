class Game

  def initialize
    @game_board = Board.new
    @turn_counter = 0
    @valid_inputs = ["A", "B", "C", "D", "E", "F", "G"]
  end 

  def opening_message
    puts "Welcome to Connect Four"
    puts "Player pieces are shown as 'X' and computer pieces are shown as 'O'"
    @game_board.render
  end 

  def create_user_player
    puts "Please enter your username for todays game"
    @username = gets.chomp
    # add more text if we would like ....
    puts "Lets Begin!"
  end 

  def turn
    @turn_counter += 1
    # valid_input = ['a'.upcase,'b'.upcase,'c'.upcase,'d'.upcase,'e'.upcase,'f'.upcase,'a'.upcase]
    puts "#{@username}, Please enter the a column A-G where you want to place a piece"
    user_selection = gets.chomp

    until @valid_inputs.include?(user_selection.upcase) == true
      puts "That is an invalid input try again"
      user_selection = gets.chomp
    end
    @game_board.user_place_piece(user_selection)
    @game_board.render
    @user_win = @game_board.user_win?
     if @game_board.user_win? == true
       puts "#{@username} has won the Game!"
     else
       puts "Computer has placed a piece"
        @game_board.computer_place_piece
        @game_board.render
        @game_board.computer_win?
        if @game_board.computer_win? == true
          puts "The Computer has won the game :("
        end 
      end 
   end 

  def run_game
    until @turn_counter == 21 || @game_board.computer_win? == true || @user_win == true
      turn
    end 
    if @turn_counter == 21
      puts "DRAW!"
    end
  end 
end 
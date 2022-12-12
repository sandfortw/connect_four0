class Game
  attr_reader :turn_counter
  def initialize
    @game_board = Board.new
    @turn_counter = 0
    @valid_inputs = ["A", "B", "C", "D", "E", "F", "G"]
    @username2 "The computer"
    @player_2 = false
  end 

  def opening_message
    puts "Welcome to Connect Four"
    puts "Player 1's pieces are shown with an 'X' and player 2's pieces are shown with an 'O'."
    @game_board.render
  end

  def create_user_player
    puts "Player 1, please enter your username for today's game:"
    @username = gets.chomp
    # add more text if we would like ....
    puts "Let's Begin!"
  end 

  def get_player_2_name
    puts "Would you like a second human player? y/n"
    @answer = gets.chomp
    until @answer.upcase == "Y" || @answer.upcase == "YES" ||@answer.upcase == "N" ||@answer.upcase == "NO"
      puts "That is an invalid input; try again."
        @answer = gets.chomp
    end

    if @answer.upcase == "Y" || @answer.upcase == "YES"
      @player_2 = true
      puts "Player 2, please enter your username for today's game:"
      @username2 = gets.chomp
    elsif @answer.upcase == "N" || @answer.upcase == "NO"
      @player_2 = false
      puts "Player 2 will be a computer."
    else
      puts 'ERROR'
      @player_2 = nil
    end
  end
  
  def turn
    @turn_counter += 1
    # valid_input = ['a'.upcase,'b'.upcase,'c'.upcase,'d'.upcase,'e'.upcase,'f'.upcase,'a'.upcase]
    puts "#{@username}, please enter a column A-G where you want to place a piece."
    user_selection = gets.chomp

    until @valid_inputs.include?(user_selection.upcase) == true
      puts "That is an invalid input; try again."
      user_selection = gets.chomp
    end
    @game_board.user_place_piece(user_selection)
    @game_board.render
    @user_win = @game_board.user_win?
     if @game_board.user_win? == true
       puts "#{@username} has won the Game!"
     else
        letters = ["A", "B", "C", "D", "E", "F", "G"]
        random_number = [0, 1, 2, 3, 4, 5, 6].shuffle.first
        @game_board.computer_place_piece(random_number)
        @game_board.render
        puts "The computer placed on column #{letters[random_number]}."
        @game_board.computer_win?
        if @game_board.computer_win? == true
          puts "The computer has won the game. :("
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
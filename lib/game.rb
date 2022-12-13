class Game
  attr_reader :turn_counter

  def initialize
    @game_board = Board.new
    @turn_counter = 0
    @valid_inputs = %w[A B C D E F G]
    @username2 = 'The computer'
    @player_2 = false
    @letters_hash = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      'D' => 3,
      'E' => 4,
      'F' => 5,
      'G' => 6
    }
  end

  def opening_message
    puts 'Welcome to Connect Four'
    puts "Player 1's pieces are shown with an 'X' and player 2's pieces are shown with an 'O'."
    @game_board.render
  end

  def create_user_player
    puts "Player 1, please enter your username for today's game:"
    @username = gets.chomp
  end

  def get_player_2_name
    puts 'Would you like a second human player? y/n'
    @answer = gets.chomp
    until @answer.upcase == 'Y' || @answer.upcase == 'YES' || @answer.upcase == 'N' || @answer.upcase == 'NO'
      puts 'That is an invalid input; try again.'
      @answer = gets.chomp
    end

    if @answer.upcase == 'Y' || @answer.upcase == 'YES'
      @player_2 = true
      puts "Player 2, please enter your username for today's game:"
      @username2 = gets.chomp
    elsif @answer.upcase == 'N' || @answer.upcase == 'NO'
      @player_2 = false
      puts 'Player 2 will be a computer.'
    else
      puts 'ERROR'
      @player_2 = nil
    end
  end

  def turn
    #Player 1 always starts
    @turn_counter += 1
    puts "#{@username}, please enter a column A-G where you want to place a piece."
    user_selection = gets.chomp
    until @valid_inputs.include?(user_selection.upcase) == true &&
          @game_board.matrix.column(@letters_hash[user_selection.upcase]).to_a.map { |cell| cell.render }.include?('.')
      puts 'That is an invalid input; try again.'
      user_selection = gets.chomp
    end
    @game_board.user_place_piece(user_selection)
    @game_board.render
    puts "#{@username} placed on column #{user_selection.upcase}."
    @user_win = @game_board.user_win?
    if @game_board.user_win? == true
      puts "#{@username} has won the Game!"
    else
      letters = %w[A B C D E F G]
      if @player_2 == false
        @number = [0, 1, 2, 3, 4, 5, 6].sample
      else #If player 1 didn't win, player 2 plays. Randomizes the play if it is a computer, gets if there is a player 2
        puts "#{@username2}, select a column A-G where you want to place a piece."
        @user2_selection = gets.chomp.upcase
        until @valid_inputs.include?(@user2_selection.upcase) == true
          puts 'That is an invalid input; try again.'
          @user2_selection = gets.chomp.upcase
        end
        @number = @letters_hash[@user2_selection]
      end

      @game_board.computer_place_piece(@number)
      @game_board.render
      puts "#{@username2} placed on column #{letters[@number]}."
      @game_board.computer_win?
      puts "#{@username2} has won the game!" if @game_board.computer_win? == true
    end
  end

  def run_game
    opening_message
    create_user_player
    get_player_2_name
    turn until @turn_counter == 21 || @game_board.computer_win? == true || @user_win == true
    return unless @turn_counter == 21

    puts 'DRAW!'
  end
end

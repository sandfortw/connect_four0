class Game

  def initialize
    @game_board = Board.new
  end 

  def opening_message
    puts "Welcome to Connect Four"
    #..... add more ......
  end 

  def create_user_player
    puts "Please enter your username for todays game"
    @username = gets.chomp
  end 
end 
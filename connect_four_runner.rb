require './lib/piece'
require './lib/cell'
require './lib/board'
require './lib/game'

game = Game.new
game.opening_message
game.create_user_player
game.get_player_2_name
game.run_game



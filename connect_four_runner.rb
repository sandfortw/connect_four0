require './lib/piece'
require './lib/cell'
require './lib/board'
require './lib/game'

game = Game.new
game.opening_message
game.create_user_player
game.run_game



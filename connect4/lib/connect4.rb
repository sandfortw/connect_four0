# frozen_string_literal: true

require_relative "connect4/version"
require 'piece'
require 'cell'
require 'board'
require 'game'

module Connect4
  class Error < StandardError; end
  # Your code goes here...

  class Runner 
    def run
      game = Game.new
      game.run_game
    end
  end
end

# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/code'

new_game = Game.new
new_game.play


# Pseudocode for Mastermind V2

# Create an array of arrays of all possibilities
# Where do I stick this?
a = ['R', 'O', 'Y', 'G', 'B', 'P']
p a.repeated_permutation(4).to_a

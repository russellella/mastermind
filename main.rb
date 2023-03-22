require_relative "lib/game"
require_relative "lib/board"
require_relative "lib/code"

COLOR_CODE = {
  "R" => "\u{1F534}",
  "O" => "\u{1F7E0}",
  "Y" => "\u{1F7E1}",
  "G" => "\u{1F7E2}",
  "B" => "\u{1F535}",
  "P" => "\u{1F7E3}",
  "H" => "\u{1F7E5}",
  "W" => "\u2B1C"
}

new_game = Game.new
new_game.play
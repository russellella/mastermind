# frozen_string_literal: true

# Setup for guess and hint boards
class Board
  attr_accessor :board

  def initialize
    @board = []
  end

  def add_color(color)
    @board << color
  end

  def display
    puts @board.map { |key| COLOR_CODE.fetch(key) }.join('')
  end
end

COLOR_CODE = {
  'R' => '\u{1F534}',
  'O' => '\u{1F7E0}',
  'Y' => '\u{1F7E1}',
  'G' => '\u{1F7E2}',
  'B' => '\u{1F535}',
  'P' => '\u{1F7E3}',
  'H' => '\u{1F7E5}',
  'W' => '\u2B1C'
}.freeze

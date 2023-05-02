# frozen_string_literal: true

require_relative 'messages.rb'

# Basic gameplay for Mastermind
class Game
  include Messages

  def initialize
    @guess_board = Board.new
    @hint_board = Board.new
    @secret_code
    @win = false
    @user
  end

  # Create method that has game intro, then play loop, then end?

  def begin_game
    puts message_welcome
    user_input
    # check if/else below:
    if @user = 'maker'
      puts message_maker_instructions
      code_input
      @secret_code = @guess_board
      play_maker
    elsif @user = 'breaker'
      puts message_breaker_instructions
      @secret_code = Code.new
      play_breaker
    end
  end

  def play_breaker
    12.times do
      code_input
      @guess_board.board.replace(input.split(''))
      break if check_equal

      @guess_board.display
      compare_breaker
      @hint_board.display
      @hint_board.board.clear
      @guess_board.board.clear
    end
    game_end_message
  end

  def play_maker
    6.times do
      comp_guess = color_array.sample
      p comp_guess
      break if comp_guess = secret_code
      compare_maker
    end
  end

  def code_input
    while (input = gets.chomp)
      if input =~ /\A[ROYGBP]*\z/ && input.length == 4
        input.split('')
        @guess_board.board.replace(input.split(''))
        break
      else
        puts 'Uh oh! Please only input a combination of 4 of these colors: ROYGBP'
      end
    end
  end

  def user_input
    while (input = gets.chomp)
      if input.downcase = 'maker'
        @user = 'maker'
        break
      elsif input.downcase = 'breaker'
        @user = 'breaker'
        break
      else
        puts 'Uh oh! Please type Maker or Breaker.'
      end
    end
  end

  def compare_breaker
    temp_array = []
    temp_array.replace(@secret_code.code)
    @guess_board.board.map.with_index do |v, i|
      if v == @secret_code.code[i]
        @hint_board.add_color('H')
        @guess_board.board[i] = 0
        temp_array[i] = 1
      end
    end
    @guess_board.board.map.with_index do |v, i|
      if temp_array.include?(v)
        @hint_board.add_color('W')
      end
    end
  end

  def compare_maker
    # Compare to secret code - use altered version of compare method?
      # If value at index = secret code, push 'H' to hint board - don't need to do this
        #else push 'Nil'?
      # Iterate over color_array - use select! ?
        # Take each array in color_array
        # If guess_array[i] == secret_code[i]
          # AND guess_array[i] == array[i]
          # Keep it
      color_array

  end

  def check_equal
    if @secret_code.code == @guess_board.board
      @win = true
    end
  end

  def game_end_message
    @secret_code.display_final
    if @win == true
      puts 'You win! You guessed the code correctly.' # fix w/ new message method
    else
      puts 'You lose. You did not guess the code.' # fix w/ new message method
    end
    # Alternatives to code in:
      # "You lost - the computer guessed your code."
      # "You won - the computer didn't guess your code."
  end

end

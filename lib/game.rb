# frozen_string_literal: true

# Basic gameplay for Mastermind
class Game
  def initialize
    @guess_board = Board.new
    @hint_board = Board.new
    @secret_code = Code.new
    @win = false
    puts "Time to play a game of Mastermind!
    The computer will generate a code of four random colors out of
    six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are:
    a red square for each correct color guessed in the right spot, and a
    white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"

    # New welcome message:
    # "It's time to play a game of Mastermind! Do you want to be a code maker or breaker?
      # Type 'maker' or 'breaker' :"

    # user_input 
      # if maker/breaker - set player to one of these?

    # maker_instructions:
    # "The computer will attempt to crack your code.
    # Put in a 4-color combination of the following colors: 
    #   R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
    # user_input

    # breaker_instructions:
    #   "The computer will generate a code of four random colors out of
    #  six possible, and you have twelve turns to guess it.
    #   After each guess, you'll get a code back telling you how close you are:
    #   a red square for each correct color guessed in the right spot, and a
    #   white square for each correct color in an incorrect spot.
    #   R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"

  end

  def play #play_breaker
    12.times do
      user_input
      break if check_equal

      @guess_board.display
      compare
      @hint_board.display
      @hint_board.board.clear
      @guess_board.board.clear
    end
    game_end_message
  end

  # play_maker
    # Loop: (how many times?)
    # Computer makes random guess (from possibility array)
    # p a.sample(4) # Doesn't work correctly - need to pick from array of arrays
    # Display computer's guess
    # break if guess = secret_code
    # compare_maker

  def user_input
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

  def compare #compare_breaker?
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

  #compare_maker
    # Compare to secret code - use altered version of compare method?
      # If value at index = secret code, push 'H' to hint board - don't need to do this
        #else push 'Nil'?
      # Iterate over possibility array
          #if value of guess[i] = secret_code[i], keep it (do nothing)
        # Else delete from array

  def check_equal
    if @secret_code.code == @guess_board.board
      @win = true
    end
  end

  def game_end_message
    @secret_code.display_final
    if @win == true
      puts 'You win! You guessed the code correctly.'
    else
      puts 'You lose. You did not guess the code.'
    end
    # Alternatives to code in:
      # "You lost - the computer guessed your code."
      # "You won - the computer didn't guess your code."
  end

end

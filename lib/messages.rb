# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Messages for Mastermind game

module Messages
  def message_welcome
    "It's time to play a game of Mastermind! Do you want to be a code maker or breaker?
    Type 'maker' or 'breaker' :"
  end

  def message_maker_instructions
    "The computer will attempt to crack your code.
    Put in a 4-color combination of the following colors: 
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
  end

  def message_breaker_instructions
    "The computer will generate a code of four random colors out of
    six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are:
    a red square for each correct color guessed in the right spot, and a
    white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
  end

  def message_maker_win
    "You win! The computer didn't guess your code."
  end

  def message_maker_lose
    "You lose. The computer guessed your code."
  end

  def message_breaker_win
    "You win! You guessed the code correctly."
  end

  def message_breaker_lose
    "You lose. You did not guess the code."
  end
end
# rubocop:enable Layout/LineLength

# Computer/Code Class
class Code
  def initialize
    @code = Array.new
  end
  def generate_code
    4.times { @code.push(["R","O","Y","G","B","P"].shuffle.first) }
  end
  
  def equal(arr)
    @code == arr
  end
  
  def compare
    #any? include?
    a1.map.with_index {|v, i| v == a2[i] } # go through array and compare via index to other array
  end
  
  def display_final
    @code.map! { |key| INDEX.fetch(key)}
  end
  
end

# Guess Board Class
class GuessBoard
  attr_accessor: @guess_board
  def initialize
    @guess_board = Array.new(4) { "\u26AB" }
  end

  def convert_input
    @guess_board.map! { |key| INDEX.fetch(key)}
  end
end

  # Initialize: Create array - empty circles (to push user input to)
  # Method: Compare code to secret
    # Compare 2 arrays
      # If includes one of colors, push a white in hint board
      # Compare each index, and if equal, push red to hint board
  # Method: Change board


class HintBoard
  def initialize
    @hint_board = Array.new(4) { "\u2B1B" }
  end
end
# Hint Board Class
  # Methods: Create array of four black squares


# Game Class
class Game
  def initialize
    # Put instructions: 1: Red, 2: Orange, 3: Yellow, 4: Green, 5: Blue, 6: Purple
    
  end

  def play
    12.times #or when game over
      #Display Guess Board
      #Display Hint Board
      input = gets.chomp
        if input =~ /\A[ROYGBP]*\z/ && input.length == 4
          input.split("")  # a.replace(b) - replace a with b
          @guess_board.replace(input.split("")) #Need to test this
        else
          puts "Uh oh! Please only input a combination of 4 of these colors: ROYGBP"
          input = gets.chomp
        end
    # Push input to Guess Board array
    # Run checker
  end
  # Display win/loss message + code
  # Method: Win/Loss Messages
end
    
# Where to put this? Needs to be used by both Code and Guess Board classes
COLOR_CODE = {
  "R" => "\u{1F534}",
  "O" => "\u{1F7E0}",
  "Y" => "\u{1F7E1}",
  "G" => "\u{1F7E2}",
  "B" => "\u{1F535}",
  "P" => "\u{1F7E3}",
}

### Color Mark Reference ###
# Red Circle "\u{1F534}"
# Orange Circle "\u{1F7E0}"
# Yellow Circle "\u{1F7E1}"
# Green Circle "\u{1F7E2}"
# Blue Circle "\u{1F535}"
# Purple Circle "\u{1F7E3}"

# Black Circle "\u26AB"

# Black Square "\u2B1B"
# Red Square "\u{1F7E5}"
# White Square "\u2B1C"
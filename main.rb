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
    
### Temp for testing: ###
guess = ["R", "O", "Y", "G"]
code = ["R", "O", "P", "O"]
hint = Array.new

  def compare(temp_array, code_array, hint)
    temp_array.map.with_index do |v, i|
      if v == code_array[i]
        hint << "\u{1F7E5}"
        temp_array.delete_at(i)
      end
    end
    white_squ = (a & b).flat_map { |n| [n]*[a.count(n), b.count(n)].min }
    white_squ.map do |i|
      hint_board << "\u2B1C"
    end
  end
  
  def display_final
    @code.map! { |key| INDEX.fetch(key)}
  end
end


class Board
  attr_accessor :board

  def initialize
    @board = Array.new
  end
  def to_color
    @board.map! { |key| INDEX.fetch(key)}
  end
  def display
    puts board.join("")
  end
end

class Game
  attr_accessor :guess_board, :hint_board
  def initialize
    @guess_board = Board.new
    @hint_board = Board.new
    puts "Time to play a game of Mastermind!
    The computer will generate a code of four random colors out of six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are: a red square for each correct color guessed in the right spot, and a white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
  end

  def play
    12.times do #or when game over
      guess_board.display
      hint_board.display
      while input = gets.chomp
        if input =~ /\A[ROYGBP]*\z/ && input.length == 4
          input.split("")
          @guess_board.replace(input.split(""))
          break
        else
          puts "Uh oh! Please only input a combination of 4 of these colors: ROYGBP"
        end
      end
      guess_board.compare # not going to work - method is in wrong class. How to do this?
      guess_board.clear
      hint_board.clear
    end
  end

  def end_message
    #display final code
    if # guess code == final code
      puts "You win! You guessed the code correctly."
    else
      puts "You lose. You didn't guess the code."
    end
end
    
# Where to put this? Needs to be used by both Code and Board classes
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
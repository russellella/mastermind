class Code
  attr_accessor :code
  def initialize
    @code = code
    @secret_code = Array.new
    generate_code
  end
  def generate_code
    4.times { @secret_code.push(["R","O","Y","G","B","P"].shuffle.first) }
  end
  
  def equal?
    @secret_code == @guess_board
  end
    
  def compare(guess_board, hint_board)
    temp_array = guess_board.board
    temp_array.map.with_index do |v, i|
      if v == secret_code[i]
        hint_board.board << "\u{1F7E5}"
        temp_array.delete_at(i)
      end
    end
    temp_array = (a & b).flat_map { |n| [n]*[a.count(n), b.count(n)].min }
    temp_array.map do |i|
      hint_board.board << "\u2B1C"
    end
  end
  
  def display_final
    @secret_code.map! { |key| INDEX.fetch(key)}
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
    @code = Code.new
    puts "Time to play a game of Mastermind!
    The computer will generate a code of four random colors out of six possible, and you have twelve turns to guess it.
    After each guess, you'll get a code back telling you how close you are: a red square for each correct color guessed in the right spot, and a white square for each correct color in an incorrect spot.
    R: Red, O: Orange, Y: Yellow, G: Green, B: Blue, P: Purple"
  end

  def play
    12.times do     #|| until guess_board.equal? do
      guess_board.display
      hint_board.display
      while input = gets.chomp
        if input =~ /\A[ROYGBP]*\z/ && input.length == 4
          input.split("")
          guess_board.board.replace(input.split(""))
          break
        else
          puts "Uh oh! Please only input a combination of 4 of these colors: ROYGBP"
        end
      end
      @code.compare(guess_board.board,hint_board.board)
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
end
    
COLOR_CODE = {
  "R" => "\u{1F534}",
  "O" => "\u{1F7E0}",
  "Y" => "\u{1F7E1}",
  "G" => "\u{1F7E2}",
  "B" => "\u{1F535}",
  "P" => "\u{1F7E3}",
}

newgame = Game.new
newgame.play